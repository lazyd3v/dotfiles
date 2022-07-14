local nvim_lsp = require("lspconfig")

-- Add various shortcuts
local on_attach = function(client)
    local buf_map = vim.api.nvim_buf_set_keymap
    vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
    vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
    vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
    vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
    vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
    vim.cmd(
        "command! LspDiagLine lua vim.diagnostic.open_float()")
    vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")

    local bufnr = 0
    buf_map(bufnr, "n", "gd", ":LspDef<CR>", {silent = true})
    buf_map(bufnr, "n", "rn", ":LspRename<CR>", {silent = true})
    buf_map(bufnr, "n", "gr", ":LspRefs<CR>", {silent = true})
    buf_map(bufnr, "n", "gi", ":LspImplementation<CR>", {silent = true})
    buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>", {silent = true})
    buf_map(bufnr, "n", "K", ":LspHover<CR>", {silent = true})
    buf_map(bufnr, "n", "[c", ":LspDiagPrev<CR>", {silent = true, noremap = true})
    buf_map(bufnr, "n", "]c", ":LspDiagNext<CR>", {silent = true, noremap = true})
    buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>", {silent = true})
    buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>", {silent = true})
    buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>", {silent = true})
    
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_exec([[
         augroup LspAutocommands
             autocmd! * <buffer>
             autocmd BufWritePost <buffer> LspFormatting
         augroup END
         ]], true)
    end
end

-- Typescript setup
nvim_lsp.tsserver.setup {
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        on_attach(client)
    end
}

-- Formatter setup
local eslint = {
  lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}
local prettier = {
  formatCommand = (
    function()
      if not vim.fn.empty(vim.fn.glob(vim.loop.cwd() .. '/.prettierrc')) then
        return "./node_modules/.bin/prettier --config ./.prettierrc"
      else
        return "prettier"
      end
    end
  )()
}
nvim_lsp.efm.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = true
    client.resolved_capabilities.goto_definition = false
    on_attach(client)
  end,
  root_dir = function()
    return vim.fn.getcwd()
  end,
  settings = {
    languages = {
      javascript = {eslint},
      javascriptreact = {eslint},
      ["javascript.jsx"] = {eslint},
      typescript = {eslint},
      ["typescript.tsx"] = {eslint},
      typescriptreact = {eslint}
      -- javascript = {eslint, prettier},
      -- javascriptreact = {eslint, prettier},
      -- ["javascript.jsx"] = {eslint, prettier},
      -- typescript = {eslint, prettier},
      -- ["typescript.tsx"] = {eslint, prettier},
      -- typescriptreact = {eslint, prettier}
    }
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescript.tsx",
    "typescriptreact"
  },
}

-- Tree sitter setup
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript", "python", "vim", "scss", "css", "yaml", "tsx" }, 
  highlight = {
    enable = true,
  },
}

-- Show diagnostics in popup
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		underline = true,
		signs = true,
	}
)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, { focusable = false }
)

