{ pkgs, ... }:
{
    plugins.cmp = {
        enable = true;
        luaConfig.pre = ''
                        local compare = require("cmp.config.compare")
            			local icons = {
            				Text = "󰉿",
            				Method = "󰆧",
            				Function = "󰊕",
            				Constructor = "",
            				Field = "󰜢",
            				Variable = "󰀫",
            				Class = "󰠱",
            				Interface = "",
            				Module = "",
            				Property = "󰜢",
            				Unit = "󰑭",
            				Value = "󰎠",
            				Enum = "",
            				Keyword = "󰌋",
            				Snippet = "",
            				Color = "󰏘",
            				File = "󰈙",
            				Reference = "󰈇",
            				Folder = "󰉋",
            				EnumMember = "",
            				Constant = "󰏿",
            				Struct = "󰙅",
            				Event = "",
            				Operator = "󰆕",
            				TypeParameter = "",
            			}

            			vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", italic = true })
        '';
        settings = {
            autoEnableSources = true;
            experimental = {
                ghost_text = true;
            };
            snippet = {
                expand = {
                    __raw = ''
                                            function(args)
                        						require("luasnip").lsp_expand(args.body)
                        					end
                    '';
                };
            };
            sources = [
                { name = "nvim_lsp"; }
                { name = "git"; }
                {
                    name = "buffer";
                    option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
                    keywordLength = 3;
                }
                {
                    name = "path";
                    keywordLength = 3;
                }
                {
                    name = "luasnip";
                    keywordLength = 3;
                }
            ];
            mapping = {
                "<C-b>" = {
                    __raw = "cmp.mapping.scroll_docs(-4)";
                };
                "<C-f>" = {
                    __raw = "cmp.mapping.scroll_docs(4)";
                };
                "<C-n>" = {
                    __raw = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })";
                };
                "<C-p>" = {
                    __raw = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })";
                };
                "<C-y>" = {
                    __raw = ''
                                            cmp.mapping(
                        						cmp.mapping.confirm({
                        							behavior = cmp.ConfirmBehavior.Insert,
                        							select = true,
                        						}),
                        						{ "i", "c" }
                        					)
                    '';
                };
            };
            # sorting = {
            #     comparators = [
            #         {
            #             __raw = "compare.exact";
            #         }
            #         {
            #             __raw = "compare.recently_used";
            #         }
            #     ];
            # };
            window = {
                completion = {
                    __raw = ''
                                            cmp.config.window.bordered({
                        						border = "double",
                        						winhighlight = "Normal:Normal,FloatBorder:Normal,Search:NONE",
                        						side_padding = 0,
                        						col_offset = -2,
                        					})
                    '';
                };
                documentation = {
                    __raw = "cmp.config.window.bordered()";
                };
            };
            formatting = {
                fields = [
                    "kind"
                    "abbr"
                    "menu"
                ];
                format = {
                    __raw = ''
                                            function(_, vim_item)
                        						local kind = vim_item.kind
                        						vim_item.kind = icons[kind] or ""
                        						vim_item.menu = " (" .. (kind or "Unknown") .. ") "
                        						return vim_item
                        					end
                    '';
                };
            };
        };
    };

    plugins.luasnip = {
        enable = true;
        fromVscode = [
            { }
        ];
        settings = {
            enable_autosnippets = true;
        };

        luaConfig.post = ''
                        local ls = require("luasnip")
            			vim.keymap.set({ "i", "s" }, "<c-k>", function()
            				if ls.expand_or_jumpable() then
            					ls.expand_or_jump()
            				end
            			end, { silent = true })
            			vim.keymap.set({ "i", "s" }, "<c-j>", function()
            				if ls.jumpable(-1) then
            					ls.jump(-1)
            				end
            			end, { silent = true })
                        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        '';
    };

    extraPlugins = builtins.attrValues {
        inherit (pkgs.vimPlugins)
            friendly-snippets
            ; # Snippets for luasnip
    };

    plugins.schemastore = {
        enable = true;
        json = {
            enable = true;
        };
        yaml = {
            enable = true;
        };
    };
}
