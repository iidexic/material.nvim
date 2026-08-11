package.loaded["d"] = nil
package.loaded["d.util"] = nil
package.loaded["d.colors"] = nil
package.loaded["d.colors.conditionals"] = nil
package.loaded["d.colors.main_groups"] = nil
package.loaded["d.colors.apply_groups"] = nil
package.loaded["d.functions"] = nil
package.loaded["d.highlights"] = nil
package.loaded["d.highlights.plugins"] = nil
package.loaded["d.colors.styles"] = nil
-- for k, _ in pairs(package.loaded["d.colors.styles"]) do
-- 	package.loaded["d.colors.styles." .. k] = nil
-- end

vim.g.d_style = "fpwst"

require("d.util").load()
