return {
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      -- 1. Setup fold options (Crucial for UFO to work)
      vim.o.foldcolumn = '1' 
      vim.o.foldlevel = 99 
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- 2. Your custom handler for pretty fold text
local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ('  󰁂 %d lines '):format(endLnum - lnum)
    local targetWidth = width - vim.fn.strdisplaywidth(suffix)
    local curWidth = 0
    
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- strdisplaywidth(chunkText) < targetWidth - curWidth cannot be true here..
            if curWidth + chunkWidth < targetWidth then
                padding = (' '):rep(targetWidth - curWidth - chunkWidth)
                table.insert(newVirtText, {padding, 'UfoFoldedEllipsis'})
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
end
      -- 3. Initialize UFO
      require('ufo').setup({
        fold_virt_text_handler = handler,
        provider_selector = function(bufnr, filetype, buftype)
          return {'treesitter', 'indent'}
        end
      })

      -- 4. Keybindings
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
      -- 'za' will now work automatically based on these providers!
    end,
  },
}
