-- Normal mode mappings
local telescope = require("telescope.builtin")

lvim.keys.normal_mode["<C-p>"] = telescope.find_files
lvim.keys.normal_mode["<C-f>"] = telescope.live_grep

-- Leader key mappings
lvim.builtin.which_key.mappings["e"] = {"<cmd>Neotree filesystem reveal left toggle<CR>", "Explorer"}


