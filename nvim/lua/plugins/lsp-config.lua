return {
    {
        "mason-org/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer"
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            vim.lsp.config('rust_analyzer', {
                -- Server-specific settings. See `:help lsp-quickstart`
                settings = {
                    ['rust-analyzer'] = {
                        cargo = {
                            allFeatures = true,
                            loadOutDirsFromCheck = true,
                        },
                        checkOnSave = true,
                        procMacro = {
                            enable = true,
                        },
                        diagnostics = {
                            enable = true;
                        },
                        inlayHints = {
                            enable = true,
                            showParameterNames = true,
                            -- parameterHintsPrefix = "<- ",
                            -- otherHintsPrefix = "=> ",
                        },
                    },
                },
                capabilities = capabilities,
            })

            vim.diagnostic.config({
                update_in_insert = true,
                virtual_text = true,
            })

            vim.lsp.config('lua_ls', {
                capabilities = capabilities,
            })

            vim.lsp.enable('rust_analyzer')
            vim.lsp.enable('lua_ls')

            -- Auto-enable inlay hints if supported
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client.server_capabilities.inlayHintProvider then
                        vim.lsp.inlay_hint.enable(true)
                    end
                end,
            })

            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = ' ',
                        [vim.diagnostic.severity.WARN] = ' ',
                        [vim.diagnostic.severity.INFO] = ' ',
                        [vim.diagnostic.severity.HINT] = '',
                    },
                }
            })

            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
        end
    },
    {
        "j-hui/fidget.nvim",
        opts = {
            -- options
        },
    }
}
