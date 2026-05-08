local function pick_executable(callback)
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	local results = vim.fn.glob(vim.fn.getcwd() .. "/**/*", true, true)

	pickers
		.new({}, {
			prompt_title = "Select executable",
			finder = finders.new_table({
				results = results,
			}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_bufnr, _)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					callback(selection[1])
				end)
				return true
			end,
		})
		:find()
end

return {
	{
		"mfussenegger/nvim-dap",
		dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			vim.keymap.set("n", "dc", function()
				require("dap").continue()
			end)
			vim.keymap.set("n", "dn", function()
				require("dap").step_over()
			end)
			vim.keymap.set("n", "di", function()
				require("dap").step_into()
			end)
			vim.keymap.set("n", "do", function()
				require("dap").step_out()
			end)
			vim.keymap.set("n", "<leader>db", function()
				require("dap").toggle_breakpoint()
			end)
			vim.keymap.set("n", "<leader>B", function()
				require("dap").set_breakpoint()
			end)
			vim.keymap.set("n", "<leader>lp", function()
				require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end)
			vim.keymap.set("n", "<leader>dr", function()
				require("dap").repl.open()
			end)
			vim.keymap.set("n", "<leader>dl", function()
				require("dap").run_last()
			end)
			vim.keymap.set({ "n", "v" }, "<leader>dh", function()
				require("dap.ui.widgets").hover()
			end)
			vim.keymap.set({ "n", "v" }, "<leader>dp", function()
				require("dap.ui.widgets").preview()
			end)
			vim.keymap.set("n", "<leader>df", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.frames)
			end)
			vim.keymap.set("n", "<leader>ds", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.scopes)
			end)

			-- codelldb adapter
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = "codelldb",
					args = { "--port", "${port}" },
				},
			}

			-- configurations
			dap.configurations.rust = {
				{
					name = "Debug Rust program",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input(
							"Path to binary: ",
							vim.fn.getcwd() .. "/target/debug/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t"),
							"file"
						)
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}

			dap.configurations.c = {
				{
					name = "Debug C program",
					type = "codelldb",
					request = "launch",
					program = function()
						local co = coroutine.running()

						pick_executable(function(path)
							coroutine.resume(co, path)
						end)

						return coroutine.yield()
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}

			dap.configurations.cpp = {
				{
					name = "Debug C++ program",
					type = "codelldb",
					request = "launch",
					program = function()
						local co = coroutine.running()

						pick_executable(function(path)
							coroutine.resume(co, path)
						end)

						return coroutine.yield()
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}
		end,
	},
}
