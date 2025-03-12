{
    pkgs,
    ...
}:
{
    plugins.rustaceanvim = {
        enable = true;
        settings = {
            tools.hover_actions.auto_focus = true;
            tools.enable_clippy = true;
            server = {
                default_settings = {
                    inlayHints = {
                        lifetimeElisionHints = {
                            enable = "always";
                        };
                    };
                    rust-analyzer = {
                        cargo = {
                            allFeatures = true;
                        };
                        check = {
                            command = "clippy";
                        };
                        files = {
                            excludeDirs = [
                                "target"
                                ".git"
                                ".cargo"
                                ".github"
                                ".direnv"
                            ];
                        };
                    };
                };
            };
        };
    };

    extraPackages = with pkgs; [
        rustc
    ];
}
