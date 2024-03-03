local builtin = require('telescope.builtin')
local telescope = require('telescope')
-- log into console

vim.keymap.set('n', '<leader>fm', telescope.extensions.media_files.media_files, { desc = '[F]ind [M]edia-files' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind [G]rep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp-tags' })
