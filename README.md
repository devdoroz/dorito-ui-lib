# dorito-ui-lib
totally not a copy of cheeto hub

example usage:

```lua
local doritoLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/devdoroz/dorito-ui-lib/main/main.lua", true))()

local gui = doritoLib.new()

local cat = gui:CreateCategory(":fire:")

cat:CreateToggle("Mags")
cat:CreateSlider("Mags Power", 1, 20, 1)
cat:CreateSwitch("Mags Type", {"Regular", "Legit", "Blatant", "League"})
cat:CreateButton("Lag Reducer", function()
	print("I was clicked..")
end)
```
