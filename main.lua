-- Item Toggle v1.0.3
-- Klehrik

log.info("Successfully loaded ".._ENV["!guid"]..".")
require("./helper")
Items = require("./items")

local white_toggle = {}
local green_toggle = {}
local red_toggle = {}
local orange_toggle = {}
local yellow_toggle = {}
for i = 1, #Items.white_items do table.insert(white_toggle, true) end
for i = 1, #Items.green_items do table.insert(green_toggle, true) end
for i = 1, #Items.red_items do table.insert(red_toggle, true) end
for i = 1, #Items.orange_items do table.insert(orange_toggle, true) end
for i = 1, #Items.yellow_items do table.insert(yellow_toggle, true) end

local file_path = path.combine(paths.plugins_data(), "Klehrik-Item_Toggle.txt")
local succeeded, from_file = pcall(toml.decodeFromFile, file_path)
if succeeded then
    -- Load from file
    white_toggle = from_file.white
    green_toggle = from_file.green
    red_toggle = from_file.red
    orange_toggle = from_file.orange
    yellow_toggle = from_file.yellow
end



-- ========== Main ==========

local rarity = {Items.rarities.white, Items.rarities.green, Items.rarities.red, Items.rarities.orange, Items.rarities.yellow}
local rarity_names = {"Common", "Uncommon", "Rare", "Equipment", "Boss"}
local rarity_toggles = {white_toggle, green_toggle, red_toggle, orange_toggle, yellow_toggle}
local rarity_item_tables = {Items.white_items, Items.green_items, Items.red_items, Items.orange_items, Items.yellow_items}


local function save_to_file()
    -- Save to file
    pcall(toml.encodeToFile, {
        white = white_toggle,
        green = green_toggle,
        red = red_toggle,
        orange = orange_toggle,
        yellow = yellow_toggle,
    }, {file = file_path, overwrite = true})
end


-- Loop through all rarities and add all item buttons
for r = 1, #rarity_names do
    gui.add_imgui(function()
        if ImGui.Begin(rarity_names[r]) then
            local toggle = rarity_toggles[r]
            local can_toggle = not find_cinstance_type(gm.constants.oStageControl)

            if not can_toggle then ImGui.Text("Toggling is locked during a run.") end

            if ImGui.Button("Enable All") and can_toggle then
                for i = 1, #toggle do toggle[i] = true end
                save_to_file()
            elseif ImGui.Button("Disable All") and can_toggle then
                for i = 1, #toggle do toggle[i] = false end
                save_to_file()
            end

            ImGui.Text("")

            local names = Items.get_item_names(rarity[r])
            for i = 1, #names do
                local c = "  "
                if toggle[i] then c = "v" end
                if ImGui.Button("["..c.."]  "..names[i]) and can_toggle then
                    toggle[i] = not toggle[i]
                    save_to_file()
                end
            end

        end

        ImGui.End()
    end)
end


local function get_random_enabled(rarity)
    local enabled = {}
    local toggle = rarity_toggles[rarity]
    for i = 1, #toggle do
        if toggle[i] then
            local entry = rarity_item_tables[rarity][i]
            if entry then
                if entry[2] ~= gm.constants.oStrangeBattery then
                    table.insert(enabled, entry[2])
                end
            end
        end
    end

    if #enabled <= 0 then return nil end

    return enabled[gm.irandom_range(1, #enabled)]
end


gm.pre_script_hook(gm.constants.__input_system_tick, function()
    -- Loop through all instances and check if it is a dropped item
    --     If so, check if it is disabled
    --         If so, delete it and replace it with an enabled item
    for i = 1, #gm.CInstance.instances_active do
        local inst = gm.CInstance.instances_active[i]
        if inst then

            -- Check if this instance is actually an item or not
            if inst.item_id ~= nil then

                local pos, item = Items.find_item(inst.object_index)
                if item then

                    -- Get toggle table of item based on rarity
                    local rarity = item[3]
                    if rarity ~= Items.rarities.purple then
                        
                        local toggle = rarity_toggles[rarity]

                        -- Subtract pos by length of previous rarities
                        if rarity > 1 then pos = pos - #Items.white_items end
                        if rarity > 2 then pos = pos - #Items.green_items end
                        if rarity > 3 then pos = pos - #Items.red_items end
                        if rarity > 4 then pos = pos - #Items.orange_items end
                        
                        -- If disabled, destroy and replace with
                        -- random enabled item of the same rarity
                        if not toggle[pos] then
                            local rand_item = get_random_enabled(rarity)
                            if rand_item then gm.instance_create_depth(inst.x, inst.y, 0.0, rand_item) end
                            gm.instance_destroy(inst)
                        end
                    end

                end

            end
        end
    end
end)