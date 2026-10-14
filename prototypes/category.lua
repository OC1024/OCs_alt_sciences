data:extend({
  {
    type = "item-subgroup",
    name = "science-pack-alternative",
    group = "intermediate-products",
    order = "yb",
  }
})
if mods["science-tab"] then
  data.raw["item-subgroup"]["science-pack-alternative"].group = "science"
end
