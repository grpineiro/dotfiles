local luakit = require"luakit"
local lfs = require"lfs"

local function loadall(dir)
  for file in lfs.dir(dir) do
    if string.find(file, ".lua$") then
      dofile(dir .. "/".. file)
    end
  end
end

loadall(luakit.config_dir .. "/plugins")
