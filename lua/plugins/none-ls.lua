-- return {
--   'nvimtools/none-ls.nvim',
--   dependencies = {
--     'nvimtools/none-ls-extras.nvim',
--     'jayp0521/mason-null-ls.nvim', -- ensure dependencies are installed
--   },
--   config = function()
--     local null_ls = require 'null-ls'
--     local formatting = null_ls.builtins.formatting -- to setup formatters
--     local diagnostics = null_ls.builtins.diagnostics -- to setup linters
--
--     -- Formatters & linters for mason to install
--     require('mason-null-ls').setup {
--       ensure_installed = {
--         'prettier', -- ts/js formatter
--         'eslint_d', -- ts/js linter
--         'shfmt', -- Shell formatter
--         'checkmake', -- linter for Makefiles
--         -- 'stylua', -- lua formatter; Already installed via Mason
--         -- 'ruff', -- Python linter and formatter; Already installed via Mason
--       },
--       automatic_installation = true,
--     }
--
--     local sources = {
--       diagnostics.checkmake,
--       formatting.prettier.with {
--         filetypes = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'json', 'html', 'yaml', 'markdown' },
--       },
--       formatting.stylua,
--       formatting.clang_format,
--       formatting.shfmt.with { args = { '-i', '4' } },
--       formatting.terraform_fmt,
--       require('none-ls.formatting.ruff').with { extra_args = { '--extend-select', 'I' } },
--       require 'none-ls.formatting.ruff_format',
--     }
--
--     local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
--     null_ls.setup {
--       -- debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
--       sources = sources,
--       -- you can reuse a shared lspconfig on_attach callback here
--       on_attach = function(client, bufnr)
--         if client:supports_method 'textDocument/formatting' then
--           vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
--           vim.api.nvim_create_autocmd('BufWritePre', {
--             group = augroup,
--             buffer = bufnr,
--             callback = function()
--               vim.lsp.buf.format { async = false }
--             end,
--           })
--         end
--       end,
--     }
--   end,
-- }

return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
    'jayp0521/mason-null-ls.nvim', -- ensure dependencies are installed
    'neovim/nvim-lspconfig', -- for clangd
  },
  config = function()
    local null_ls = require 'null-ls'
    local formatting = null_ls.builtins.formatting -- to setup formatters
    local diagnostics = null_ls.builtins.diagnostics -- to setup linters

    -- Formatters & linters for mason to install
    require('mason-null-ls').setup {
      ensure_installed = {
        'prettier', -- ts/js formatter
        'eslint_d', -- ts/js linter
        'shfmt', -- Shell formatter
        'checkmake', -- linter for Makefiles
        'clang-format', -- for C++
        -- 'stylua', -- lua formatter; Already installed via Mason
        -- 'ruff', -- Python linter and formatter; Already installed via Mason
      },
      automatic_installation = true,
    }

    local sources = {
      diagnostics.checkmake,
      formatting.prettier.with {
        filetypes = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'json', 'html', 'yaml', 'markdown' },
      },
      formatting.stylua,
      formatting.clang_format,
      formatting.shfmt.with { args = { '-i', '4' } },
      formatting.terraform_fmt,
      require('none-ls.formatting.ruff').with { extra_args = { '--extend-select', 'I' } },
      require 'none-ls.formatting.ruff_format',
    }

    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
    null_ls.setup {
      -- debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
      sources = sources,
      -- you can reuse a shared lspconfig on_attach callback here
      on_attach = function(client, bufnr)
        if client:supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format { async = false }
            end,
          })
        end
      end,
    }

    -- ───── Clangd setup ─────
    local lspconfig = require 'lspconfig'
    lspconfig.clangd.setup {
      cmd = { 'clangd', '--header-insertion=never' },
      on_attach = function(client, bufnr)
        -- Format on save for C++
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = vim.api.nvim_create_augroup('ClangdFormat', { clear = true }),
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format { async = false }
            end,
          })
        end
      end,
    }
  end,
}

-- -- ~/.config/nvim/lua/plugins/none-ls.lua
-- return {
--   'nvimtools/none-ls.nvim',
--   dependencies = { 'nvim-lua/plenary.nvim' },
--   config = function()
--     local null_ls = require 'null-ls'
--
--     -- Setup sources
--     null_ls.setup {
--       sources = {
--         -- JS/TS
--         null_ls.builtins.formatting.prettier,
--         null_ls.builtins.diagnostics.eslint_d,
--
--         -- Python
--         null_ls.builtins.formatting.black,
--         null_ls.builtins.diagnostics.flake8,
--
--         -- Shell
--         null_ls.builtins.formatting.shfmt,
--         null_ls.builtins.diagnostics.shellcheck,
--
--         -- You can still use clang-format for manual format on save (if you want)
--         null_ls.builtins.formatting.clang_format,
--       },
--       on_attach = function(client, bufnr)
--         -- Only autoformat on save for non-C++ files
--         if client.supports_method 'textDocument/formatting' then
--           vim.api.nvim_clear_autocmds { group = 'LspFormatting', buffer = bufnr }
--           vim.api.nvim_create_autocmd('BufWritePre', {
--             group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
--             buffer = bufnr,
--             callback = function()
--               local ft = vim.bo[bufnr].filetype
--               if ft ~= 'cpp' and ft ~= 'c' then
--                 vim.lsp.buf.format { bufnr = bufnr }
--               end
--             end,
--           })
--         end
--       end,
--     }
--
--     -- Use clangd for on-type formatting in C/C++
--     -- Make sure you have `clangd` installed and set up in lspconfig
--     local lspconfig = require 'lspconfig'
--     lspconfig.clangd.setup {
--       on_attach = function(client, bufnr)
--         if client.server_capabilities.documentOnTypeFormattingProvider then
--           -- Trigger clangd formatting as you type
--           vim.api.nvim_create_autocmd('TextChangedI', {
--             buffer = bufnr,
--             callback = function()
--               vim.lsp.buf.format { bufnr = bufnr, async = true }
--             end,
--           })
--         end
--       end,
--     }
--   end,
-- }
