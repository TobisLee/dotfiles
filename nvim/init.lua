vim.cmd.colorscheme("nord")

vim.o.clipboard = "unnamedplus"

local function paste()
  return {
    vim.fn.split(vim.fn.getreg(""), "\n"),
    vim.fn.getregtype(""),
  }
end

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  -- use for Windows Terminal which not support osc52 paste
  paste = {
    ["+"] = paste,
    ["*"] = paste,
  },
-- use for other terminal which support osc52 paste
--  paste = {
--    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
--    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
--  },
}

