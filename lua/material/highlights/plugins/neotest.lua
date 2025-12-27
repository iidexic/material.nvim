local colors = require "material.colors"

local m = colors.main
local e = colors.editor

local M = {}

M.load = function()
    local plugin_hls = {
        NeotestAdapterName = { fg = m.darkred },
        NeotestDir = { fg = m.blue },
        NeotestExpandMarker = { fg = e.contrast },
        NeotestFailed = { link = "DiagnosticError" },
        NeotestFile = { fg = m.blue },
        NeotestFocused = { bold = true, underline = true },
        NeotestIndent = { fg = e.contrast },
        NeotestMarked = { fg = m.darkyellow, bold = true },
        NeotestNamespace = { fg = m.purple },
        NeotestPassed = { fg = m.green },
        NeotestRunning = { fg = m.yellow },
        NeotestSkipped = { link = "DiagnosticHint" },
        NeotestTarget = { fg = m.red },
        NeotestTest = { fg = e.fg },
        NeotestUnknown = { fg = e.fg },
        NeotestWinSelect = { fg = m.blue, bold = true },
    }

    return plugin_hls
end

M.async = true

return M
