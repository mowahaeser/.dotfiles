local status_ok, _ = pcall(require, "telescope")
if not status_ok then
    return
end

local action_state = require("telescope.actions.state")

require("telescope").setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    prompt_prefix = "$ ",
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-a>"] = function() print(vim.inspect(action_state.get_selected_entry())) end
      }
    }
  },
}

local mappings = {}

--[[mappings.curr_buf = function()
    local opt = require('telescope.themes').get_dropdown({height=10, previewer=false})
    require('telescope.builtin').current_buffer_fuzzy_find(opt)
end ]]--

return mappings

