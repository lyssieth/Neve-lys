{
  plugins.oil = {
    enable = true;
    settings = {
      use_default_keymaps = true;
      delete_to_trash = true;
      view_options = {
        show_hidden = true;
        is_always_hidden = ''
          function(name, bufnr)
            return name:match("^.git") or name:match("node_modules") or name:match("target") or name:match("^.direnv") or name:match("^.svelte\\-kit")
          end
        '';
      };
      preview = {
        border = "rounded";
      };

      float = {
        padding = 2;
        max_width = 0; # ''math.ceil(vim.o.lines * 0.8 - 4)'';
        max_height = 0; # ''math.ceil(vim.o.columns * 0.8)'';
        border = "rounded"; # 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        win_options = {
          winblend = 0;
        };
      };

      keymaps = {
        "g?" = "actions.show_help";
        "<CR>" = "actions.select";
        "<C-\\>" = "actions.select_vsplit";
        "<C-enter>" = "actions.select_split"; # this is used to navigate left
        "<C-t>" = "actions.select_tab";
        "<C-p>" = "actions.preview";
        "<C-c>" = "actions.close";
        "<C-r>" = "actions.refresh";
        "-" = "actions.parent";
        "_" = "actions.open_cwd";
        "`" = "actions.cd";
        "~" = "actions.tcd";
        "gs" = "actions.change_sort";
        "gx" = "actions.open_external";
        "g." = "actions.toggle_hidden";
        "q" = "actions.close";
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>o";
      action = ":Oil --float<CR>";
      options = {
        desc = "Open parent directory";
        silent = true;
      };
    }
  ];
}
