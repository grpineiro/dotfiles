local actions = require('telescope.actions')
local telescope = require('telescope')

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
    file_ignore_patterns = {
      "node_modules",
      "_build",
      "deps",
      ".git"
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    file_browser = {}
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
}

telescope.load_extension "file_browser"
telescope.load_extension "fzf"

--local function fugitave_integration()
--  local builtin = require('telescope.builtin')
--
--  if builtin.git_commits == true then
--    print("nothing...")
--  end
--end
--
--fugitave_integration()
