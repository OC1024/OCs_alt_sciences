data:extend({
    {
        type = "int-setting",
        name = "science-productivity-max-level",
        setting_type = "startup",
        default_value = -1,
        minimum_value = -1,
        maximum_value = 1024, -- easteregg
        order = "c-a"
    },
    {
        type = "int-setting",
        name = "science-productivity-bonus-per-level",
        setting_type = "startup",
        default_value = 5,
        allowed_values = { 5, 10 },
        -- minimum_value = 0,
        -- maximum_value = 10,
        order = "c-b"
    },
    {
        type = "bool-setting",
        name = "allow-planetary-sci-productivity",
        setting_type = "startup",
        default_value = true,
        order = "c-b"
    },
    {
        type = "bool-setting",
        name = "experimental-recipes",
        setting_type = "startup",
        default_value = false,
        order = "d"
    },
    -- {
    --     type = "bool-setting",
    --     name = "K2-custom-recipes",
    --     setting_type = "startup",
    --     default_value = true,
    --     order = "d-b"
    -- },
})