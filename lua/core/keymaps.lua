-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable space in normal & visual
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- ───── Editing & Insertion ─────

map('i', 'jk', '<ESC>', opts) -- Exit insert with 'jk'
map('n', 'x', '"_x', opts) -- Delete single char without yanking
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)
map('v', 'p', '"_dP', opts)

-- ───── Save/Quit ─────

map('n', '<C-s>', '<cmd>w<CR>', opts) -- Save
map('n', '<leader>sn', '<cmd>noautocmd w<CR>', opts) -- Save without format
map('n', '<C-q>', '<cmd>q<CR>', opts) -- Quit

-- ───── Scrolling / Searching ─────

map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)

-- ───── Splits & Windows ─────

map('n', '<leader>v', '<C-w>v', opts)
map('n', '<leader>h', '<C-w>s', opts)
map('n', '<leader>se', '<C-w>=', opts)
map('n', '<leader>xs', ':close<CR>', opts)

map('n', 'sv', ':vsplit<CR>', opts) -- Split vertically
map('n', 'nn', '<C-w>w', opts) -- Move to next window

map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- ───── Buffers ─────

map('n', '<Tab>', ':bnext<CR>', opts)
map('n', '<S-Tab>', ':bprevious<CR>', opts)
map('n', '<leader>x', ':bdelete!<CR>', opts)
map('n', '<leader>b', '<cmd>enew<CR>', opts)

-- ───── Tabs ─────

map('n', 'tt', ':tabnew<CR>', { desc = 'New tab' })
map('n', 'tc', ':tabclose<CR>', { desc = 'Close tab' })
map('n', '<C-i>', ':tabnext<CR>', { desc = 'Next tab' })
map('n', '<C-o>', ':tabprevious<CR>', { desc = 'Previous tab' })

-- ───── Terminal ────

map('t', 'ii', '<C-\\><C-N>', opts) -- Exit terminal mode with ii
map({ 'n', 't' }, '<C-_>', function()
  require('nvchad.term').toggle { pos = 'sp', id = 'htoggleTerm' }
end, { desc = 'Toggle horizontal terminal' })
--
-- map('n', '<leader>g', ':split | resize 12 | terminal<CR>', { noremap = true, silent = true })

map({ 'n', 't' }, '<leader>g', function()
  local api = vim.api
  local current_win = api.nvim_get_current_win()

  -- Check if buffer is already created and valid
  if vim.g.git_term_buf and api.nvim_buf_is_valid(vim.g.git_term_buf) then
    -- Find window displaying that buffer
    for _, win in ipairs(api.nvim_list_wins()) do
      if api.nvim_win_get_buf(win) == vim.g.git_term_buf then
        -- If it's visible, hide it
        if vim.fn.mode() == 't' then
          vim.cmd 'stopinsert' -- exit insert mode safely
        end
        vim.cmd 'close' -- close the split, but keep the buffer running
        return
      end
    end

    -- If buffer exists but not visible, open it
    vim.cmd 'split'
    vim.cmd 'resize 12'
    api.nvim_set_current_buf(vim.g.git_term_buf)
    vim.cmd 'startinsert'
  else
    -- If buffer doesn't exist, create a new terminal
    vim.cmd 'split'
    vim.cmd 'resize 12'
    vim.cmd 'terminal'
    vim.g.git_term_buf = api.nvim_get_current_buf()
    vim.cmd 'startinsert'
  end
end, { noremap = true, silent = true, desc = 'Toggle Git terminal' })

-- ───── Telescope ─────

map('n', ';f', '<cmd>Telescope find_files<CR>', opts)
map('n', ';;', '<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>', opts)

-- ───── Misc ─────

map('n', '<leader>lw', '<cmd>set wrap!<CR>', opts) -- Toggle line wrapping

-- ───── Resize ─────

map('n', '<Left>', ':vertical resize -2<CR>', opts)
map('n', '<Right>', ':vertical resize +2<CR>', opts)

-- ───── LSP Diagnostics ─────

map('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })

map('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })

map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
