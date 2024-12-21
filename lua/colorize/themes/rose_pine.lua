local public = {}

local private = {}

---@class RosePinePaletteColors
private.palette = {
	black = "#000000",

	main = {
		base = "#191724",
		surface = "#1f1d2e",
		overlay = "#26233a",
		muted = "#6e6a86",
		subtle = "#908caa",
		text = "#e0def4",
		love = "#eb6f92",
		gold = "#f6c177",
		rose = "#ebbcba",
		pine = "#31748f",
		foam = "#9ccfd8",
		iris = "#c4a7e7",
		highlight_low = "#21202e",
		highlight_med = "#403d52",
		highlight_high = "#524f67",
	},

	moon = {
		base = "#232136",
		surface = "#2a273f",
		overlay = "#393552",
		muted = "#6e6a86",
		subtle = "#908caa",
		text = "#e0def4",
		love = "#eb6f92",
		gold = "#f6c177",
		rose = "#ea9a97",
		pine = "#3e8fb0",
		foam = "#9ccfd8",
		iris = "#c4a7e7",
		highlight_low = "#2a283e",
		highlight_med = "#44415a",
		highlight_high = "#56526e",
	},

	dawn = {
		base = "#faf4ed",
		surface = "#fffaf3",
		overlay = "#f2e9e1",
		muted = "#9893a5",
		subtle = "#797593",
		text = "#575279",
		love = "#b4637a",
		gold = "#ea9d34",
		rose = "#d7827e",
		pine = "#286983",
		foam = "#56949f",
		iris = "#907aa9",
		highlight_low = "#f4ede8",
		highlight_med = "#dfdad9",
		highlight_high = "#cecacd",
	},

}

---@return RosePinePaletteColors
function public.palette()
	return private.palette
end

---@param variant "black"|"main"|"moon"|"dawn"
---@return fun(palette: PaletteColors): Theme
function public.colorize(variant)
	return function(palette_colors)
		local rose_pine_palette = palette_colors.rose_pine

		local palette = vim.tbl_extend("keep", {}, rose_pine_palette.main)

		if variant == "black" then
			palette.base = rose_pine_palette.black
		elseif variant == "moon" then
			palette = rose_pine_palette.moon
		elseif variant == "dawn" then
			palette = rose_pine_palette.dawn
		end

		local colors = {
			ui = {
				fg = palette.text,
				fg_dim = palette.muted,
				fg_reverse = palette.overlay,

				bg_dim = palette.surface,
				bg_gutter = palette.surface,

				bg_m3 = palette.surface,
				bg_m2 = palette.muted,
				bg_m1 = palette.muted,
				bg = palette.base,
				bg_p1 = palette.highlight_low,
				bg_p2 = palette.highlight_high,

				special = palette.love,
				nontext = palette.subtle,
				whitespace = palette.muted,

				bg_search = palette.highlight_med,
				bg_visual = palette.highlight_med,

				pmenu = {
					fg = palette.text,
					fg_sel = "none", -- This is important to make highlights pass-through
					bg = palette.base,
					bg_sel = palette.highlight_med,
					bg_sbar = palette.highlight_high,
					bg_thumb = palette.highlight_high,
				},
				float = {
					fg = palette.text,
					bg = palette.base,
					fg_border = palette.muted,
					bg_border = palette.base,
				},
			},
			syn = {
				string = palette.gold,
				variable = palette.text,
				number = palette.gold,
				constant = palette.gold,
				identifier = palette.text,
				parameter = palette.text,
				fun = palette.pine,
				statement = palette.love,
				keyword = palette.iris,
				operator = palette.gold,
				preproc = palette.love,
				type = palette.gold,
				regex = palette.gold,
				deprecated = palette.muted,
				comment = palette.rose,
				docComment = palette.foam,
				punct = palette.text,
				special1 = palette.pine,
				special2 = palette.love,
				special3 = palette.love,
			},
			vcs = {
				added = palette.foam,
				removed = palette.love,
				changed = palette.rose,
			},
			diff = {
				add = palette.foam,
				delete = palette.love,
				change = palette.rose,
				text = palette.rose,
				blend = 40,
			},
			diag = {
				ok = palette.foam,
				error = palette.love,
				warning = palette.gold,
				info = palette.foam,
				hint = palette.iris,
			},
			term = {
				palette.base, -- black
				palette.love, -- red
				palette.pine, -- green
				palette.gold, -- yellow
				palette.foam, -- blue
				palette.iris, -- magenta
				palette.rose, -- cyan
				palette.text, -- white
				palette.surface, -- bright black
				palette.love, -- bright red
				palette.pine, -- bright green
				palette.gold, -- bright yellow
				palette.foam, -- bright blue
				palette.iris, -- bright magenta
				palette.rose, -- bright cyan
				palette.subtle, -- bright white
				palette.foam, -- extended color 1
				palette.pine, -- extended color 2
			},
		}

		return { colors = colors, base_color = palette.base }
	end
end

return public
