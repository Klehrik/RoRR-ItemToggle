-- Item Toggle
-- Klehrik

mods["MGReturns-ENVY"].auto()
mods["RoRRModdingToolkit-RoRR_Modding_Toolkit"].auto(true)

file_path = path.combine(paths.plugins_data(), _ENV["!guid"].."-v3.txt")

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

item_table = {}
local can_toggle = true

require("./helper")



-- ========== Main ==========

Initialize(function()
    for i = 1, 5 do table.insert(item_table, {}) end

    -- Populate item_table
    local items = Item.find_all()
    for _, item in ipairs(items) do
        if item.tier <= Item.TIER.boss and item:is_loot() then
            local nsid = item.namespace.."-"..item.identifier
            local name = Language.translate_token(item.token_name)
            if not name then name = "<"..nsid..">" end
            table.insert(item_table[item.tier + 1], {
                nsid    = nsid,
                name    = name,
                toggle  = true,
                kind    = "item"
            })
        end
    end

    local equips = Equipment.find_all()
    for _, equip in ipairs(equips) do
        if equip:is_loot() then
            local nsid = equip.namespace.."-"..equip.identifier
            local name = Language.translate_token(equip.token_name)
            if not name then name = "<"..nsid..">" end
            table.insert(item_table[Item.TIER.equipment + 1], {
                nsid    = nsid,
                name    = name,
                toggle  = true,
                kind    = "equip"
            })
        end
    end


    -- Load file
    load_file()


    -- Add ImGui window
    gui.add_imgui(function()
        if ImGui.Begin("Item Toggle") then
            ImGui.Text("Click on the checkbox beside an\nitem to toggle it (check means enabled).")
            ImGui.Text("You will not be able to toggle\nitems during a run.")

            -- Items
            for c, tier in ipairs(item_table) do
                if c ~= (Item.TIER.equipment + 1) then
                    ImGui.Text("\n-=  "..TIERS[c].."  =-")

                    if ImGui.Button("Toggle all "..TIERS[c]) and can_toggle then
                        local toggle_type = false
                        for i, item in ipairs(tier) do
                            if not item.toggle then
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
                        local value, pressed = ImGui.Checkbox(item.name, item.toggle)
                        if pressed and can_toggle then toggle_item(item, value) end
                    end
                    ImGui.PopStyleColor()
                end
            end


            -- Equipment
            ImGui.Text("\n-=  "..TIERS[Item.TIER.equipment + 1].."  =-")

            if ImGui.Button("Toggle all "..TIERS[Item.TIER.equipment + 1]) and can_toggle then
                local toggle_type = false
                for i, equip in ipairs(item_table[Item.TIER.equipment + 1]) do
                    if not equip.toggle then
                        toggle_type = true
                        break
                    end
                end
                for i, equip in ipairs(item_table[Item.TIER.equipment + 1]) do
                    toggle_equipment(equip, toggle_type)
                end
            end

            ImGui.PushStyleColor(ImGuiCol.Text, COLORS[Item.TIER.equipment + 1])
            for i, equip in ipairs(item_table[Item.TIER.equipment + 1]) do
                local value, pressed = ImGui.Checkbox(equip.name, equip.toggle)
                if pressed and can_toggle then toggle_equipment(equip, value) end
            end
            ImGui.PopStyleColor()
        end

        ImGui.End()
    end)
end, true)


gm.pre_script_hook(gm.constants.run_create, function()
    can_toggle = false
end)

gm.pre_script_hook(gm.constants.run_destroy, function()
    can_toggle = true
end)