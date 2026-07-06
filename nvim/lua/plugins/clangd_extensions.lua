-- clangd extensions: richer clangd features on top of your existing LSP setup.
-- Adds :ClangdAST, :ClangdTypeHierarchy, :ClangdSymbolInfo, :ClangdMemoryUsage
-- — useful for understanding memory layout and structure in systems code.
return {
	"p00f/clangd_extensions.nvim",
	ft = { "c", "cpp", "objc", "objcpp", "cuda" },
	opts = {},
}
