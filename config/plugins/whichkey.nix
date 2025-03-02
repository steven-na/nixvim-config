{
    plugins.which-key = {
        enable = true;
        settings = {
            delay = 200;
            expand = 1;
            notify = false;
            preset = false;
            replace = {
                desc = [
                    [
                        "<space>"
                        "SPACE"
                    ]
                    [
                        "<leader>"
                        "SPACE"
                    ]
                    [
                        "<[cC][rR]>"
                        "RETURN"
                    ]
                    [
                        "<[tT][aA][bB]>"
                        "TAB"
                    ]
                    [
                        "<[bB][sS]>"
                        "BACKSPACE"
                    ]
                ];
            };
            spec = [
                {
                    __unkeyed-1 = "<leader>c";
                    group = "Code";
                }
                {
                    __unkeyed-1 = "<leader>g";
                    group = "Git";
                }
                {
                    __unkeyed-1 = "<leader>d";
                    group = "Symbol find";
                }
                {
                    __unkeyed-1 = "<leader>s";
                    group = "Bufferline";
                }
                {
                    __unkeyed-1 = "<leader>sc";
                    group = "Close buffers";
                }

                {
                    __unkeyed-1 = "<leader>t";
                    group = "Telescope";
                }
                {
                    __unkeyed-1 = "<leader>S";
                    group = "Snacks commands";
                }
            ];
        };
    };
}
