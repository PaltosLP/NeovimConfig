
require("toggleterm").setup{

	size = 10,
	open_mapping = [[<c-e>]],
	hide_numbers = true,
	terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
	start_in_insert=true,
	insert_mappings=true,
	direction = "horizontal",
	-- direction="float",
	-- float_opts={
	-- 	border="curved",
	-- 	width = 100,
	--     height = 10,
	-- 	winblend=0,
	-- 	highlights={
	-- 		border="Normal",
	-- 		background="Normal",
	-- 	},
	-- },

}
