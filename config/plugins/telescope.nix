{
    plugins.telescope = {
        enable = true;
        extensions = {
            fzf-native.enable = true;
            ui-select.enable = true;
        };
        keymaps = {
            "<leader>tp" = {
                action = "find_files";
                options = {
                  desc = "Find files fuzzily";
                };
            };
            "<leader>tg" = {
                action = "live_grep";
                options = {
                  desc = "Live grep";
                };
            };
            "<leader>ts" = {
                action = "grep_string";
                options = {
                  desc = "Live grep over string";
                };
            };
            "<leader>tb" = {
                action = "current_buffer_fuzzy_find";
                options = {
                   desc = "Live grep over buffer";
                };
            };
            "<leader>tl" = {
                action = "lsp_document_symbols";
                options = {
                    desc = "Live grep over local symbols";
                };
            };
            "<leader>tw" = {
                action = "lsp_dynamic_workspace_symbols";
                options = {
                    desc = "Live grep over workspace symbols";
                };
            };
        };
    };
}
