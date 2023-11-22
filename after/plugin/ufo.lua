vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`.
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
vim.keymap.set('n', 'zP', function()
  local winid = require('ufo').peekFoldedLinesUnderCursor()
  if not winid then
      vim.lsp.buf.hover()
  end
  end, {desc = 'Peek folder lines under cursor'}
)


require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
        return { "lsp", "indent" }
    end
})
