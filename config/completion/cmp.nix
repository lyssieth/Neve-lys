{
  plugins = {
    nvim-cmp = {
      enable = true;
      autoEnableSources = true;
      snippet = {
        expand = "luasnip";
      };
      formatting = {
        fields = [ "kind" "abbr" "menu" ];
        format = ''
          function(entry, vim_item)
              vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
              vim_item.menu = ({
                  path = "[Path]",
                  nvim_lua = "[NVIM_LUA]",
                  nvim_lsp = "[LSP]",
                  luasnip = "[Snippet]",
                  buffer = "[Buffer]",
              })[entry.source.name]
              return vim_item
          end
        '';
      };
      sources = [
        { name = "path"; }
        { name = "nvim_lua"; }
        { name = "nvim_lsp"; }
        { name = "luasnip"; }
        {
          name = "buffer";
          # Words from other open buffers can also be suggested.
          option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
        }
      ];

      window = {
        completion = { };
        documentation = { };
      };

      mapping = {
        "<CR>" = {
          action = "cmp.mapping.confirm({ select = true })";
        };
        "<Tab>" = {
          modes = [ "i" "s" ];
          action = ''
            function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expandable() then
                luasnip.expand()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              elseif check_backspace() then
                fallback()
              else
                fallback()
              end
            end
          '';
        };
        # "<C-n>" = {
        #   action = "cmp.mapping.select_next_item()";
        # };
        # "<C-p>" = {
        #   action = "cmp.mapping.select_prev_item()";
        # };
        # "<C-b>" = {
        #   action = "cmp.mapping.scroll_docs(-4)";
        # };
        # "<C-f>" = {
        #   action = "cmp.mapping.scroll_docs(4)";
        # };
        # "<C-Space>" = {
        #   action = "cmp.mapping.complete()";
        # };
        # "<C-e>" = {
        #   action = "cmp.mapping.abort()";
        # };
        # "<S-CR>" = {
        #   action = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
        # };
      };
    };
    cmp-buffer = {
      enable = true;
    };
    cmp_luasnip = {
      enable = true;
    };
    cmp-nvim-lua = {
      enable = true;
    };
    cmp-nvim-lsp = {
      enable = true;
    };
    cmp-path = {
      enable = true;
    };
  };
  extraConfigLua = ''
             luasnip = require("luasnip")
             kind_icons = {
               Text = "󰊄",
               Method = "",
               Function = "󰡱",
               Constructor = "",
               Field = "",
               Variable = "󱀍",
               Class = "",
               Interface = "",
               Module = "󰕳",
               Property = "",
               Unit = "",
               Value = "",
               Enum = "",
               Keyword = "",
               Snippet = "",
               Color = "",
               File = "",
               Reference = "",
               Folder = "",
               EnumMember = "",
               Constant = "",
               Struct = "",
               Event = "",
               Operator = "",
               TypeParameter = "",
             }-- find more here: https://www.nerdfonts.com/cheat-sheet

              local cmp = require'cmp'
     cmp.setup({
    window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
    },
     })

              cmp.setup.cmdline(":", {
              mapping = cmp.mapping.preset.cmdline(),
              sources = cmp.config.sources({
                  { name = "path" },
              }, {
                  { name = "cmdline" },
              }),
            })
  '';
}