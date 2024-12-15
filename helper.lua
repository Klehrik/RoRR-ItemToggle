-- Helper

function toggle_item(item, value)
    item.toggle = value
    Item.find(item.nsid):toggle_loot(value)
    save_file()
end


function toggle_equipment(equip, value)
    equip.toggle = value
    Equipment.find(equip.nsid):toggle_loot(value)
    save_file()
end


function save_file()
    local save = {}

    for c, tier in ipairs(item_table) do
        for i, item in ipairs(tier) do
            save[item.nsid] = item.toggle
        end
    end

    pcall(toml.encodeToFile, {save = save}, {file = file_path, overwrite = true})
end


function load_file()
    local success, file = pcall(toml.decodeFromFile, file_path)
    if success then

        for k, v in pairs(file.save) do
            local exit = false
            for c, tier in ipairs(item_table) do
                for i, item in ipairs(tier) do
                    if item.nsid == k then
                        if item.kind == "item" then toggle_item(item, v)
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