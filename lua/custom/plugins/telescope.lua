return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            enabled = true
        },
        {"nvim-telescope/telescope-file-browser.nvim", enabled = true},
        {"nvim-telescope/telescope-live-grep-args.nvim", enabled = true},
    },
    branch = "0.1.x",
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local lga_actions = require("telescope-live-grep-args.actions")

        telescope.setup({
            defaults = {
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {prompt_position = "top"},
                mappings = {
                    i = {
						['<C-u>'] = false,
						['<C-d>'] = false,
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
				--		["<C-Esc>"] = actions.close, -- close telescope
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
						["<C-h>"] = actions.which_key
                    }
                }
            },
            extensions = {
                file_browser = {
                    path = "%:p:h", -- open from within the folder of your current buffer
                    display_stat = false, -- don't show file stat
                    grouped = true, -- group initial sorting by directories and then files
                    hidden = true, -- show hidden files
                    hide_parent_dir = true, -- hide `../` in the file browser
                    hijack_netrw = true, -- use telescope file browser when opening directory paths
                    prompt_path = true, -- show the current relative path from cwd as the prompt prefix
                    use_fd = true -- use `fd` instead of plenary, make sure to install `fd`
                },
                live_grep_args = {
                    auto_quoting = true, -- enable/disable auto-quoting
                    -- define mappings, e.g.
                    mappings = { -- extend mappings
                      i = {
                        -- ["<C-p>"] = lga_actions.quote_prompt(),
                        -- ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                        -- freeze the current list and start a fuzzy search in the frozen list
                        ["<C-space>"] = actions.to_fuzzy_refine,
                      },
                    },
                    -- ... also accepts theme settings, for example:
                    -- theme = "dropdown", -- use dropdown theme
                    -- theme = { }, -- use own theme spec
                    -- layout_config = { mirror=true }, -- mirror preview pane
                },
-- 				fzf = {}
            }
        })

        -- telescope.load_extension("fzf")
        telescope.load_extension("file_browser")
        telescope.load_extension("live_grep_args")

        local builtin = require("telescope.builtin")

        -- key maps

        local map = vim.keymap.set

        map("n", "-", ":Telescope file_browser<CR>")

		map('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
		map('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
		map('n', '<leader>/', function()
			-- You can pass additional configuration to Telescope to change the theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
			  winblend = 10,
			  previewer = false,
			})
	    end, { desc = '[/] Fuzzily search in current buffer' })

		map("n", "<leader>sf", builtin.find_files, {desc = "[s]earch [f]iles"})
		map("n", "<leader>sg", builtin.git_files, {desc = "[s]earch [g]it"})
		map("n", "<leader>sd", builtin.diagnostics, {desc = "[s]earch [d]iagnostics"})
        
		map('n', '<leader>sw', function() local word = vim.fn.expand("<cword>") builtin.grep_string({ search = word }) end, {desc ="[s]earch [w]ord"}) 
		map('n', '<leader>sW', function() local word = vim.fn.expand("<cWORD>") builtin.grep_string({ search = word }) end, {desc ="[s]earch [W]ORD"})
		map("n", "<leader>sp", function() builtin.grep_string({ search = vim.fn.input("Grep > ") }); end, {desc = "[s]earch [p]rompt"})
        map("n", '<leader>sbg', builtin.live_grep, {noremap = true, silent = true, desc = "[s]earch by [g]rep"})

		map("n", "<leader>fx", builtin.treesitter, {noremap = true, silent = true, desc = "List tree sitter symbols"}) -- Lists tree-sitter symbols
        map("n", "<leader>fs", builtin.spell_suggest, {noremap = true, silent = true, desc = "Spelling suggestions"}) -- Lists spell options

		map('n', '<leader>sh', builtin.help_tags, {desc = "[s]earch [h]elp"})
    end
}
