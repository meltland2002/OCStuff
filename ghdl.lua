local os = require("os")
local shell = require("shell")

local opts = shell.parse(...)

local ghurl = "https://raw.githubusercontent.com/"
local ocstuff = ghurl .. "meltland2002/OCStuff/main/"
local help = "ghdl help - shows this message\nghdl dl <user>/<repo>/<branch>/<path/to/file.txt> </download/to/path.txt> - downloads a raw github file to a path\nghdl ocstuff <path/to/file.txt> </download/to/path.txt> - downloads a raw github file from melt's ocstuff repo\nghdl mineos - downloads mineos bios and flashes it"

if opts[1] == nil then
  print(help)
elseif opts[1] == "dl" then
  print("Attempting to download " .. ghurl .. opts[2] .. " to " .. opts[3] .. "...")
  os.execute("wget -f \"" .. ghurl .. opts[2] .. "\" \"" .. opts[3] .."\"")
  print("Done! Check to see if file downloaded correctly.")
elseif opts[1] == "ocstuff" then
  print("Attempting to download " .. ocstuff .. opts[2] .. " to " .. opts[3] .. "...")
  os.execute("wget -f \"" .. ocstuff .. opts[2] .. "\" \"" .. opts[3] .."\"")
  print("Done! Check to see if file downloaded correctly.")
elseif opts[1] == "mineos" then
  print("Attempting to download " .. ghurl .. "IgorTimofeev/MineOS/master/Installer/BIOS.lua to /tmp/bios.lua...")
  os.execute("wget -f \"" .. ghurl .. "IgorTimofeev/MineOS/master/Installer/BIOS.lua\" \"/tmp/bios.lua\"")
  print("Done! Flashing...")
  os.execute("flash -q /tmp/bios.lua")
  print("Done! You may now reboot.")
else
  print("INVALID COMMAND: " .. opts[1] .. "\n\n" ..help)
end
