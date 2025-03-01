{
    plugins.lualine = {
        enable = true;

        luaConfig.pre = #lua
        ''
            function isNormal()
                return vim.tbl_contains({ "n", "niI", "niR", "niV", "nt", "ntT" }, vim.api.nvim_get_mode().mode)
            end
            
            function isInsert()
                return vim.tbl_contains({ "i", "ic", "ix" }, vim.api.nvim_get_mode().mode)
            end
            
            function isVisual()
                return vim.tbl_contains({ "v", "vs", "V", "Vs", "\22", "\22s", "s", "S", "\19" }, vim.api.nvim_get_mode().mode)
            end
            
            function isCommand()
                return vim.tbl_contains({ "c", "cv", "ce", "rm", "r?" }, vim.api.nvim_get_mode().mode)
            end
            
            function isReplace()
                return vim.tbl_contains({ "R", "Rc", "Rx", "Rv", "Rvc", "Rvx", "r" }, vim.api.nvim_get_mode().mode)
            end
        '';

        settings = {
            options = {
                icons_enabled = true;
                theme = "nord";
                component_separators = {
                    left = "\\";
                    right = "/";
                };
                section_separators = {
                    left = "";
                    right = "";
                };

                disabled_filetypes = {
                    "1" = "snacks_dashboard";
                    "2" = "neo-tree";
                };

                always_divide_middle = true;
                globalstatus = false;
                refresh = {
                    statusline = 1000;
                    tabline = 1000;
                    winbar = 1000;
                };
            };

            sections = {
                lualine_a = [
                    {
                        __unkeyed-1 = "mode";
                        icon_enable = true;
                        fmt = {
                            __raw = #lua
                            ''
                    function()
                        return isNormal() and ""
                            or isInsert() and ""
                            or isVisual() and "󰒉"
                            or isCommand() and ""
                            or isReplace() and ""
                            or vim.api.nvim_get_mode().mode == "t" and ""
                            or ""
                    end
                            '';
                        };
                    }
                    "mode"
                ];
                lualine_b = [
                    "branch"
                    "diff"
                ];
                lualine_c = [
                    {
                        __unkeyed-1 = "diagnostics";
                        symbols = {
                            error = "󰅙 ";
                            warn = " ";
                            info = "󰋼 ";
                            hint = "󰌵 ";
                        };
                    }
                ];
                lualine_x = [
                    {
                        __unkeyed-1 = "filetype";
                        colored = true;
                        icon_only = true;
                        icon = {
                            align = "right";
                        };
                    }
                    "filename"
                ];
                lualine_y = [
                    {
                        __unkeyed-1 = "progress";
                        color = {
                            __raw = #lua
                            ''
                        function()
                            return {
                                fg = vim.fn.synIDattr(
                                    vim.fn.synIDtrans(
                                        vim.fn.hlID(
                                            "progressHl"
                                            .. (math.floor(((vim.fn.line(".") / vim.fn.line("$")) / 0.17))) + 1
                                        )
                                    ),
                                    "fg"
                                ),
                            }
                        end
                            '';
                        };
                    }
                ];
                lualine_z = [
                    "location"
                ];
            };
        };
    };
}
