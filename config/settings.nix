{
    config = {

        extraConfigLuaPre = # lua
            ''
                if vim.loop.os_uname().sysname == "Windows_NT" then
                    vim.o.shell = vim.fn.executable("pwsh") and "pwsh" or "powershell"
                end
            '';

        globals = {
            mapleader = " ";
            maplocalleader = " ";
        };

        opts = {
            timeoutlen = 300;
            updatetime = 250;

            expandtab = true;
            tabstop = 4;
            softtabstop = 4;
            shiftwidth = 4;

            showmode = false;
            number = true;
            relativenumber = true;
            cursorline = true;
            scrolloff = 10;

            swapfile = false;

            list = true;
            listchars = {
                tab = "» ";
                trail = "·";
                nbsp = "␣";
            };
        };

        diagnostics = {
            underline = true;
            virtual_text = {
                prefix = "";
            };
            # signs.text = {
            #     "sec.ERROR" = "󰅙";
            #     "sec.WARN" = "";
            #     "sec.INFO" = "󰋼";
            #     "sec.HINT" = "󰌵";
            # };
            signs.text = [
                "󰅙"
                ""
                "󰋼"
                "󰌵"
            ];
            float = {
                border = "single";
            };
        };
    };
}
