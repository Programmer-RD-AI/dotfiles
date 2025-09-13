local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
         lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({"bluz71/vim-moonfly-colors", {
    'saghen/blink.cmp',
    dependencies = {'rafamadriz/friendly-snippets'},
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = 'default'
        },

        appearance = {
            nerd_font_variant = 'mono'
        },
        completion = {
            documentation = {
                auto_show = false
            }
        },
        sources = {
            default = {'lsp', 'path', 'snippets', 'buffer'}
        },
        fuzzy = {
            implementation = "prefer_rust_with_warning"
        }
    },
    opts_extend = {"sources.default"}
}, "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig", {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        require("nvim-tree").setup {
            view = {
                side = "right",
                width = 30
            }
        }
    end
}, {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8', -- Use a stable version
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
        require('telescope').setup {}
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end
}, {'github/copilot.vim'}, {
    'andweeb/presence.nvim',
    config = function()
        require("presence").setup({
            -- General options
            auto_update = true,
            neovim_image_text = "The One True Text Editor",
            main_image = "neovim",
            client_id = "",
            log_level = nil,
            debounce_timeout = 10,
            enable_line_number = false,
            blacklist = {},
            buttons = true,
            file_assets = {},
            show_time = true,
            -- Rich Presence text options
            editing_text = "Editing %s",
            file_explorer_text = "Browsing %s",
            git_commit_text = "Committing changes",
            plugin_manager_text = "Managing plugins",
            reading_text = "Reading %s",
            workspace_text = "Working on %s",
            line_number_text = "Line %s out of %s"
        })
    end
}, {
    "kdheepak/lazygit.nvim",
    cmd = {"LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile"},
    -- optional for floating window border decoration
    dependencies = {"nvim-lua/plenary.nvim"}
}, -- Comment.nvim plugin for easy commenting
{
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}, {
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
        require('lualine').setup {}
    end
}, -- which-key.nvim - helps you remember key bindings
{
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    keys = {{
        "<leader>?",
        function()
            require("which-key").show({
                global = false
            })
        end,
        desc = "Buffer Local Keymaps (which-key)"
    }}
}, -- Treesitter and related plugins
{
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = {"c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "python", "html",
                                "css", "json", "yaml", "bash", "markdown", "markdown_inline"},
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            },
            indent = {
                enable = true
            }
        }
    end
}, -- nvim-treesitter-context - keeps current scope info pinned at the top of the window
{
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
        enable = true,
        max_lines = 4
    }
}, -- log-highlight.nvim - adds syntax highlighting for log files
{
    'fei6409/log-highlight.nvim',
    config = function()
        require('log-highlight').setup {}
    end
}, -- nvim-colorizer.lua - adds inline color previews
{
    'NvChad/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = {
        filetypes = {'*'},
        user_default_options = {
            RGB = true,
            RRGGBB = true,
            names = true,
            RRGGBBAA = false,
            css = true,
            css_fn = true
        }
    }
}, -- document-color.nvim - uses LSP's color provider
{
    'mrshmllow/document-color.nvim',
    ft = {'css', 'scss', 'html', 'javascript', 'typescript'},
    config = function()
        require('document-color').setup {
            mode = 'single'
        }
    end
}, -- nvim-treesitter-refactor - enhances TS with refactoring queries
{
    'nvim-treesitter/nvim-treesitter-refactor',
    dependencies = {'nvim-treesitter/nvim-treesitter'},
    config = function()
        require('nvim-treesitter.configs').setup {
            refactor = {
                highlight_definitions = {
                    enable = true
                }
            }
        }
    end
}, -- toggleterm.nvim - better terminal integration
{
    "akinsho/toggleterm.nvim",
    opts = {
        size = 20,
        open_mapping = [[<c-\>]],
        direction = "float"
    }
}, -- nvim-tmux-navigation - seamless navigation between tmux panes and vim splits
{
    "alexghergh/nvim-tmux-navigation",
    config = function()
        require("nvim-tmux-navigation").setup {
            disable_when_zoomed = true, -- skip tmux navigation if the pane is zoomed
            keybindings = {
                left = "<C-h>",
                down = "<C-j>",
                up = "<C-k>",
                right = "<C-l>",
                last_active = "<C-\\>",
                next = "<C-Space>"
            }
        }

        -- Set up keymaps
        local nav = require("nvim-tmux-navigation")
        vim.keymap.set('n', '<C-h>', nav.NvimTmuxNavigateLeft)
        vim.keymap.set('n', '<C-j>', nav.NvimTmuxNavigateDown)
        vim.keymap.set('n', '<C-k>', nav.NvimTmuxNavigateUp)
        vim.keymap.set('n', '<C-l>', nav.NvimTmuxNavigateRight)
        vim.keymap.set('n', '<C-\\>', nav.NvimTmuxNavigateLastActive)
        vim.keymap.set('n', '<C-Space>', nav.NvimTmuxNavigateNext)
    end
}, -- Harpoon - quick file navigation and marking
{
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup({
            settings = {
                save_on_toggle = true,
                sync_on_ui_close = true,
                save_on_change = true,
                enter_on_sendcmd = false,
                tmux_autoclose_windows = false,
                excluded_filetypes = {"harpoon", "alpha", "dashboard", "gitcommit"},
                mark_branch = false
            }
        })
    end
}, -- vim-eunuch - UNIX shell helpers
{
    'tpope/vim-eunuch',
    cmd = {
        'Remove',    -- :Remove → delete file + buffer
        'Rename',    -- :Rename old new
        'Move',      -- :Move old new (same as Rename)
        'Chmod',     -- :Chmod +x foo.sh
        'Mkdir',     -- :Mkdir path/to/dir
        'SudoWrite', -- :SudoWrite → write buffer via sudo
        'SudoEdit',  -- :SudoEdit → edit file via sudo
        'Delete',    -- :Delete → delete file from disk
        'Copy',      -- :Copy → copy file
        'Duplicate', -- :Duplicate → duplicate file
        'Find',      -- :Find → find files
        'Locate',    -- :Locate → locate files
        'Wall',      -- :Wall → write all windows
    },
}, -- vim-surround - surround text objects with brackets, quotes, etc.
{
    'tpope/vim-surround',
    keys = {
        {'ys', mode = 'n', desc = 'Add surrounding'},
        {'cs', mode = 'n', desc = 'Change surrounding'},
        {'ds', mode = 'n', desc = 'Delete surrounding'},
        {'S', mode = 'v', desc = 'Surround selection'},
    },
}})
