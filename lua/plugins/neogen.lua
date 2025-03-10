return {
	"danymat/neogen",
	event = "BufRead",
	config = true,
	snippet_engine = "luasnip",
	languages = {
		c = { template = { annotation_convention = "doxygen" } },
		cpp = { template = { annotation_convention = "doxygen" } },
	},
}
