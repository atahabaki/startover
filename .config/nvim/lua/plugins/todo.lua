local success, todo = pcall(require, "todo")
if not success then
	return
end

todo.setup {
    signs = {
        enable = true, -- show icons in the sign column
        priority = 8
    },
    keywords = {
        FIX = {
            icon = " ", -- used for the sign, and search results
            -- can be a hex color, or a named color
            -- named colors definitions follow below
            color = "error",
            -- a set of other keywords that all map to this FIX keywords
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }
            -- signs = false -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } }
    },
}
