return {
    'mbbill/undotree',
    config = function()
        vim.keymap.set('n', '<leader>cu', vim.cmd.UndotreeToggle)
    end
}
