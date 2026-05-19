-- =============================================================================
-- Custom Statusline — built-in only, no plugins
-- =============================================================================
-- Replicates your lualine layout:
--   left:   mode | branch | diff
--   center: filename
--   right:  word_count | encoding | fileformat | filetype | progress | location | time
-- =============================================================================

local M = {}

local function mode()
	local modes = {
		["n"] = "NORMAL",
		["no"] = "O-PENDING",
		["nov"] = "O-PENDING",
		["noV"] = "O-PENDING",
		["no\22"] = "O-PENDING",
		["niI"] = "NORMAL",
		["niR"] = "NORMAL",
		["niV"] = "NORMAL",
		["nt"] = "NORMAL",
		["ntT"] = "NORMAL",
		["v"] = "VISUAL",
		["vs"] = "VISUAL",
		["V"] = "V-LINE",
		["Vs"] = "V-LINE",
		["\22"] = "V-BLOCK",
		["\22s"] = "V-BLOCK",
		["s"] = "SELECT",
		["S"] = "S-LINE",
		["\19"] = "S-BLOCK",
		["i"] = "INSERT",
		["ic"] = "INSERT",
		["ix"] = "INSERT",
		["R"] = "REPLACE",
		["Rc"] = "REPLACE",
		["Rx"] = "REPLACE",
		["Rv"] = "V-REPLACE",
		["Rvc"] = "V-REPLACE",
		["Rvx"] = "V-REPLACE",
		["c"] = "COMMAND",
		["cv"] = "EX",
		["ce"] = "EX",
		["r"] = "REPLACE",
		["rm"] = "MORE",
		["r?"] = "CONFIRM",
		["!"] = "SHELL",
		["t"] = "TERMINAL",
	}
	local m = vim.api.nvim_get_mode().mode
	return " " .. (modes[m] or m) .. " "
end

local function git_branch()
	local branch = vim.b.gitsigns_head
	if branch and branch ~= "" then
		return "  " .. branch
	end
	return ""
end

local function git_diff()
	local status = vim.b.gitsigns_status_dict
	if not status then
		return ""
	end
	local parts = {}
	if status.added and status.added > 0 then
		table.insert(parts, "+" .. status.added)
	end
	if status.changed and status.changed > 0 then
		table.insert(parts, "~" .. status.changed)
	end
	if status.removed and status.removed > 0 then
		table.insert(parts, "-" .. status.removed)
	end
	if #parts == 0 then
		return ""
	end
	return " " .. table.concat(parts, " ")
end

local function diagnostics()
	if not package.loaded["vim.diagnostic"] then
		return ""
	end
	local counts = vim.diagnostic.count(0)
	local sev = vim.diagnostic.severity
	local parts = {}
	if (counts[sev.ERROR] or 0) > 0 then
		table.insert(parts, "E:" .. counts[sev.ERROR])
	end
	if (counts[sev.WARN] or 0) > 0 then
		table.insert(parts, "W:" .. counts[sev.WARN])
	end
	if (counts[sev.INFO] or 0) > 0 then
		table.insert(parts, "I:" .. counts[sev.INFO])
	end
	if (counts[sev.HINT] or 0) > 0 then
		table.insert(parts, "H:" .. counts[sev.HINT])
	end
	if #parts == 0 then
		return ""
	end
	return " " .. table.concat(parts, " ")
end

local function filename()
	local name = vim.fn.expand("%:t")
	if name == "" then
		name = "[No Name]"
	end
	local modified = vim.bo.modified and " [+]" or ""
	local readonly = vim.bo.readonly and " [RO]" or ""
	return " " .. name .. modified .. readonly
end

local function word_count()
	local ft = vim.bo.filetype
	if ft ~= "markdown" and ft ~= "txt" then
		return ""
	end
	local wc = vim.fn.wordcount()
	if wc.visual_words then
		return " " .. wc.visual_words .. " sel"
	end
	return " " .. wc.words .. "w"
end

local function filetype()
	local ft = vim.bo.filetype
	if ft == "" then
		return ""
	end
	return " " .. ft
end

local function encoding()
	local enc = vim.bo.fileencoding
	if enc == "" then
		enc = vim.o.encoding
	end
	return " " .. enc
end

local function fileformat()
	return " " .. vim.bo.fileformat
end

local function location()
	return " %l:%c"
end

local function progress()
	return " %p%%"
end

local function clock()
	return " " .. os.date("%H:%M") .. " "
end

function M.build()
	return table.concat({
		-- Left: mode, git branch, diff, diagnostics
		mode(),
		git_branch(),
		git_diff(),
		diagnostics(),
		-- Center: filename (pushed by %=)
		"%=",
		filename(),
		"%=",
		-- Right: word count, encoding, fileformat, filetype, progress, location, clock
		word_count(),
		encoding(),
		fileformat(),
		filetype(),
		progress(),
		location(),
		clock(),
	})
end

return M
