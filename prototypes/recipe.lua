local oc_helper = require("__OCs_base_assets__.prototypes.utils.helper")

if settings.startup["experimental-recipes"].value then -- generator_api created recipes
  local alt_recipe_dict = {
    ["automation-science-pack"] = "metallurgy",
    ["logistic-science-pack"]  ="metallurgy",
    ["military-science-pack"] = "metallurgy",
    ["chemical-science-pack"] = "organic",
    ["space-science-pack"] = "organic",
    ["production-science-pack"] = "electromagnetics",
    ["utility-science-pack"] = "electromagnetics",
  }
  local generator_api = require("__OCs_base_assets__.prototypes.utils.api")

  generator_api.batch_generator(alt_recipe_dict)
else -- manually created recipes
data:extend({ -- foundry/emp/biochamber/cryo science
  { -- automation science
    type = "recipe",
    name = "oc-casting-automation-science-pack",
    icons = {
      {
        icon = "__base__/graphics/icons/automation-science-pack.png",
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
    energy_required = 5,
    ingredients = {
      {type = "fluid", name = "molten-iron", amount = 10, fluidbox_multiplier = 4}, -- 1 iron-gear-wheel
      {type = "fluid", name = "molten-copper", amount = 10, fluidbox_multiplier = 4}, -- 1 copper-plate
    },
    results = {
      {type = "item", name = "automation-science-pack", amount = 1}
    },
    allow_productivity = true,
  },
  { -- logistic science
    type = "recipe",
    name = "oc-casting-logistic-science-pack",
    icons = {
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
    energy_required = 6,
    ingredients = {
      {type = "fluid", name = "molten-iron", amount = 40, fluidbox_multiplier = 4}, -- 2 iron-gear-wheel, 2 iron-plate
      {type = "item", name = "electronic-circuit", amount = 1},
    },
    results = {
      {type = "item", name = "logistic-science-pack", amount = 1}
    },
    allow_productivity = true,
  },
  { -- military science (molten metal version)
    type = "recipe",
    name = "oc-casting-military-science-pack",
    icons = {
      {
        icon = "__base__/graphics/icons/military-science-pack.png",
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
      {type = "fluid", name = "molten-iron", amount = 120, fluidbox_multiplier = 4}, -- 30*1steel, 10*9iron-plate
      {type = "fluid", name = "molten-copper", amount = 100, fluidbox_multiplier = 4}, -- 10*1copper-plate
      -- {type = "fluid", name = "lava", amount = 660, fluidbox_multiplier = 2}, -- 30*1steel, 10*9iron-plate, 10*1copper-plate, 10*5*2stone = 330 lava. volume x2
      {type = "item", name = "coal", amount = 10}, -- 10coal
      -- {type = "item", name = "calcite", amount = 1}, -- make it so it resemble around 500 lava per calcite
      {type = "item", name = "stone-brick", amount = 10}, -- 20stone=10stone-brick=2wall
    },
    results = {
      {type = "item", name = "military-science-pack", amount = 2}
    },
    allow_productivity = true,
  },
  { -- military science (Vulcanus/lava version)
    type = "recipe",
    name = "oc-lava-to-military-science-pack",
    icons = {
      {
        icon = "__base__/graphics/icons/military-science-pack.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-lava-droplet.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "metallurgy",
    subgroup = "science-pack-alternative",
    enabled = false,
    energy_required = 20, -- volume x2
    ingredients = {
      {type = "fluid", name = "lava", amount = 660, fluidbox_multiplier = 2}, -- 30*1steel, 10*9iron-plate, 10*1copper-plate, 10*20*stone = 330 lava. volume x2
      {type = "item", name = "coal", amount = 20}, -- 10coal volume x2
      {type = "item", name = "calcite", amount = 1}, -- make it so it resemble around 500 lava per calcite
    },
    results = {
      {type = "item", name = "military-science-pack", amount = 4}
    },
    allow_productivity = true,
  },
  { -- chemical science (biochamber/new)
    type = "recipe",
    name = "oc-bio-chemical-science-pack",
    icons = {
      {
        icon = "__base__/graphics/icons/chemical-science-pack.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-biochamber.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "organic",
    subgroup = "science-pack-alternative",
    enabled = false,
    energy_required = 24,
    ingredients = {
      {type = "item", name = "engine-unit", amount = 1},
      {type = "item", name = "advanced-circuit", amount = 3},
      {type = "item", name = "sulfur", amount = 1},
    },
    results = {
      {type = "item", name = "chemical-science-pack", amount = 2}
    },
    allow_productivity = true,
  },
  { -- space science (biochamber/new)
    type = "recipe",
    name = "oc-bio-space-science-pack",
    icons = {
      {
        icon = "__base__/graphics/icons/space-science-pack.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-biochamber.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "organic", -- submod "OCs_ammo_casting" has optionally space-fish-breeding so there's a positive feedback loop if bioflux recipe is not enough
    subgroup = "science-pack-alternative",
    enabled = false,
    energy_required = 15,
    ingredients = {
      {type = "item", name = "iron-plate", amount = 2},
      {type = "item", name = "ice", amount = 1},
      {type = "item", name = "carbon", amount = 1},
    },
    results = {
      {type = "item", name = "space-science-pack", amount = 5}
    },
    surface_conditions =  {
      {
        property = "gravity",
        min = 0,
        max = 0
      }
    },
    allow_productivity = true,
  },
  { -- production science EM (new)
    type = "recipe",
    name = "oc-pulse-production-science-pack",
    icons = {
      {
        icon = "__base__/graphics/icons/production-science-pack.png",
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
    energy_required = 21, -- only last step 21
    ingredients = { -- doing the last two steps in the em plant (more would be to much throughput)
    -- 5 red circut +10stone-brick+10steel-plate+5s=electric-furnace
    -- 5 green circuit + 5advanced-circuit  +15s = productivity-module
    -- 1electric-furnanc + 1productivity-module +30rail +21s = 3production-science-pack
      {type = "item", name = "steel-plate", amount = 10}, -- for rails and electric furnance 10
      {type = "item", name = "advanced-circuit", amount = 10},
      {type = "item", name = "rail", amount = 30},
      {type = "item", name = "stone-brick", amount = 10},
      {type = "item", name = "electronic-circuit", amount = 5},
    },
    results = {
      {type = "item", name = "production-science-pack", amount = 3}
    },
    allow_productivity = true,
  },
  { -- utility science EM
    type = "recipe",
    name = "oc-pulse-utility-science-pack",
    icons = {
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
    energy_required = 21, -- only last step 21
    ingredients = { -- doing the last two steps in the em plant (more would be to much throughput)
    -- LDS just as it is
    -- 1flying robot frame = 1steel-plate+2battery +3electronic-circuit +1electric-engine-unit
    -- 2processing-unit = 2*2advanced-circuit + 2*20electric-ciruit + 2*5sulfuric-acid 2*10s
      {type = "item", name = "low-density-structure", amount = 3}, -- not carftable in em-plant
      {type = "item", name = "electronic-circuit", amount = 2*20},
      {type = "item", name = "advanced-circuit", amount = 2*2},
      {type = "item", name = "flying-robot-frame", amount = 1},
      -- {type = "item", name = "steel-plate", amount = 1},
      -- {type = "item", name = "electric-motor", amount = 1},
      -- {type = "item", name = "battery ", amount = 2},
      {type = "fluid", name = "sulfuric-acid", amount = 2*5}, --  2*10processing-unit
      -- {type = "fluid", name = "lubricant", amount = 15}, -- 15*1e-motor
    },
    results = {
      {type = "item", name = "utility-science-pack", amount = 3}
    },
    allow_productivity = true,
  },
})
end

if mods["science-tab"] then
  local mapping = {
    ["oc-casting-automation-science-pack"] = "science-pack-alternative",
    ["oc-casting-logistic-science-pack"] = "science-pack-alternative",
    ["oc-casting-military-science-pack"] = "science-pack-alternative",
    ["oc-lava-to-military-science-pack"] = "science-pack-alternative",
    ["oc-bio-chemical-science-pack"] = "science-pack-alternative",
    ["oc-bio-space-science-pack"] = "science-pack-alternative",
    ["oc-pulse-production-science-pack"] = "science-pack-alternative",
    ["oc-pulse-utility-science-pack"] = "science-pack-alternative",
  }
  oc_helper.change_recipes_subgroup(mapping)
end