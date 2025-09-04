-- return {
--   'nvim-lualine/lualine.nvim',
--   config = function()
--     local mode = {
--       'mode',
--       fmt = function(str)
--         return ' ' .. str
--         -- return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
--       end,
--     }
--
--     local filename = {
--       'filename',
--       file_status = true, -- displays file status (readonly status, modified status)
--       path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
--     }
--
--     local hide_in_width = function()
--       return vim.fn.winwidth(0) > 100
--     end
--
--     local diagnostics = {
--       'diagnostics',
--       sources = { 'nvim_diagnostic' },
--       sections = { 'error', 'warn' },
--       symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
--       colored = false,
--       update_in_insert = false,
--       always_visible = false,
--       cond = hide_in_width,
--     }
--
--     local diff = {
--       'diff',
--       colored = false,
--       symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
--       cond = hide_in_width,
--     }
--
--     require('lualine').setup {
--       options = {
--         icons_enabled = true,
--         theme = 'tokyonight_moon',
--         transpareny = true,
--         -- Set theme based on environment variable
--         -- Some useful glyphs:
--         -- https://www.nerdfonts.com/cheat-sheet
--         --        
--         section_separators = { left = '', right = '' },
--         component_separators = { left = '', right = '' },
--         disabled_filetypes = { 'alpha', 'neo-tree' },
--         always_divide_middle = true,
--       },
--       sections = {
--         lualine_a = { mode },
--         lualine_b = { 'branch' },
--         lualine_c = { filename },
--         lualine_x = { diagnostics, diff, { 'encoding', cond = hide_in_width }, { 'filetype', cond = hide_in_width } },
--         lualine_y = { 'location' },
--         lualine_z = { 'progress' },
--       },
--       inactive_sections = {
--         lualine_a = {},
--         lualine_b = {},
--         lualine_c = { { 'filename', path = 1 } },
--         lualine_x = { { 'location', padding = 0 } },
--         lualine_y = {},
--         lualine_z = {},
--       },
--       tabline = {},
--       extensions = { 'fugitive' },
--     }
--   end,
-- }

return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local mode = {
      'mode',
      fmt = function(str)
        return ' ' .. str
      end,
    }

    local filename = {
      'filename',
      file_status = true,
      path = 0,
    }

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      colored = false,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }

    local diff = {
      'diff',
      colored = false,
      symbols = { added = ' ', modified = ' ', removed = ' ' },
      cond = hide_in_width,
    }

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'tokyonight',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha', 'neo-tree' },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { 'branch' },
        lualine_c = { filename },
        lualine_x = {
          diagnostics,
          diff,
          { 'encoding', cond = hide_in_width },
          { 'filetype', cond = hide_in_width },
        },
        lualine_y = { 'location' },
        lualine_z = { 'progress' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { { 'location', padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { 'fugitive' },
    }

    -- 🧼 Transparent background for lualine
    local function transparent_lualine()
      local hl_groups = {
        'lualine_a_normal',
        'lualine_b_normal',
        'lualine_c_normal',
        'lualine_x_normal',
        'lualine_y_normal',
        'lualine_z_normal',
        'lualine_a_insert',
        'lualine_b_insert',
        'lualine_c_insert',
        'lualine_a_visual',
        'lualine_b_visual',
        'lualine_c_visual',
        'lualine_a_replace',
        'lualine_b_replace',
        'lualine_c_replace',
        'lualine_a_command',
        'lualine_b_command',
        'lualine_c_command',
        'lualine_a_inactive',
        'lualine_b_inactive',
        'lualine_c_inactive',
      }

      for _, group in ipairs(hl_groups) do
        vim.api.nvim_set_hl(0, group, { bg = 'none' })
      end

      vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'none' })
    end

    -- 🔁 Defer highlight override to after theme is loaded
    vim.defer_fn(transparent_lualine, 0)
  end,
}
