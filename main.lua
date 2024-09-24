-- Item Toggle v1.0.8
-- Klehrik

log.info("Successfully loaded ".._ENV["!guid"]..".")
mods.on_all_mods_loaded(function() for _, m in pairs(mods) do if type(m) == "table" and m.RoRR_Modding_Toolkit then Achievement = m.Achievement Actor = m.Actor Alarm = m.Alarm Array = m.Array Artifact = m.Artifact Buff = m.Buff Callback = m.Callback Class = m.Class Color = m.Color Equipment = m.Equipment Helper = m.Helper Instance = m.Instance Interactable = m.Interactable Item = m.Item Language = m.Language List = m.List Net = m.Net Object = m.Object Player = m.Player Resources = m.Resources Skill = m.Skill State = m.State Survivor_Log = m.Survivor_Log Survivor = m.Survivor Wrap = m.Wrap break end end end)

ItemToggle = true

local file_path = path.combine(paths.plugins_data(), _ENV["!guid"].."-v3.txt")

local TIERS = {
    "Common",
    "Uncommon",
    "Rare",
    "Equipment",
    "Boss"
}

local COLORS = {
    0xFFFFFFFF, -- White
    0xFF58B878, -- Green
    0xFF442DC9, -- Red
    0xFF3566D9, -- Orange
    0xFF41CDDA  -- Yellow
}

local items = {}
local can_toggle = true



-- ========== Functions ==========

function toggle_item(item, value)
    item[4] = value
    Item.find(item[2]):toggle_loot(value)
    save_file()
end


function toggle_equipment(equip, value)
    equip[4] = value
    Equipment.find(equip[2]):toggle_loot(value)
    save_file()
end


function save_file()
    local save = {}

    for c, tier in ipairs(items) do
        for i, item in ipairs(tier) do
            save[item[2]] = item[4]
        end
    end

    pcall(toml.encodeToFile, {save = save}, {file = file_path, overwrite = true})
end


function load_file()
    local success, file = pcall(toml.decodeFromFile, file_path)
    if success then

        for k, v in pairs(file.save) do
            local exit = false
            for c, tier in ipairs(items) do
                for i, item in ipairs(tier) do
                    if item[2] == k then
                        if item[5] == "item" then toggle_item(item, v)
                        else toggle_equipment(item, v) end
                        exit = true
                        break
                    end
                end
                if exit then break end
            end
        end

    end
end


-- ========== Main ==========

function __post_initialize()
    for i = 1, 5 do table.insert(items, {}) end

    -- Populate items
    for i, item in ipairs(Class.ITEM) do
        if item[7] <= 4.0 then
            local loc = item[1].."-"..item[2]
            local name = Language.translate_token(item[3])
            if not name then name = "<"..loc..">" end
            table.insert(items[item[7] + 1], {i, loc, name, true, "item"})
        end
    end

    for i, equip in ipairs(Class.EQUIPMENT) do
        local loc = equip[1].."-"..equip[2]
        local name = Language.translate_token(equip[3])
        if not name then name = "<"..loc..">" end
        table.insert(items[4], {i, loc, name, true, "equip"})
    end


    -- Load file
    load_file()


    -- Add ImGui window
    gui.add_imgui(function()
        if ImGui.Begin("Item Toggle") then
            ImGui.Text("Click on the checkbox beside an\nitem to toggle it (check means enabled).")
            ImGui.Text("You will not be able to toggle\nitems during a run.")

            -- Items
            for c, tier in ipairs(items) do
                if c ~= 4 then
                    ImGui.Text("\n-=  "..TIERS[c].."  =-")

                    if ImGui.Button("Toggle all "..TIERS[c]) and can_toggle then
                        local toggle_type = false
                        for i, item in ipairs(tier) do
                            if not item[4] then
                                toggle_type = true
                                break
                            end
                        end
                        for i, item in ipairs(tier) do
                            toggle_item(item, toggle_type)
                        end
                    end
                    
                    ImGui.PushStyleColor(ImGuiCol.Text, COLORS[c])
                    for i, item in ipairs(tier) do
                        local value, pressed = ImGui.Checkbox(item[3], item[4])
                        if pressed and can_toggle then toggle_item(item, value) end
                    end
                    ImGui.PopStyleColor()
                end
            end


            -- Equipment
            ImGui.Text("\n-=  "..TIERS[4].."  =-")

            if ImGui.Button("Toggle all "..TIERS[4]) and can_toggle then
                local toggle_type = false
                for i, equip in ipairs(items[4]) do
                    if not equip[4] then
                        toggle_type = true
                        break
                    end
                end
                for i, equip in ipairs(items[4]) do
                    toggle_equipment(equip, toggle_type)
                end
            end

            ImGui.PushStyleColor(ImGuiCol.Text, COLORS[4])
            for i, equip in ipairs(items[4]) do
                local value, pressed = ImGui.Checkbox(equip[3], equip[4])
                if pressed and can_toggle then toggle_equipment(equip, value) end
            end
            ImGui.PopStyleColor()
        end

        ImGui.End()
    end)
end


gm.pre_script_hook(gm.constants.run_create, function()
    can_toggle = false
end)

gm.pre_script_hook(gm.constants.run_destroy, function()
    can_toggle = true
end)