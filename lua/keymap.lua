-- vim.o["winwinwidth"]    = 10;
--
---- keymap 
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true });
-- ctrl + h,j,k,l
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true });

 vim.api.nvim_set_keymap('n', 'ff', "<cmd>lua require('telescope.builtin').find_files()<CR>",{ noremap = true, silent = true });
 vim.api.nvim_set_keymap('n', 'fw', "<cmd>lua require('telescope.builtin').live_grep()<CR>",{ noremap = true, silent = true });

-- for buffer switch
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true });
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true });
-- save file also in insert mode
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true });
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true });

-- esc go to normal mode in terminal
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true });
-- 
--
-- if not the last buffer, use `q` to close buffer; if the last buffer, use `q` to quit
-- vim.api.nvim_set_keymap('n', 'q', ':bw<CR>', { noremap = true, silent = true });

-- Function to check if the current buffer is the last buffer
local function is_last_buffer()
  local loaded_buffers = 0
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, 'buflisted') then
      loaded_buffers = loaded_buffers + 1
      if loaded_buffers > 1 then
        return false
      end
    end
  end
  return loaded_buffers == 1
end

-- Key mapping for 'q'
vim.api.nvim_set_keymap('n', 'q', '', {
  noremap = true,
  silent = true,
  callback = function()
    if is_last_buffer() then
      -- If it's the last buffer, quit NeoVim
      -- before quit close neotree
        vim.cmd('Neotree close')
      vim.cmd('quit')
    else
      -- Otherwise, close the current buffer
      vim.cmd('bw')
    end
  end
})


-- map 'folder and unfold' to <space>z
vim.api.nvim_set_keymap('n', '<space><space>', 'za', { noremap = true, silent = true });
-- vim.api.nvim_set_keymap('n', '<C-,>', 'za', { noremap = true, silent = true });
vim.api.nvim_create_autocmd('LspAttach', {
 group = vim.api.nvim_create_augroup('UserLspConfig', {}),
 callback = function(ev)
   -- Enable completion triggered by <c-x><c-o>
   vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

   -- Buffer local mappings.
   -- See `:help vim.lsp.*` for documentation on any of the below functions
   local opts = { buffer = ev.buf }
   vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
   vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
   vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
   vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
   vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
   vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
   vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
   vim.keymap.set('n', '<space>wl', function()
     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
   end, opts)
   vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
   vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
   vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
   vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
   vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
   vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
   vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)


 end,
})

-- map c-w to close buffer
-- vim.api.nvim_set_keymap('n', '<C-w>', ':bw<CR>', { noremap = true, silent = true });
