-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require('neo-tree').setup {}
    vim.api.nvim_set_keymap('n', '<leader>pv', ':Neotree toggle<CR>', { noremap = true, silent = true })
    vim.api.nvim_command 'hi NeoTreeNormal guibg=None'
    vim.api.nvim_command 'hi NeoTreeNormalNC guibg=None'
    vim.api.nvim_command 'hi NeoTreeSignColumn guibg=None'
  end,
}
