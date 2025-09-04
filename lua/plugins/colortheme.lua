-- return {
--   'folke/tokyonight.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     -- Initial transparency state
--     local bg_transparent = true
--
--     -- Setup tokyonight options
--     require('tokyonight').setup {
--       style = 'storm', -- Available: storm, night, moon, day
--       transparent = bg_transparent,
--       styles = {
--         sidebars = 'transparent',
--         floats = 'transparent',
--       },
--     }
--
--     -- Load the colorscheme
--     vim.cmd [[colorscheme tokyonight]]
--
--     vim.cmd [[
--       highlight WinBar guibg=NONE ctermbg=NONE
--       highlight WinBarNC guibg=NONE ctermbg=NONE
--       highlight StatusLine guibg=NONE ctermbg=NONE
--       highlight StatusLineNC guibg=NONE ctermbg=NONE
--       highlight TabLine guibg=NONE ctermbg=NONE
--       highlight TabLineFill guibg=NONE ctermbg=NONE
--       highlight TabLineSel guibg=NONE ctermbg=NONE
--       highlight Normal guibg=NONE ctermbg=NONE
--       highlight NormalNC guibg=NONE ctermbg=NONE
--       highlight VertSplit guibg=NONE ctermbg=NONE
--       highlight SignColumn guibg=NONE ctermbg=NONE
--       highlight FoldColumn guibg=NONE ctermbg=NONE
--       highlight Pmenu guibg=NONE ctermbg=NONE
--       highlight PmenuSel guibg=NONE ctermbg=NONE
--       highlight FloatBorder guibg=NONE ctermbg=NONE
--       highlight NormalFloat guibg=NONE ctermbg=NONE
--       highlight MsgArea guibg=NONE ctermbg=NONE
--       highlight WinSeparator guibg=NONE ctermbg=NONE
--     ]]
--
--     -- Toggle transparency function
--     local toggle_transparency = function()
--       bg_transparent = not bg_transparent
--       require('tokyonight').setup {
--         style = 'storm',
--         transparent = bg_transparent,
--         styles = {
--           sidebars = 'transparent',
--           floats = 'transparent',
--         },
--       }
--       vim.cmd [[colorscheme tokyonight]]
--     end
--
--     -- Keymap to toggle background transparency
--     vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
--   end,
-- }

-- return {
--   'rose-pine/neovim',
--   name = 'rose-pine',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     -- Initial transparency state
--     local bg_transparent = true
--
--     -- Function to apply rose-pine config
--     local apply_rosepine = function()
--       require('rose-pine').setup {
--         variant = 'moon', -- Options: 'main', 'moon', 'dawn'
--         disable_background = bg_transparent,
--         disable_float_background = bg_transparent,
--         disable_italics = false,
--       }
--
--       vim.cmd [[colorscheme rose-pine]]
--
--       -- Manual highlight overrides for full transparency
--       vim.cmd [[
--         highlight WinBar guibg=NONE ctermbg=NONE
--         highlight WinBarNC guibg=NONE ctermbg=NONE
--         highlight StatusLine guibg=NONE ctermbg=NONE
--         highlight StatusLineNC guibg=NONE ctermbg=NONE
--         highlight TabLine guibg=NONE ctermbg=NONE
--         highlight TabLineFill guibg=NONE ctermbg=NONE
--         highlight TabLineSel guibg=NONE ctermbg=NONE
--         highlight Normal guibg=NONE ctermbg=NONE
--         highlight NormalNC guibg=NONE ctermbg=NONE
--         highlight VertSplit guibg=NONE ctermbg=NONE
--         highlight SignColumn guibg=NONE ctermbg=NONE
--         highlight FoldColumn guibg=NONE ctermbg=NONE
--         highlight Pmenu guibg=NONE ctermbg=NONE
--         highlight PmenuSel guibg=NONE ctermbg=NONE
--         highlight FloatBorder guibg=NONE ctermbg=NONE
--         highlight NormalFloat guibg=NONE ctermbg=NONE
--         highlight MsgArea guibg=NONE ctermbg=NONE
--         highlight WinSeparator guibg=NONE ctermbg=NONE
--       ]]
--     end
--
--     -- Apply initial config
--     apply_rosepine()
--
--     -- Toggle transparency function
--     local toggle_transparency = function()
--       bg_transparent = not bg_transparent
--       apply_rosepine()
--     end
--
--     -- Keymap to toggle background transparency
--     vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
--   end,
-- }

-- return {
--   'NTBBloodbath/doom-one.nvim',
--   name = 'doom-one',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     local bg_transparent = true
--
--     -- Setup doom-one options
--     vim.g.doom_one_enable_treesitter = true
--     vim.g.doom_one_diagnostics_text_color = true
--     vim.g.doom_one_transparent_background = bg_transparent
--     vim.g.doom_one_plugin_neorg = true
--     vim.g.doom_one_plugin_barbar = false
--     vim.g.doom_one_plugin_telescope = true
--     vim.g.doom_one_plugin_nvim_tree = true
--     vim.g.doom_one_plugin_dashboard = true
--     vim.g.doom_one_plugin_startify = true
--
--     vim.cmd 'colorscheme doom-one'
--
--     -- Optional: Extra transparency highlights
--     vim.cmd [[
--       highlight WinBar guibg=NONE ctermbg=NONE
--       highlight WinBarNC guibg=NONE ctermbg=NONE
--       highlight StatusLine guibg=NONE ctermbg=NONE
--       highlight StatusLineNC guibg=NONE ctermbg=NONE
--       highlight TabLine guibg=NONE ctermbg=NONE
--       highlight TabLineFill guibg=NONE ctermbg=NONE
--       highlight TabLineSel guibg=NONE ctermbg=NONE
--       highlight Normal guibg=NONE ctermbg=NONE
--       highlight NormalNC guibg=NONE ctermbg=NONE
--       highlight VertSplit guibg=NONE ctermbg=NONE
--       highlight SignColumn guibg=NONE ctermbg=NONE
--       highlight FoldColumn guibg=NONE ctermbg=NONE
--       highlight Pmenu guibg=NONE ctermbg=NONE
--       highlight PmenuSel guibg=NONE ctermbg=NONE
--       highlight FloatBorder guibg=NONE ctermbg=NONE
--       highlight NormalFloat guibg=NONE ctermbg=NONE
--       highlight MsgArea guibg=NONE ctermbg=NONE
--       highlight WinSeparator guibg=NONE ctermbg=NONE
--     ]]
--
--     -- Toggle background transparency
--     local toggle_transparency = function()
--       bg_transparent = not bg_transparent
--       vim.g.doom_one_transparent_background = bg_transparent
--       vim.cmd 'colorscheme doom-one'
--     end
--
--     vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
--   end,
-- }

-- return {
--   'sainnhe/sonokai',
--   name = 'sonokai',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     -- Initial transparency state
--     local bg_transparent = true
--
--     -- Set style variant (possible values: 'default', 'atlantis', 'andromeda', 'shusia', 'maia', 'espresso')
--     vim.g.sonokai_style = 'andromeda'
--     vim.g.sonokai_enable_italic = 1
--     vim.g.sonokai_disable_background = bg_transparent and 1 or 0
--     vim.g.sonokai_transparent_background = bg_transparent and 1 or 0
--
--     -- Load the colorscheme
--     vim.cmd 'colorscheme sonokai'
--
--     -- Optional: Make additional highlights transparent
--     vim.cmd [[
--       highlight WinBar guibg=NONE ctermbg=NONE
--       highlight WinBarNC guibg=NONE ctermbg=NONE
--       highlight StatusLine guibg=NONE ctermbg=NONE
--       highlight StatusLineNC guibg=NONE ctermbg=NONE
--       highlight TabLine guibg=NONE ctermbg=NONE
--       highlight TabLineFill guibg=NONE ctermbg=NONE
--       highlight TabLineSel guibg=NONE ctermbg=NONE
--       highlight Normal guibg=NONE ctermbg=NONE
--       highlight NormalNC guibg=NONE ctermbg=NONE
--       highlight VertSplit guibg=NONE ctermbg=NONE
--       highlight SignColumn guibg=NONE ctermbg=NONE
--       highlight FoldColumn guibg=NONE ctermbg=NONE
--       highlight Pmenu guibg=NONE ctermbg=NONE
--       highlight PmenuSel guibg=NONE ctermbg=NONE
--       highlight FloatBorder guibg=NONE ctermbg=NONE
--       highlight NormalFloat guibg=NONE ctermbg=NONE
--       highlight MsgArea guibg=NONE ctermbg=NONE
--       highlight WinSeparator guibg=NONE ctermbg=NONE
--     ]]
--
--     -- Toggle transparency function
--     local toggle_transparency = function()
--       bg_transparent = not bg_transparent
--       vim.g.sonokai_disable_background = bg_transparent and 1 or 0
--       vim.g.sonokai_transparent_background = bg_transparent and 1 or 0
--       vim.cmd 'colorscheme sonokai'
--     end
--
--     -- Keymap to toggle background transparency
--     vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
--   end,
-- }

-- return {
--   'ficcdaf/ashen.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     -- Initial transparency state
--     local bg_transparent = true
--
--     -- Setup ashen theme
--     require('ashen').setup {
--       transparent = bg_transparent,
--       dim_inactive = true,
--     }
--
--     -- Load the colorscheme
--     vim.cmd [[colorscheme ashen]]
--
--     -- Custom highlight overrides
--     vim.cmd [[
--       highlight WinBar guibg=NONE ctermbg=NONE
--       highlight WinBarNC guibg=NONE ctermbg=NONE
--       highlight StatusLine guibg=NONE ctermbg=NONE
--       highlight StatusLineNC guibg=NONE ctermbg=NONE
--       highlight TabLine guibg=NONE ctermbg=NONE
--       highlight TabLineFill guibg=NONE ctermbg=NONE
--       highlight TabLineSel guibg=NONE ctermbg=NONE
--       highlight Normal guibg=NONE ctermbg=NONE
--       highlight NormalNC guibg=NONE ctermbg=NONE
--       highlight VertSplit guibg=NONE ctermbg=NONE
--       highlight SignColumn guibg=NONE ctermbg=NONE
--       highlight FoldColumn guibg=NONE ctermbg=NONE
--       highlight Pmenu guibg=NONE ctermbg=NONE
--       highlight PmenuSel guibg=NONE ctermbg=NONE
--       highlight FloatBorder guibg=NONE ctermbg=NONE
--       highlight NormalFloat guibg=NONE ctermbg=NONE
--       highlight MsgArea guibg=NONE ctermbg=NONE
--       highlight WinSeparator guibg=NONE ctermbg=NONE
--     ]]
--
--     -- Function to toggle background transparency
--     local toggle_transparency = function()
--       bg_transparent = not bg_transparent
--
--       -- Re-setup and reload the colorscheme
--       require('ashen').setup {
--         transparent = bg_transparent,
--         dim_inactive = true,
--       }
--       vim.cmd [[colorscheme ashen]]
--     end
--
--     -- Keymap to toggle background transparency
--     vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
--   end,
-- }

return {
  'dgox16/oldworld.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    -- Initial transparency state
    local bg_transparent = true

    -- Setup oldworld theme
    require('oldworld').setup {
      transparent = bg_transparent,
      terminal_colors = true,
      italic_comments = true,
    }

    -- Load the colorscheme
    vim.cmd [[colorscheme oldworld]]

    -- Custom highlight overrides
    vim.cmd [[
      highlight WinBar guibg=NONE ctermbg=NONE
      highlight WinBarNC guibg=NONE ctermbg=NONE
      highlight StatusLine guibg=NONE ctermbg=NONE
      highlight StatusLineNC guibg=NONE ctermbg=NONE
      highlight TabLine guibg=NONE ctermbg=NONE
      highlight TabLineFill guibg=NONE ctermbg=NONE
      highlight TabLineSel guibg=NONE ctermbg=NONE
      highlight Normal guibg=NONE ctermbg=NONE
      highlight NormalNC guibg=NONE ctermbg=NONE
      highlight VertSplit guibg=NONE ctermbg=NONE
      highlight SignColumn guibg=NONE ctermbg=NONE
      highlight FoldColumn guibg=NONE ctermbg=NONE
      highlight Pmenu guibg=NONE ctermbg=NONE
      highlight PmenuSel guibg=NONE ctermbg=NONE
      highlight FloatBorder guibg=NONE ctermbg=NONE
      highlight NormalFloat guibg=NONE ctermbg=NONE
      highlight MsgArea guibg=NONE ctermbg=NONE
      highlight WinSeparator guibg=NONE ctermbg=NONE
    ]]

    -- Toggle transparency function
    local toggle_transparency = function()
      bg_transparent = not bg_transparent

      require('oldworld').setup {
        transparent = bg_transparent,
        terminal_colors = true,
        italic_comments = true,
      }
      vim.cmd [[colorscheme oldworld]]
    end

    -- Keymap to toggle background transparency
    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
  end,
}

-- return {
--   'aliqyan-21/darkvoid.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     -- Initial transparency state
--     local bg_transparent = true
--
--     -- Setup darkvoid theme
--     require('darkvoid').setup {
--       transparent = bg_transparent,
--       italic_comments = true,
--       dim_inactive = true,
--     }
--
--     -- Load the colorscheme
--     vim.cmd [[colorscheme darkvoid]]
--
--     -- Custom highlight overrides
--     vim.cmd [[
--       highlight WinBar guibg=NONE ctermbg=NONE
--       highlight WinBarNC guibg=NONE ctermbg=NONE
--       highlight StatusLine guibg=NONE ctermbg=NONE
--       highlight StatusLineNC guibg=NONE ctermbg=NONE
--       highlight TabLine guibg=NONE ctermbg=NONE
--       highlight TabLineFill guibg=NONE ctermbg=NONE
--       highlight TabLineSel guibg=NONE ctermbg=NONE
--       highlight Normal guibg=NONE ctermbg=NONE
--       highlight NormalNC guibg=NONE ctermbg=NONE
--       highlight VertSplit guibg=NONE ctermbg=NONE
--       highlight SignColumn guibg=NONE ctermbg=NONE
--       highlight FoldColumn guibg=NONE ctermbg=NONE
--       highlight Pmenu guibg=NONE ctermbg=NONE
--       highlight PmenuSel guibg=NONE ctermbg=NONE
--       highlight FloatBorder guibg=NONE ctermbg=NONE
--       highlight NormalFloat guibg=NONE ctermbg=NONE
--       highlight MsgArea guibg=NONE ctermbg=NONE
--       highlight WinSeparator guibg=NONE ctermbg=NONE
--     ]]
--
--     -- Toggle transparency function
--     local toggle_transparency = function()
--       bg_transparent = not bg_transparent
--       require('darkvoid').setup {
--         transparent = bg_transparent,
--         italic_comments = true,
--         dim_inactive = true,
--       }
--       vim.cmd [[colorscheme darkvoid]]
--     end
--
--     -- Keymap to toggle background transparency
--     vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
--   end,
-- }
