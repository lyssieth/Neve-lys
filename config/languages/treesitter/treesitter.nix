{pkgs, ...}: {
  plugins.treesitter = {
    enable = true;
    folding = true;
    nixvimInjections = true;

    grammarPackages = with pkgs;
      [
        tree-sitter-grammars.tree-sitter-just
        tree-sitter-grammars.tree-sitter-svelte
      ]
      ++ vimPlugins.nvim-treesitter.passthru.allGrammars;

    settings = {
      highlight.enable = true;
      indent.enable = true;
    };
  };
}
