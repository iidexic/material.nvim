package.loaded["material"] = nil
package.loaded["material.util"] = nil
package.loaded["material.colors"] = nil
package.loaded["material.colors.conditionals"] = nil
package.loaded["material.colors.main_groups"] = nil
package.loaded["material.colors.apply_groups"] = nil
package.loaded["material.functions"] = nil
package.loaded["material.highlights"] = nil
package.loaded["material.highlights.plugins"] = nil

vim.g.material_style = "omni2"

require("material.util").load()
