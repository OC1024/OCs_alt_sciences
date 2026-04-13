if mods["science-tab"] then
  data:extend({
    {
      type = "item-subgroup",
      name = "science-pack-alternative",
      group = "science",
      order = "yb",
    }
  })
else
  data:extend({
    {
      type = "item-subgroup",
      name = "science-pack-alternative",
      group = "intermediate-products",
      order = "yb",
    },
  })
end
