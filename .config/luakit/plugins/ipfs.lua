local luakit = require"luakit"
local modes = require"modes"
local msg = require"msg"

-- Ipfs bin path
function os.capture(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

local IPFS_PATH = os.capture("which ipfs")

-- Verify if ipfs bin exists in this system.
local function file_exists()
  local f=io.open(IPFS_PATH, "r")
    if f~=nil then io.close(f)
      return true
    else
      msg.warn("IPFS CLI not found.")
      return false
    end
end

-- Shortcuts keyboard
modes.add_binds("normal", {
  {
    "<Control-o>",
    "Init IPFS daemon",
    function ()
      if file_exists() == true then
        luakit.spawn("ipfs daemon")
      end
    end
  }
})

modes.add_binds("normal", {
  {
    "<Control-O>",
    "Disable IPFS daemon",
    function ()
      if file_exists() == true then
        luakit.spawn("ipfs shutdown")
      end
    end
  }
})

-- modes.add_cmds("normal", {
--   {
--     ":ipfs",
--     "IPFS CLI",
--     function ()
--       if file_exists() == true then
--         luakit.spawn(string.format("ipfs %q"))
--       end
--     end
--   }
-- })
