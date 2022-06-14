local M = {}

function M.config()	
	local status_ok, lualine = pcall(require, "lualine")
	if not status_ok then
		return
	end

	local hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end

	local diagnostics = {
		"diagnostics",
		sources = { "nvim_diagnostic" },
		sections = { "error", "warn", "info"},
		symbols = {error = " ", warn = " ", info = " "},
		-- symbols = { error = " ", warn = " ", info = " ", hint = " " },
		-- symbols = { error = " ", warn = " " },
		colored = false,
		update_in_insert = false,
		always_visible = true,
	}

	local diff = {
		"diff",
		colored = false,
		symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width
	}

	local mode = {
		"mode",
		fmt = function(str)
			return "- " .. str .. " -"
		end,
	}

	local filetype = {
		"filetype",
		icons_enabled = true,
		icon = nil,
	}
	
	local fileformat = {
		"fileforrmat",
		icons_enabled = false,
		icon = nil,
	}

	local branch = {
		"branch",
		icons_enabled = true,
		icon = "",
	}

	local location = {
		"location",
		padding = 0,
	}

	-- local rightside = function()
	-- 	return "▊"
	-- end

	-- cool function for progress
	local progress_visual = function()
		local current_line = vim.fn.line(".")
		local total_lines = vim.fn.line("$")
		local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
		local line_ratio = current_line / total_lines
		local index = math.ceil(line_ratio * #chars)
		return chars[index]
	end

	local spaces = function()
		return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
	end

	local config = {
		options = {
			icons_enabled = true,
			theme = "auto",
		 section_separators = {left = '', right = ''},
		 component_separators = {left = '', right = ''},
			disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
			always_divide_middle = true,
		},
		sections = {
			lualine_a = { mode },
			lualine_b = { branch },
			-- lualine_c = { mode, "filename" },
			lualine_c = {diagnostics},
			-- lualine_x = { "encoding", "fileformat", "filetype" },
			-- lualine_x = { diff, spaces, "encoding", filetype },
			lualine_x = { spaces, "encoding", filetype },
			lualine_y = { location, "progress" },
			lualine_z = { progress_visual },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {},
	}
	lualine.setup(config)
end

return M
