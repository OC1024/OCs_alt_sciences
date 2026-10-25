local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")

if settings.startup["experimental-recipes"].value then
  -- copy metal based version
  local r_metal = table.deepcopy(data.raw.recipe["oc-casting-military-science-pack"])

  -- create new lava-based recipe
  -- create overwrites "oc-casting-military-science-pack"
  generator_api.batch_generator({ ["military-science-pack"] = "metallurgy" })
  local r_lava = table.deepcopy(data.raw.recipe["oc-casting-military-science-pack"])
  r_lava.name = "oc-casting-military-science-pack-from-lava"
  data:extend({ r_lava })
  oc_recipe.replace_ingredient(r_lava.name, "fluid", "molten-copper", "fluid", "lava")
  oc_recipe.add_ingredient(r_lava.name, "item", "calcite")

  -- overwrite metal-based version
  data.raw.recipe["oc-casting-military-science-pack"] = r_metal
  -- oc_recipe.replace_ingredient(r_metal.name, "item", "stone", "item", "stone-brick", 10)

  -- unlock new recipe with the same tech
  oc_tech.add_tech_unlocks({ ["foundry-science-packs-tech"] = { r_metal.name, r_lava.name } })
  -- Add crafting productivity bonus to all levels of the productivity technology
  for tech_name, _ in pairs(data.raw.technology) do
    if string.match(tech_name, "^foundry%-science%-packs%-productivity%-tech%-?%d*$") then
      oc_tech.add_productivity_bonus(tech_name, r_lava.name, 0.1)
    end
  end

  -- allow productivity modules
  oc_recipe.allow_productivity({ r_metal.name, r_lava.name })
else  -- manually created recipes
  data:extend({
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
          icon = "__space-age__/graphics/icons/fluid/lava.png",
          icon_size = 64,
          icon_mipmaps = 4,
          scale = 0.25,
          shift = { -4, -8 },
        }
      },
      categories = { "metallurgy" },
      subgroup = "science-pack-alternative",
      enabled = false,
      energy_required = 20,                                                          -- volume x2
      ingredients = {
        { type = "fluid", name = "lava",    amount = 660, fluidbox_multiplier = 2 }, -- 30*1steel, 10*9iron-plate, 10*1copper-plate, 10*20*stone = 330 lava. volume x2
        { type = "item",  name = "coal",    amount = 20 },                           -- 10coal. volume x2
        { type = "item",  name = "calcite", amount = 1 },                            -- make it so it resemble around 500 lava per calcite
      },
      results = {
        { type = "item", name = "military-science-pack", amount = 4 }
      },
      allow_productivity = true,
    },
  })
  -- unlock new recipe with the same tech
  oc_tech.add_tech_unlocks({ ["foundry-science-packs-tech"] = "oc-lava-to-military-science-pack" })
  -- Add crafting productivity bonus to all levels of the productivity technology
  for tech_name, _ in pairs(data.raw.technology) do
    if string.match(tech_name, "^foundry%-science%-packs%-productivity%-tech%-?%d*$") then
      oc_tech.add_productivity_bonus(tech_name, "oc-lava-to-military-science-pack", 0.1)
    end
  end
end
