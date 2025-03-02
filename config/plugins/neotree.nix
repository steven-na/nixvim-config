{
    plugins.neo-tree = {
        enable = true;
        sources = [
            "filesystem"
            "buffers"
            "git_status"
            "document_symbols"
        ];
        defaultComponentConfigs = {
            indent = {
                withExpanders = true;
                expanderCollapsed = "󰅂";
                expanderExpanded = "󰅀";
                expanderHighlight = "NeoTreeExpander";
            };
            gitStatus = {
                symbols = {
                    added = " ";
                    conflict = "󰩌 ";
                    deleted = "󱂥";
                    ignored = " ";
                    modified = " ";
                    renamed = "󰑕";
                    staged = "󰩍";
                    unstaged = "";
                    untracked = " ";
                };
            };
        };
        closeIfLastWindow = true;
        enableGitStatus = true;
        window.width = 30;
        eventHandlers = {
            "file_open_requested" = ''
            function()
                require("neo-tree.command").execute({ action = "close" })
            end'';
        };
    };
    keymaps = [
        {
            mode = [ "n" ];
            key = "<leader>n";
            action = ":Neotree filesystem reveal left<CR>";
            options = {
                desc = "Open file tree";
            };
        }
    ];
}
