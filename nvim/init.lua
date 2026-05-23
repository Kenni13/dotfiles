require("vim._core.ui2").enable({
  enable = true,
  msg = {
    targets = {
      ["emsg"] = "pager",
      ["echoerr"] = "pager",
      ["lua_error"] = "pager",
    },
  }
})

require("config")
require("keymap")
require("pack")
require("load-lazy")
