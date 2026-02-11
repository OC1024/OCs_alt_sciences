-- [[ -- manual recipes
if settings.startup["legacy-recipes"].value then
  data:extend({
    { -- logistic science
      type = "recipe",
      name = "casting-logistic-science-pack",
      icons =
      {
        {
          icon = "__base__/graphics/icons/logistic-science-pack.png",
          icon_size = 64,
          icon_mipmaps = 4,
        },
        {
          icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-molten-iron.png",
          icon_size = 64,
          icon_mipmaps = 4,
        }
      },
      category = "metallurgy",
      subgroup = "science-pack-alternative",
      enabled = false,
      energy_required = 10,
      ingredients = {
        -- 1 inserter =
        -- 2 transporot-belt = iron-gear-wheel + motor (motor=)
        { type = "fluid", name = "molten-iron",        amount = 60, fluidbox_multiplier = 4 }, -- 3 iron-gear-wheel, 3 iron-plate
        { type = "item",  name = "electronic-circuit", amount = 1 },
      },
      results = {
        { type = "item", name = "logistic-science-pack", amount = 2 }
      },
      allow_productivity = true,
    },
    { -- utility science EM
      type = "recipe",
      name = "em-utility-science-pack",
      icons =
      {
        {
          icon = "__base__/graphics/icons/utility-science-pack.png",
          icon_size = 64,
          icon_mipmaps = 4,
        },
        {
          icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-em-plant.png",
          icon_size = 64,
          icon_mipmaps = 4,
        }
      },
      category = "electromagnetics",
      subgroup = "science-pack-alternative",
      enabled = false,
      energy_required = 35, -- only last step
      ingredients = { -- doing the last two steps in the em plant (more would be to much throughput)
      -- LDS just as it is
      -- 1flying robot frame = 1steel-plate+2battery +3electronic-circuit +1electric-engine-unit
      -- 3processing-unit = 3*2advanced-circuit + 3*20electric-ciruit + 3*5sulfuric-acid + 3*10s
        {type = "item", name = "low-density-structure", amount = 3}, -- not carftable in em-plant
        {type = "item", name = "electronic-circuit", amount = 3*20},
        {type = "item", name = "advanced-circuit", amount = 3*2},
        {type = "item", name = "flying-robot-frame", amount = 1},
        -- {type = "item", name = "steel-plate", amount = 1},
        -- {type = "item", name = "electric-motor", amount = 1},
        -- {type = "item", name = "battery ", amount = 2},
        {type = "fluid", name = "sulfuric-acid", amount = 3*5}, --  2*10processing-unit
        -- {type = "fluid", name = "lubricant", amount = 15}, -- 15*1e-motor
      },
      results = {
        {type = "item", name = "utility-science-pack", amount = 5}
      },
      allow_productivity = true,
    },
  })
else
  -- generator_api usage
  local generator_api = require("__OCs_base_assets__.prototypes.utils.api")

  local casting_dict = {
    ["automation-science-pack"] = "metallurgy",
    ["logistic-science-pack"] = "metallurgy",
    ["productivity-science-pack"] = "electromagnetics",
    ["utility-science-pack"] = "electromagnetics",
  }
  generator_api.batch_generator(casting_dict)
  -- as recipe names are just the same, techs are unchanged
end
