-- Theme and visual appearance configurations
-- Set colorscheme (this now happens after plugins are loaded)
local function set_colorscheme()
    -- Check if the moonfly colorscheme is available
    local status_ok, _ = pcall(vim.cmd, 'colorscheme moonfly')
    if not status_ok then
        -- Fallback to a default colorscheme if moonfly is not available
        vim.cmd('colorscheme default')
        vim.notify('Colorscheme moonfly not found, using default', vim.log.levels.WARN)
        return
    end

    -- Create autocmd group for theme adjustments
    local theme_group = vim.api.nvim_create_augroup('ThemeCustomization', {
        clear = true
    })

    -- Adjust brightness when opening a file
    vim.api.nvim_create_autocmd('BufEnter', {
        group = theme_group,
        callback = function()
            -- Increase brightness for normal text 
            vim.api.nvim_set_hl(0, 'Normal', {
                bg = '#252525'
            })
            -- Adjust line number brightness
            vim.api.nvim_set_hl(0, 'LineNr', {
                fg = '#aaaaaa'
            })
            -- Brighten comments for better readability
            vim.api.nvim_set_hl(0, 'Comment', {
                fg = '#7a8a99'
            })
        end
    })

    -- Make sure important UI elements are visible
    vim.api.nvim_set_hl(0, 'CursorLine', {
        bg = '#303030'
    })
    vim.api.nvim_set_hl(0, 'Visual', {
        bg = '#3a3a5e'
    })
end

return {
    setup = set_colorscheme
}
