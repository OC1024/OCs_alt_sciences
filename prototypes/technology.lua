-- alternative recipes for basic science packs in foundry, em-plant and biochamber
data:extend({
   { -- foundry sciences early-tech sciences
    type = "technology",
    name = "foundry-science-packs-tech",
    icon = "__OCs_alt_sciences__/graphics/technology/casting-science-packs2.png",
    icon_size = 256, icon_mipmaps = 4,
    prerequisites = {"metallurgic-science-pack","space-science-pack","production-science-pack","utility-science-pack","military-science-pack"}, --some are indirect prereqs (red, green, blue))
    unit = {
      ingredients = { -- cast-able science packs are used twice as the rest
        {"automation-science-pack", 2},
        {"logistic-science-pack", 2},
        {"chemical-science-pack", 1},
        {"military-science-pack", 2},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 2},
      },
      time = 60,
      count = 500
      },
      effects = {
        {type = "unlock-recipe", recipe = "casting-automation-science-pack"},
        {type = "unlock-recipe", recipe = "casting-logistic-science-pack"},
        {type = "unlock-recipe", recipe = "casting-military-science-pack"},
        {type = "unlock-recipe", recipe = "lava-to-military-science-pack"}, -- Vulcanus/old version
        -- {type = "unlock-recipe", recipe = "casting-production-science-pack"},
        -- {type = "unlock-recipe", recipe = "casting-rail"}, -- needed to make some sense for the production science
      },
  },
  { -- em-plant sciences mid-tech sciences
  type = "technology",
  name = "emp-science-packs-tech",
  icon = "__OCs_alt_sciences__/graphics/technology/em-science-packs3.png",
  icon_size = 256, icon_mipmaps = 4,
  prerequisites = {"electromagnetic-science-pack","space-science-pack","utility-science-pack","production-science-pack"}, --some are indirect prereqs (red, green, blue))
  unit = {
    ingredients = { -- em-able science packs are used twice as the rest
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"production-science-pack", 2},
      {"utility-science-pack", 2},
      {"space-science-pack", 1},
      {"electromagnetic-science-pack", 2},
    },
    time = 60,
    count = 500
    },
    effects = {
      {type = "unlock-recipe", recipe = "em-utility-science-pack"},
      {type = "unlock-recipe", recipe = "em-production-science-pack"},
      -- {type = "unlock-recipe", recipe = "em-electromagnetic-science-pack"}, -- already there
    },
  },
  { -- biochamber sciences early-midtech sciences
  type = "technology",
  name = "biochamber-science-packs-tech",
  icon = "__OCs_alt_sciences__/graphics/technology/biochamber-science-packs.png",
  icon_size = 256, icon_mipmaps = 4,
  prerequisites = {"agricultural-science-pack","space-science-pack","chemical-science-pack",}, --some are indirect prereqs (biochamber, chemical-science-pack))
  unit = {
    ingredients = { -- biochamber-able science packs are used twice as the rest
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 2},
      {"production-science-pack", 1},
      {"utility-science-pack", 1},
      {"space-science-pack", 2},
      {"agricultural-science-pack", 2},
    },
    time = 60,
    count = 500
    },
    effects = {
      {type = "unlock-recipe", recipe = "biochamber-chemical-science-pack"},
      {type = "unlock-recipe", recipe = "biochamber-space-science-pack"},
      -- {type = "unlock-recipe", recipe = "biochamber-agricultural-science-pack"}, -- already there
    },
  },
  { -- cryogenic-plant sciences late-game sciences
    type = "technology",
    name = "cryoplant-science-packs-tech",
    icon = "__OCs_alt_sciences__/graphics/technology/cryo-science-packs2.png",
    icon_size = 256, icon_mipmaps = 4,
    prerequisites = {"emp-science-packs-tech","foundry-science-packs-tech","biochamber-science-packs-tech","promethium-science-pack"}, --some are indirect prereqs (cryogenic)
    unit = {
      ingredients = { -- cryo-able science packs are used twice as the rest
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"electromagnetic-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"cryogenic-science-pack", 2},
        {"promethium-science-pack", 2},
      },
      time = 90,
      count = 2000
    },
    effects = { -- non but key technology
        -- {type = "unlock-recipe", recipe = "cryo-cryogenic-science-pack"}, -- already there
        -- {type = "unlock-recipe", recipe = "cryo-promethium-science-pack"}, -- already there
    },
  },
})

-- Determine max level for productivity tech and creating the techs
local max_level_setting = settings.startup["science-productivity-max-level"].value
if max_level_setting == 0 then
  return -- Skip defining the prod-bonus-tech entirely
else
  local max_level
  if max_level_setting == -1 then
      max_level = "infinite"
  else
      max_level = max_level_setting
  end

  local function create_prod_bonus_tech(name, prereq, recipes)
    -- Get icon details from the prerequisite tech
    local base_icon = data.raw["technology"][prereq].icon

    -- Collect all recipes from the prerequisite tech and add additional recipes
    local productivity_effects = {}

    -- Function to add a productivity effect for a recipe
    local function add_productivity_effect(recipe)
      table.insert(productivity_effects, {
        type = "change-recipe-productivity",
        recipe = recipe,
        change = 0.05, -- +5% productivity per level
        effect_description = {"technology-description." .. name}
      })
    end

    -- Process all recipes unlocked by the prerequisite tech
    for _, effect in pairs(data.raw["technology"][prereq].effects) do
      if effect.type == "unlock-recipe" and effect.recipe then
        add_productivity_effect(effect.recipe)
      end
    end

    local allow_planetary_prod = settings.startup["allow-planetary-sci-productivity"].value
    if allow_planetary_prod then
      for _, recipe in pairs(recipes) do
        add_productivity_effect(recipe)
      end
    end

    return {
      type = "technology",
      name = name,
      icons = util.technology_icon_constant_recipe_productivity(base_icon), --reusing the vanilla prod icon as overlayer
      prerequisites = {prereq},
      effects = productivity_effects, 
      unit = {
        ingredients = data.raw["technology"][prereq].unit.ingredients,
        count_formula = "1000*2^(L/2)", -- Exponential scaling
        time = data.raw["technology"][prereq].unit.time
      },
      upgrade = true,
      max_level = max_level,
      -- order = "z-" .. name
    }
  end

  -- Create separate techs for the alternative recipes
  data:extend({
    create_prod_bonus_tech("foundry-science-packs-productivity-tech", "foundry-science-packs-tech", {"metallurgic-science-pack"}),
    create_prod_bonus_tech("emp-science-packs-productivity-tech", "emp-science-packs-tech", {"electromagnetic-science-pack"}),
    create_prod_bonus_tech("biochamber-science-packs-productivity-tech", "biochamber-science-packs-tech", {"agricultural-science-pack"}),
    create_prod_bonus_tech("cryoplant-science-packs-productivity-tech", "cryoplant-science-packs-tech", {"cryogenic-science-pack","promethium-science-pack"}),
  })

  -- Overwrite cryoplant tech cost with research trigger
  local cryo_tech = data.raw.technology["cryoplant-science-packs-tech"]
  if cryo_tech then
    cryo_tech.unit = nil -- Clear old unit definition
    cryo_tech.research_trigger = {
      type = "craft-item",
      item = "promethium-science-pack",
      count = 10,
    }
  end
end
