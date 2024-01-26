vim.loader.enable()

local dotpath = vim.fn.expand("$HOME") .. "/.dotvim"
vim.api.nvim_command("set runtimepath+=" .. dotpath)

package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
package.cpath = package.cpath .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/lib/lua/5.1/?.so;"

require("ht.init")
