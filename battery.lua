local computer = require("computer")
local shell = require("shell")

local opts = shell.parse(...)

local energy = computer.energy()
local maxEnergy = computer.maxEnergy() / 100

if opts[1] == "nofloor" then
  print(tostring(energy / maxEnergy) .. "%")
elseif opts[1] == "raw" then
  print(tostring(energy) .. " / " .. tostring(computer.maxEnergy()))
elseif opts[1] == "ceil" then
  print(tostring(math.ceil(energy / maxEnergy)) .. "%")
elseif opts[1] == "help" then
  print("battery - outputs a battery percent floored\nbattery nofloor - outputs a battery percent\nbattery ceil - outputs a battery percent ceild\nbattery raw - outputs raw power data\nbattery help - shows this message")
else
  print(tostring(math.floor(energy / maxEnergy)) .. "%")
end
