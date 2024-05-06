local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local path = require("plenary.path")

local M = { }

M.tagfile = path:new({ vim.env.WIKIROOT, ".db/tags" })

M.read_tag_file = function()
  local data = M.tagfile:readlines()
  local result = { }
  for _, value in ipairs(data) do
    local s = vim.fn.split(value, ":", true)
    if s[1] and s[1] ~= "" then
      table.insert(result, {
        file = s[1],
        tags = s[2] or ""
      })
    end
  end
  return result
end

local tag_entry_maker = function(entry)
  local make_display = function(e)
    local s = e.ordinal
    local style = { { { #e.value.file + 1, #e.ordinal }, "TypeDef" } }
    return s, style
  end
  return {
    value = entry,
    display = make_display,
    ordinal = entry.file .. ' ' .. entry.tags,
    filename = vim.env.WIKIROOT .. '/' .. entry.file,
  }
end

M.find_wiki = function(opts)
  opts = opts or {}
  local data = M.read_tag_file()
  pickers.new(opts, {
    finder = finders.new_table({
       results = data,
       entry_maker = tag_entry_maker
    }),
    sorter = sorters.get_generic_fuzzy_sorter(),
    previewer = require("telescope.config").values.file_previewer(opts)
  }):find()
end

return M
