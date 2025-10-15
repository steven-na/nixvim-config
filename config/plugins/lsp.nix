{ pkgs, lib, ... }:
{
    plugins = {
        lsp = {
            enable = true;
            inlayHints = true;
            servers = {
                html.enable = true;
                lua_ls.enable = true;
                bashls.enable = true;
                marksman.enable = true;
                pyright.enable = true;
                gopls.enable = true;
                jsonls.enable = true;
                dartls.enable = false;
                cssls.enable = true;
                rust_analyzer = {
                    enable = false;
                    installCargo = true;
                    installRustc = true;
                };
                eslint.enable = true;
                nil_ls.enable = true;
                nixd = {
                    enable = true;
                    settings =
                        let
                            flake = ''(builtins.getFlake "github:steven-na/nixosConfig)""'';
                        in
                        {
                            nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";
                            formatting = {
                                command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
                            };
                            options = {
                                nixos.expr = ''${flake}.nixosConfigurations.main.options'';
                                home-manager.expr = ''${flake}.homeConfigurations.blakec@main.options'';
                            };
                        };
                };
                yamlls = {
                    enable = true;
                    extraOptions = {
                        settings = {
                            yaml = {
                                schemas = {
                                    kubernetes = "'*.yaml";
                                    "http://json.schemastore.org/github-workflow" = ".github/workflows/*";
                                    "http://json.schemastore.org/github-action" = ".github/action.{yml,yaml}";
                                    "http://json.schemastore.org/ansible-stable-2.9" = "roles/tasks/*.{yml,yaml}";
                                    "http://json.schemastore.org/kustomization" = "kustomization.{yml,yaml}";
                                    "http://json.schemastore.org/ansible-playbook" = "*play*.{yml,yaml}";
                                    "http://json.schemastore.org/chart" = "Chart.{yml,yaml}";
                                    "https://json.schemastore.org/dependabot-v2" = ".github/dependabot.{yml,yaml}";
                                    "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json" =
                                        "*docker-compose*.{yml,yaml}";
                                    "https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json" =
                                        "*flow*.{yml,yaml}";
                                };
                            };
                        };
                    };
                };
            };
            keymaps = {
                silent = true;
                lspBuf = {
                    gd = {
                        action = "definition";
                        desc = "Goto Definition";
                    };
                    gr = {
                        action = "references";
                        desc = "Goto References";
                    };
                    gD = {
                        action = "declaration";
                        desc = "Goto Declaration";
                    };
                    gI = {
                        action = "implementation";
                        desc = "Goto Implementation";
                    };
                    gT = {
                        action = "type_definition";
                        desc = "Type Definition";
                    };
                    K = {
                        action = "hover";
                        desc = "Hover";
                    };
                };
                diagnostic = {
                    "<leader>L" = {
                        action = "open_float";
                        desc = "Line Diagnostics";
                    };
                    "[d" = {
                        action = "goto_next";
                        desc = "Next Diagnostic";
                    };
                    "]d" = {
                        action = "goto_prev";
                        desc = "Previous Diagnostic";
                    };
                };
            };
        };
    };
    # extraConfigLua = ''
    #     local _border = "rounded"
    #
    #     vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    #       vim.lsp.handlers.hover, {
    #         border = _border
    #       }
    #     )
    #
    #     vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    #       vim.lsp.handlers.signature_help, {
    #         border = _border
    #       }
    #     )
    #
    #     vim.diagnostic.config{
    #       float={border=_border}
    #     };
    #
    #     require('lspconfig.ui.windows').default_options = {
    #       border = _border
    #     }
    # '';
}
