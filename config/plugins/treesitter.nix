{ pkgs, ... }:
{
    plugins.treesitter = {
        enable = true;
        settings = {
            indent.enable = true;
            highlight.enable = true;
            incremental_selection = {
                enable = true;
                keymaps = {
                    init_selection = "<C-space>";
                    scope_incremental = "<C-space>";
                    node_incremental = "<TAB>";
                    node_decremental = "<S-TAB>";
                };
            };
        };
        folding = false;
        nixvimInjections = true;
        grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    };
plugins.treesitter-textobjects = {
    enable = false;
    select = {
      enable = true;
      lookahead = true;
      keymaps = {
        "aa" = "@parameter.outer";
        "ia" = "@parameter.inner";
        "af" = "@function.outer";
        "if" = "@function.inner";
        "ac" = "@class.outer";
        "ic" = "@class.inner";
        "ii" = "@conditional.inner";
        "ai" = "@conditional.outer";
        "il" = "@loop.inner";
        "al" = "@loop.outer";
        "at" = "@comment.outer";
      };
    };
    move = {
      enable = true;
      gotoNextStart = {
        "]m" = "@function.outer";
        "]]" = "@class.outer";
      };
      gotoNextEnd = {
        "]M" = "@function.outer";
        "][" = "@class.outer";
      };
      gotoPreviousStart = {
        "[m" = "@function.outer";
        "[[" = "@class.outer";
      };
      gotoPreviousEnd = {
        "[M" = "@function.outer";
        "[]" = "@class.outer";
      };
    };
  };
}
