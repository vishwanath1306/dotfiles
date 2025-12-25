-- Load configuration modules
require('vars')
require('opts')
require('keys')
require('plug')

-- Check if plugins are installed
local status_ok, _ = pcall(require, "mason")
if not status_ok then
    print("Plugins not installed. Run :PackerSync to install plugins.")
    return
end

-- Mason Setup
require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
})
require("mason-lspconfig").setup()

-- Rustaceanvim is configured via vim.g.rustaceanvim
vim.g.rustaceanvim = {
    server = {
        on_attach = function(client, bufnr)
            -- Keymaps for rust files
            local opts = { buffer = bufnr, silent = true }
            vim.keymap.set("n", "<C-space>", function() vim.cmd.RustLsp({'hover', 'actions'}) end, opts)
            vim.keymap.set("n", "<Leader>a", function() vim.cmd.RustLsp('codeAction') end, opts)
            vim.keymap.set("n", "<Leader>rd", function() vim.cmd.RustLsp('debuggables') end, opts)
            vim.keymap.set("n", "<Leader>rr", function() vim.cmd.RustLsp('runnables') end, opts)
        end,
        settings = {
            ['rust-analyzer'] = {
                checkOnSave = true,
                check = {
                    command = "clippy",
                },
            },
        },
    },
}

-- LSP Diagnostics Options Setup
local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
    set signcolumn=yes
    autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- Completion Plugin Setup
local cmp = require'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        })
    },
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp', keyword_length = 3 },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lua', keyword_length = 2 },
        { name = 'buffer', keyword_length = 2 },
        { name = 'vsnip', keyword_length = 2 },
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                vsnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
})

-- Treesitter Plugin Setup
local ts_ok, ts_configs = pcall(require, 'nvim-treesitter.configs')
if ts_ok then
    ts_configs.setup {
        ensure_installed = { "lua", "rust", "toml" },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
    }
end

-- Nvim-tree setup
require("nvim-tree").setup()

-- Comment setup
require('Comment').setup()

-- Autopairs setup
require("nvim-autopairs").setup {}

-- Flash setup (modern hop replacement)
require("flash").setup()

-- Todo-comments setup
require("todo-comments").setup {}

-- Trouble setup
require("trouble").setup {}

-- Illuminate setup
require('illuminate').configure({})

-- Indent blankline setup
require("ibl").setup()

-- DAP (debugger) setup
local dap = require('dap')
local dapui = require('dapui')

dapui.setup()

-- DAP UI auto open/close
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- DAP keymaps
vim.keymap.set('n', '<F5>', function() dap.continue() end)
vim.keymap.set('n', '<F10>', function() dap.step_over() end)
vim.keymap.set('n', '<F11>', function() dap.step_into() end)
vim.keymap.set('n', '<F12>', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)

-- Theme
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()
