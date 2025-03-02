{
    plugins.lazy.enable = true;
    plugins.snacks = {
        enable = true;
        settings = {
            bigfile.enabled = true;
            indent.enabled = true;
            input.enabled = true;
            quickfile.enabled = true;
            statuscolumn.enabled = true;
            words.enabled = true;
            scroll.enabled = true;
            notifier = {
                enabled = true;
                timeout = 2000;
            };
            dashboard = {
                enabled = true;
                sections = {
                    __unkeyed_1 = {
                        section = "header";
                    };
                    __unkeyed_2 = {
                        section = "keys";
                        gap = 1;
                        padding = 1;
                    };
                };
            };
        };
    };
}
