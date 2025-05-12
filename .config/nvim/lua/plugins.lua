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
        require("nvim-tree").setup {}
    end
}, {
    'nvim-telescope/telescope.nvim',
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
}, -- Corrected line: changed }} to },
-- Add Comment.nvim plugin
{
    'numToStr/Comment.nvim',
    opts = {}
}, {
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
        require('lualine').setup {}
    end
}, {
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
            }
        }
    end
}})
