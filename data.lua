local util = require("__core__.lualib.util")

local option1 = { 30000, 50000, 70000 }
local option2 = { 30000, 30000, 30000 }
local option
local regeneration = 40

if settings.startup["EasyDemolisher-health"].value == "Option 1" then
  option = option1
elseif settings.startup["EasyDemolisher-health"].value == "Option 2" then
  option = option2
end


for name, entity in pairs(data.raw["segmented-unit"]) do
  if name == "small-demolisher" then
    entity.max_health = option[1]
    regeneration = entity.healing_per_tick
  elseif name == "medium-demolisher" then
    entity.max_health = option[2]
    if settings.startup["EasyDemolisher-regen"].value  then
      entity.healing_per_tick = regeneration
    end
  elseif name == "big-demolisher" then
    entity.max_health = option[3]
    if settings.startup["EasyDemolisher-regen"].value  then
      entity.healing_per_tick = regeneration
    end
  end
end

for name, entity in pairs(data.raw["segment"]) do
  if util.string_starts_with(name, "small") then
    entity.max_health = option[1]
  elseif util.string_starts_with(name, "medium") then
    entity.max_health = option[2]
  elseif util.string_starts_with(name, "big") then
    entity.max_health = option[3]
  end
end
