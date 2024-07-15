{
  plugins.neo-tree = {
    enable = true;
    enableDiagnostics = true;
    enableGitStatus = true;
    enableModifiedMarkers = true;
    enableRefreshOnWrite = true;
    closeIfLastWindow = true;
    popupBorderStyle = "rounded";
    buffers = {
      bindToCwd = false;
      followCurrentFile = {
        enabled = true;
        leaveDirsOpen = false;
      };
    };
    window = {
      width = 40;
      height = 15;
      autoExpandWidth = false;
      mappings = {
        "<space>" = "none";
      };
    };
    filesystem.filteredItems = {
      visible = true;
      neverShow = [".git" ".svelte-kit" ".direnv" "target" "node_modules"];
    };
    sourceSelector.winbar = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = ":Neotree toggle reveal<CR>";
      options = {
        desc = "Toggle Explorer";
        silent = true;
      };
    }
  ];
}
