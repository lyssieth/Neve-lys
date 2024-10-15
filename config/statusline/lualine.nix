{
  plugins.lualine = {
    enable = false;

    settings = {
      always_divide_middle = true;
      globalstatus = true;
      ignore_focus = ["neo-tree"];
      extensions = ["fzf"];
      theme = "auto";
      component_separators = {
        left = "|";
        right = "|";
      };
      section_separators = {
        left = "█"; # 
        right = "█"; # 
      };
      sections = {
        lualine_a = ["mode"];
        lualine_b = [
          {
            name = "branch";
            icon = "";
          }
          "diff"
          "diagnostics"
        ];
        lualine_c = ["filename"];
        lualine_x = ["filetype"];
        lualine_y = ["progress"];
        lualine_z = [''" " .. os.date("%R")''];
      };
    };
  };
}
