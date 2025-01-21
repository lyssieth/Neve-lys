{
  plugins.typescript-tools = {
    enable = true;

    settings = {
      tsserver_file_preferences = {
        # Inlay Hints
        __raw = ''
          function(ft)
            return {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            }
          end
        '';
      };

      on_attach = ''
        function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false

          if vim.lsp.inlay_hint then
            vim.lsp.inlay_hint(bufnr, true)
          end
        end
      '';
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>co";
      action = "<cmd>TSToolsOrganizeImports<cr>";
      options = {
        desc = "Organize Imports";
      };
    }
    {
      mode = "n";
      key = "<leader>cR";
      action = "<cmd>TSToolsRemoveUnusedImports<cr>";
      options = {
        desc = "Remove Unused Imports";
      };
    }
  ];
}
