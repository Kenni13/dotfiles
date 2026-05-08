return {
	"mrcjkb/rustaceanvim",
	version = "^9",
	lazy = false,

	config = function()
		local cfg = require("rustaceanvim.config")
		local mason_path = vim.fn.stdpath("data") .. "/mason"
		local codelldb_path = mason_path .. "/packages/codelldb/extension/adapter/codelldb"
		local liblldb_path = mason_path .. "/packages/codelldb/extension/lldb/lib/liblldb.so"

		vim.g.rustaceanvim = {
			dap = {
				adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
			},
		}

		vim.keymap.set("n", "<leader>dt", function()
			vim.cmd("RustLsp testables")
		end)
		vim.keymap.set("n", "<leader>dd", function()
			vim.cmd("RustLsp debuggables")
		end)
	end,
}
