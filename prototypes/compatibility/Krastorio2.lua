-- [[ -- manual recipes
if settings.startup["K2-custom-recipes"].value then
  data:extend({
    { -- automation science
      type = "recipe",
      name = "oc-casting-automation-science-pack",
      icons = {
        {
          filename = "__Krastorio2Assets__/icons/cards/automation-tech-card.png",
          size = 64,
          scale = 0.5,
        },
        {
          filename = "__Krastorio2Assets__/icons/cards/automation-tech-card-light.png",
          size = 64,
          scale = 0.5,
          draw_as_light = true,
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
      energy_required = 20,
      ingredients = {
        -- 5 tech card (5tech-card = 1iron-plate + 2copper-cable)
        -- 1 automation core (2automation-core = 60molten-copper + 60molten-iron)
        { type = "fluid", name = "molten-iron",   amount = 70, fluidbox_multiplier = 4 },
        { type = "fluid", name = "molten-copper", amount = 70, fluidbox_multiplier = 4 },
      },
      results = {
        { type = "item", name = "automation-science-pack", amount = 5 }
      },
      allow_productivity = true,
    },
    { -- logistic science
      type = "recipe",
      name = "oc-casting-logistic-science-pack",
      icons = {
        {
          filename = "__Krastorio2Assets__/icons/cards/logistic-tech-card.png",
          size = 64,
          scale = 0.5,
        },
        {
          filename = "__Krastorio2Assets__/icons/cards/logistic-tech-card-light.png",
          size = 64,
          scale = 0.5,
          draw_as_light = true,
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
      energy_required = 20,
      ingredients = {
        -- 5 bank-tech-card = 1iron-plate + 2copper-cable
        -- 5 electronic-circuit
        -- 5 iron-gear-wheel
        { type = "fluid", name = "molten-iron",        amount = 60, fluidbox_multiplier = 4 },
        { type = "fluid", name = "molten-copper",      amount = 10, fluidbox_multiplier = 4 },
        { type = "item",  name = "electronic-circuit", amount = 5 },
      },
      results = {
        { type = "item", name = "logistic-science-pack", amount = 5 }
      },
      allow_productivity = true,
    },
    { -- military science
      type = "recipe",
      name = "oc-casting-military-science-pack",
      icons = {
        {
          filename = "__Krastorio2Assets__/icons/cards/military-tech-card.png",
          size = 64,
          scale = 0.5,
        },
        {
          filename = "__Krastorio2Assets__/icons/cards/automation-tech-card-light.png",
          size = 64,
          scale = 0.5,
          draw_as_light = true,
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
      energy_required = 20, -- only last step
      ingredients = {
        -- 5 bank-tech-card = 1iron-plate + 2copper-cable
        -- 5 electronic-compoents
        -- 1 biter-research-data = 5steel-plate + 5coke +10biomass
        { type = "fluid", name = "molten-iron",             amount = 160, fluidbox_multiplier = 4 },
        { type = "fluid", name = "molten-copper",           amount = 10,  fluidbox_multiplier = 4 },
        { type = "item",  name = "kr-coke",                 amount = 10 },
        { type = "item",  name = "biomass",                 amount = 10 },
        { type = "item",  name = "kr-electronic-compoents", amount = 5 }
      },
      results = {
        { type = "item", name = "military-science-pack", amount = 5 }
      },
      allow_productivity = true,
    },
    --[[
    { -- production science
      type = "recipe",
      name = "oc-pulse-production-science-pack",
      icons =
      {
        {
          filename = "__Krastorio2Assets__/icons/cards/production-tech-card.png",
          size = 64,
          scale = 0.5,
        },
        {
          filename = "__Krastorio2Assets__/icons/cards/production-tech-card-light.png",
          size = 64,
          scale = 0.5,
          draw_as_light = true,
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
      energy_required = 20, -- only last step
      ingredients = {
      -- 5 bank-tech-card = 1iron-plate + 2copper-cable
      -- 5 fast-transport-belt
      -- 5 productivity module = 5*(5 electric-circuit + 10 electronic-components)
      -- 5 uranium-238
        {type = "item", name = "kr-blank-tech-card", amount = 5},
        {type = "item", name = "fast-transport-belt", amount = 10},
        {type = "item", name = "uranium-238", amount = 5},
        {type = "item", name = "advanced-circuit", amount = 10},
        {type = "item", name = "rail", amount = 30},
      },
      results = {
        {type = "item", name = "production-science-pack", amount = 3}
      },
      allow_productivity = true,
    },
    -- ]]
  })
  local category_mapping = {
    ["chemical-science-pack"] = "organic-or-asssembling",
    ["production-science-pack"] = "electronics",
    ["utility-science-pack"] = "electronics",
  }
  change_multiple_crafting_category(category_mapping)
elseif settings.startup["legacy-recipes"].value then
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
