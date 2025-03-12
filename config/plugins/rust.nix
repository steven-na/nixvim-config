{
    pkgs,
    ...
}:
{
    plugins.rustaceanvim = {
        enable = true;
        settings = {
            tools.hover_actions.auto_focus = true;
        };
    };

    extraPackages = with pkgs; [
        rustc
    ];
}
