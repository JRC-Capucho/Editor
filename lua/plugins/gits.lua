return {
	"lewis6991/gitsigns.nvim",
	event = "BufWrite",
	lazy = true,
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
	},
	config = function(buffer)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, desc)
			vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
		end

		map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
		map("n", "<leader>ha", gs.stage_hunk, { desc = "Stage Hunk" })
		map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
		map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset Buffer" })
		map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
		map("n", "<leader>hb", function()
			gs.blame_line({ full = true })
		end, { desc = "Blame line" })
		map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle line Blame" })
		map("n", "<leader>hd", gs.diffthis, { desc = "Diff" })
		map("n", "<leader>hD", function()
			gs.diffthis("~")
		end, { desc = "Diff this" })
		map("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle Deleted" })
	end,
}
