local public = {}
local private = {}

---@class KansoPaletteColors
private.palette = {
	-- Bg Shades
	zen0 = "#090E13",
	zen1 = "#1C1E25",
	zen2 = "#22262D",
	zen3 = "#393B44",

	-- Popup and Floats
	zenBlue1 = "#223249",
	zenBlue2 = "#2D4F67",

	-- Diff and Git
	winterGreen = "#2B3328",
	winterYellow = "#49443C",
	winterRed = "#43242B",
	winterBlue = "#252535",
	autumnGreen = "#76946A",
	autumnRed = "#C34043",
	autumnYellow = "#DCA561",

	-- Diag
	samuraiRed = "#C34043",
	roninYellow = "#DCA561",
	zenAqua1 = "#6A9589",
	inkBlue = "#658594",

	-- Fg and Comments
	oldWhite = "#C5C9C7",
	fujiWhite = "#f2f1ef",

	springViolet1 = "#938AA9",
	springBlue = "#7FB4CA",
	zenAqua2 = "#7AA89F",

	springGreen = "#98BB6C",
	carpYellow = "#E6C384",

	zenRed = "#E46876",
	katanaGray = "#717C7C",

	inkBlack0 = "#14171d",
	inkBlack1 = "#1f1f26",
	inkBlack2 = "#22262D",
	inkBlack3 = "#393B44",
	inkBlack4 = "#4b4e57",

	inkWhite = "#C5C9C7",
	inkGreen = "#87a987",
	inkGreen2 = "#8a9a7b",
	inkPink = "#a292a3",
	inkOrange = "#b6927b",
	inkOrange2 = "#b98d7b",
	inkGray = "#A4A7A4",
	inkGray1 = "#909398",
	inkGray2 = "#75797f",
	inkGray3 = "#5C6066",
	inkBlue2 = "#8ba4b0",
	inkViolet = "#8992a7",
	inkRed = "#c4746e",
	inkAqua = "#8ea4a2",
	inkAsh = "#5C6066",
	inkTeal = "#949fb5",
	inkYellow = "#c4b28a", --"#a99c8b",
	-- "#8a9aa3",

	-- Mist Shades
	mist0 = "#22262D",
	mist1 = "#2a2c35",
	mist2 = "#393B44",
	mist3 = "#5C6066",

	mistWhite = "#C5C9C7",
	mistGreen = "#87a987",
	mistGreen2 = "#8a9a7b",
	mistPink = "#a292a3",
	mistOrange = "#b6927b",
	mistOrange2 = "#b98d7b",
	mistGray = "#A4A7A4",
	mistGray1 = "#909398",
	mistGray2 = "#75797f",
	mistGray3 = "#5C6066",
	mistBlue2 = "#8ba4b0",
	mistViolet = "#8992a7",
	mistRed = "#c4746e",
	mistAqua = "#8ea4a2",
	mistAsh = "#5C6066",
	mistTeal = "#949fb5",
	mistYellow = "#c4b28a",

	pearlInk0 = "#22262D",
	pearlInk1 = "#545464",
	pearlInk2 = "#43436c",
	pearlGray = "#e2e1df",
	pearlGray2 = "#5C6068",
	pearlGray3 = "#6D6D69",
	pearlGray4 = "#9F9F99",

	pearlWhite0 = "#f2f1ef",
	pearlWhite1 = "#e2e1df",
	pearlWhite2 = "#dddddb",
	pearlWhite3 = "#cacac7",
	pearlViolet1 = "#a09cac",
	pearlViolet2 = "#766b90",
	pearlViolet3 = "#c9cbd1",
	pearlViolet4 = "#624c83",
	pearlBlue1 = "#c7d7e0",
	pearlBlue2 = "#b5cbd2",
	pearlBlue3 = "#9fb5c9",
	pearlBlue4 = "#4d699b",
	pearlBlue5 = "#5d57a3",
	pearlGreen = "#6f894e",
	pearlGreen2 = "#6e915f",
	pearlGreen3 = "#b7d0ae",
	pearlPink = "#b35b79",
	pearlOrange = "#cc6d00",
	pearlOrange2 = "#e98a00",
	pearlYellow = "#77713f",
	pearlYellow2 = "#836f4a",
	pearlYellow3 = "#de9800",
	pearlYellow4 = "#f9d791",
	pearlRed = "#c84053",
	pearlRed2 = "#d7474b",
	pearlRed3 = "#e82424",
	pearlRed4 = "#d9a594",
	pearlAqua = "#597b75",
	pearlAqua2 = "#5e857a",
	pearlTeal1 = "#4e8ca2",
	pearlTeal2 = "#6693bf",
	pearlTeal3 = "#5a7785",
	pearlCyan = "#d7e3d8",
}

---@return KansoPaletteColors
function public.palette()
	return private.palette
end

--- @param palette PaletteColors
--- @return AllColors
function public.zen(palette)
	local p = palette.kanso

	--- @type AllColors
	return {
		fg = p.inkWhite,
		fg_dim = p.inkGray,
		fg_accent = p.inkRed,
		fg_faded = p.katanaGray,
		nontext = p.inkAsh,

		bg = p.zen0,
		bg_dim = p.zen0,
		bg_chrome = p.zen1,
		bg_accent = p.zen2,
		bg_highlight = p.roninYellow,
		bg_select = p.inkBlack2,

		dark_red = p.winterRed,
		faded_red = p.autumnRed,
		red = p.inkRed,
		br_red = p.samuraiRed,

		orange = p.inkOrange,

		faded_yellow = p.autumnYellow,
		yellow = p.inkYellow,
		br_yellow = p.carpYellow,

		dark_green = p.winterGreen,
		faded_green = p.autumnGreen,
		br_green = p.inkGreen2,

		cyan = p.inkBlue,
		br_cyan = p.zenAqua1,

		dark_blue = p.winterBlue,
		blue = p.inkBlue2,
		br_blue = p.springBlue,

		magenta = p.inkViolet,
		br_magenta = p.inkPink,
	}
end

--- @param palette PaletteColors
--- @return AllColors
function public.ink(palette)
	local p = palette.kanso

	--- @type AllColors
	return {
		fg = p.inkWhite,
		fg_dim = p.inkGray,
		fg_accent = p.inkRed,
		fg_faded = p.katanaGray,
		nontext = p.inkAsh,

		bg = p.inkBlack0,
		bg_dim = p.inkBlack0,
		bg_chrome = p.inkBlack1,
		bg_accent = p.inkBlack3,
		bg_highlight = p.roninYellow,
		bg_select = p.inkBlack3,

		dark_red = p.winterRed,
		faded_red = p.autumnRed,
		red = p.inkRed,
		br_red = p.samuraiRed,

		orange = p.roninYellow,

		faded_yellow = p.autumnYellow,
		yellow = p.inkYellow,
		br_yellow = p.carpYellow,

		dark_green = p.winterGreen,
		faded_green = p.autumnGreen,
		br_green = p.springGreen,

		cyan = p.inkBlue,
		br_cyan = p.zenAqua1,

		dark_blue = p.winterBlue,
		blue = p.inkBlue2,
		br_blue = p.springBlue,

		magenta = p.inkViolet,
		br_magenta = p.inkPink,
	}
end

--- @param palette PaletteColors
--- @return AllColors
function public.pearl(palette)
	local p = palette.kanso

	--- @type AllColors
	return {
		fg = p.pearlInk0,
		fg_dim = p.pearlInk1,
		fg_accent = p.pearlRed,
		fg_faded = p.pearlOrange,
		nontext = p.pearlViolet1,

		bg = p.pearlWhite0,
		bg_dim = p.pearlWhite0,
		bg_chrome = p.pearlWhite1,
		bg_accent = p.pearlWhite2,
		bg_highlight = p.pearlOrange2,
		bg_select = p.pearlWhite2,

		dark_red = p.pearlRed4,
		faded_red = p.pearlRed2,
		red = p.pearlRed,
		br_red = p.pearlRed3,

		orange = p.pearlOrange,

		faded_yellow = p.pearlYellow3,
		yellow = p.pearlYellow,
		br_yellow = p.pearlYellow,

		dark_green = p.pearlGreen3,
		faded_green = p.pearlYellow4,
		br_green = p.pearlGreen,

		cyan = p.pearlTeal3,
		br_cyan = p.pearlAqua2,

		dark_blue = p.pearlCyan,
		blue = p.pearlBlue4,
		br_blue = p.pearlTeal2,

		magenta = p.pearlViolet4,
		br_magenta = p.pearlPink,
	}
end

--- @param palette PaletteColors
--- @return AllColors
function public.mist(palette)
	local p = palette.kanso

	--- @type AllColors
	return {
		fg = p.mistWhite,
		fg_dim = p.mistGray,
		fg_accent = p.mistRed,
		fg_faded = p.mistOrange,
		nontext = p.mistGray2,

		bg = p.mist0,
		bg_dim = p.mist0,
		bg_chrome = p.mist2,
		bg_accent = p.mist2,
		bg_highlight = p.roninYellow,
		bg_select = p.mist2,

		dark_red = p.winterRed,
		faded_red = p.autumnRed,
		red = p.mistRed,
		br_red = p.samuraiRed,

		orange = p.mistOrange,

		faded_yellow = p.autumnYellow,
		yellow = p.mistYellow,
		br_yellow = p.mistYellow,

		dark_green = p.winterGreen,
		faded_green = p.autumnGreen,
		br_green = p.mistGreen2,

		cyan = p.inkBlue,
		br_cyan = p.zenAqua1,

		dark_blue = p.winterBlue,
		blue = p.mistBlue2,
		br_blue = p.springBlue,

		magenta = p.mistViolet,
		br_magenta = p.mistPink,
	}
end

return public
