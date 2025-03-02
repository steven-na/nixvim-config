{
    plugins = {
        bufferline = {
            enable = true;
            settings = {
                options = {
                    offsets = [
                        {
                            filetype = "neo-tree";
                            highlight = "Directory";
                            text = "File Explorer";
                            text_align = "center";
                        }
                    ];
                };
            };
        };
        web-devicons.enable = true;
    };

    keymaps = [
        {
            mode = "n";
            key = "]b";
            action = "<cmd>BufferLineCycleNext<cr>";
            options = {
                desc = "Cycle to next buffer";
            };
        }
        {
            mode = "n";
            key = "[b";
            action = "<cmd>BufferLineCyclePrev<cr>";
            options = {
                desc = "Cycle to previous buffer";
            };
        }
        {
            mode = "n";
            key = "<Leader>ss";
            action = "<cmd>BufferLinePick<cr>";
            options = {
                desc = "Switch tabs";
            };
        }
        {
            mode = "n";
            key = "<Leader>s1";
            action = "<cmd>BufferLineGoToBuffer 1<cr>";
            options = {
                desc = "which_key_ignore";
            };
        }
        {
            mode = "n";
            key = "<Leader>s2";
            action = "<cmd>BufferLineGoToBuffer 2<cr>";
            options = {
                desc = "which_key_ignore";
            };
        }
        {
            mode = "n";
            key = "<Leader>s3";
            action = "<cmd>BufferLineGoToBuffer 3<cr>";
            options = {
                desc = "which_key_ignore";
            };
        }
        {
            mode = "n";
            key = "<Leader>s4";
            action = "<cmd>BufferLineGoToBuffer 4<cr>";
            options = {
                desc = "which_key_ignore";
            };
        }
        {
            mode = "n";
            key = "<Leader>s5";
            action = "<cmd>BufferLineGoToBuffer 5<cr>";
            options = {
                desc = "which_key_ignore";
            };
        }
        {
            mode = "n";
            key = "<Leader>s6";
            action = "<cmd>BufferLineGoToBuffer 6<cr>";
            options = {
                desc = "which_key_ignore";
            };
        }
        {
            mode = "n";
            key = "<Leader>s7";
            action = "<cmd>BufferLineGoToBuffer 7<cr>";
            options = {
                desc = "which_key_ignore";
            };
        }
        {
            mode = "n";
            key = "<Leader>s8";
            action = "<cmd>BufferLineGoToBuffer 8<cr>";
            options = {
                desc = "which_key_ignore";
            };
        }
        {
            mode = "n";
            key = "<Leader>s9";
            action = "<cmd>BufferLineGoToBuffer 9<cr>";
            options = {
                desc = "which_key_ignore";
            };
        }
        {
            mode = "n";
            key = "<leader>scc";
            action = "<cmd>bdelete<cr>";
            options = {
                desc = "Delete buffer";
            };
        }
        {
            mode = "n";
            key = "<leader>scl";
            action = "<cmd>BufferLineCloseLeft<cr>";
            options = {
                desc = "Delete buffers to the left";
            };
        }
        {
            mode = "n";
            key = "<leader>sco";
            action = "<cmd>BufferLineCloseOthers<cr>";
            options = {
                desc = "Delete other buffers";
            };
        }
        {
            mode = "n";
            key = "<leader>sp";
            action = "<cmd>BufferLineTogglePin<cr>";
            options = {
                desc = "Toggle pin";
            };
        }
        {
            mode = "n";
            key = "<leader>scn";
            action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
            options = {
                desc = "Delete non-pinned buffers";
            };
        }
    ];
}
