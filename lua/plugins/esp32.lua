-- 文件路径: ~/.config/nvim/lua/plugins/esp32.lua
return {
  -- ESP32 插件本体
  {
    "Aietes/esp32.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },
    opts = {
      build_dir = "build.clang", -- 默认构建目录，可改
    },
    config = function(_, opts)
      require("esp32").setup(opts)
    end,
    keys = {
      { "<leader>RM", function() require("esp32").pick("monitor") end, desc = "ESP32: Pick & Monitor" },
      { "<leader>Rm", function() require("esp32").command("monitor") end, desc = "ESP32: Monitor" },
      { "<leader>RF", function() require("esp32").pick("flash") end, desc = "ESP32: Pick & Flash" },
      { "<leader>Rf", function() require("esp32").command("flash") end, desc = "ESP32: Flash" },
      { "<leader>Rc", function() require("esp32").command("menuconfig") end, desc = "ESP32: Configure" },
      { "<leader>RC", function() require("esp32").command("clean") end, desc = "ESP32: Clean" },
      { "<leader>Rr", ":ESPReconfigure<CR>", desc = "ESP32: Reconfigure project" },
      { "<leader>Ri", ":ESPInfo<CR>", desc = "ESP32: Project Info" },
    },
  },

  -- 配置 clangd 使用 ESP32 的专用 LSP 配置
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local esp32 = require("esp32")
      opts.servers = opts.servers or {}
      opts.servers.clangd = esp32.lsp_config()

      -- 新增一个 on_attach 函数来设置快捷键
      opts.on_attach = function(client, bufnr)
        -- 确保 LSP 功能已连接
        if client.server_capabilities.definitionProvider then
          -- 映射 gd 到 LSP 跳转定义功能
          local lsp_buf_definition = vim.lsp.buf.definition
          vim.keymap.set("n", "gd", lsp_buf_definition, { buffer = bufnr, desc = "LSP: Go to Definition" })
        end
      end

      return opts
    end,
  },
}

