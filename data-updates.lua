-- require("prototypes/entity-update")
-- require("prototypes/item-update")
-- require("prototypes/recipe-update")
-- require("prototypes/technology-update")

-- [[
if mods["aai-industry"] then
    require("prototypes.compatibility.aai-industry")
end
if mods["Krastorio2-spaced-out"] then -- replaces normal Krastorio2 with space-age compatible version
    require("__OCs_base_assets__.prototypes.compatibility.Krastorio2")
    require("prototypes.compatibility.Krastorio2")
end
-- ]]