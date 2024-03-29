local status, telescope = pcall(require, 'telescope')
if not status then return end

local actions = require('telescope.actions')

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
    file_browser = {
      hidden = true,
      previewer = false,
    },
    ["ui-select"] = {
      require("telescope.themes").get_cursor {
        specific_opts = {
          codeactions = true,
        },
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      previewer = false,
    },
    diagnostics = {
      previewer = false,
      wrap_results = true,
    },
  },
}

telescope.load_extension "file_browser"
telescope.load_extension "fzf"
telescope.load_extension "ui-select"

--local function fugitave_integration()
--  local builtin = require('telescope.builtin')
--
--  if builtin.git_commits == true then
--    print("nothing...")
--  end
--end
--
--fugitave_integration()
