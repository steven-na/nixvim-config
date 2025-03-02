{
    keymaps = [
        {
            mode = [ "n" ];
            key = "<Space>";
            action = "<Nop>";
            options = {
                noremap = true;
                silent = true;
            };
        }
        {
            mode = [ "n" "i" ];
            key = "<Insert>";
            action = "<Nop>";
            options = {
                noremap = true;
                silent = true;
            };
        }
        {
            mode = [ "n" ];
            key = "<C-s>";
            action = ":w<CR>";
            options = {
                noremap = true;
                silent = true;
            };
        }
        {
            mode = [ "n" ];
            key = "<Esc>";
            action = "<cmd>nohlsearch<CR>";
        }
        {
            mode = [ "t" ];
            key = "<Esc><Esc>";
            action = "<C-\\><C-n>";
            options = {
                desc = "Exit terminal mode";
            };
        }
    ];
}
