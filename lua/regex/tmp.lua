-- Results window ================================================================================================

local results_buf = vim.api.nvim_create_buf(false, true)

-- Window height and width half of terminal size
local results_win_height = math.floor(vim.o.lines / 2)
local results_win_width = math.floor(vim.o.columns / 2)

-- Window row/col anchor calulated to place window in center of terminal
local results_win_row = math.floor((vim.o.lines - results_win_height) / 2)
local results_win_col = math.floor((vim.o.columns - results_win_width) / 2)

local results_win_opts = {
    relative='win',                 -- Relative to window
    win=0,                          -- Relative to CURRENT window
    anchor='NW',                    -- NW corner placed at (row,col)
    height=results_win_height,              -- Float height
    width=results_win_width,                -- Float width
    row=results_win_row,                    -- Float row (0 based indexing)
    col=results_win_col,                    -- Float col (0 based indexing)
    focusable=true,                 -- User can enter window
    mouse=true,                     -- Mouse events interact with window normally
    zindex=50,                      -- Default zindex
    border='rounded',               -- Rounded border from winborder
    title='Regex Builder',          -- Window title, defaulted highlight group is FloatTitle
    title_pos='center',             -- Title position
    noautocmd=false,                -- Allows autocommands while window is open
    fixed=false,                    -- If window is to be truncated, neovim repositions
    hide=false,                     -- Unhidden
}

-- Open floating window
local results_win = vim.api.nvim_open_win(results_buf, false, results_win_opts)

-- Disable floating window line numbers
vim.wo[results_win].relativenumber = false
vim.wo[results_win].nu = false


vim.api.nvim_buf_set_lines(results_buf, 0, 0, true, {'this is a test'})
-- vim.api.nvim_win_set_cursor(win, {1, 1})

local ns = vim.api.nvim_create_namespace('RegexBuilder.Results')
local telescope_normal_hl = vim.api.nvim_get_hl(0, { name = "TelescopeNormal" })
vim.api.nvim_set_hl(ns, 'NormalFloat', { bg = telescope_normal_hl.bg, fg = telescope_normal_hl.fg })
vim.api.nvim_set_hl(ns, 'FloatBorder', { bg = telescope_normal_hl.bg, fg = telescope_normal_hl.fg })
vim.api.nvim_win_set_hl_ns(results_win, ns)

--vim.api.nvim_win_close(win, true)


-- Search window ================================================================================================

local search_buf = vim.api.nvim_create_buf(false, true)

local search_win_height = 1
local search_win_width = results_win_width

local search_win_row = results_win_row + results_win_height + 2
local search_win_col = results_win_col

local search_win_opts = {
    relative='win',                 -- Relative to window
    win=0,                          -- Relative to CURRENT window
    anchor='NW',                    -- NW corner placed at (row,col)
    height=search_win_height,       -- Float height
    width=results_win_width,        -- Float width
    row=search_win_row,             -- Float row (0 based indexing)
    col=search_win_col,             -- Float col (0 based indexing)
    focusable=true,                 -- User can enter window
    mouse=true,                     -- Mouse events interact with window normally
    zindex=50,                      -- Default zindex
    border='rounded',               -- Rounded border from winborder
    title='Search',                 -- Window title, defaulted highlight group is FloatTitle
    title_pos='center',             -- Title position
    noautocmd=false,                -- Allows autocommands while window is open
    fixed=false,                    -- If window is to be truncated, neovim repositions
    hide=false,                     -- Unhidden
}

local search_win = vim.api.nvim_open_win(search_buf, true, search_win_opts)
local ns_builder = vim.api.nvim_create_namespace('RegexBuilder.Search')
local telescope_prompt_hl = vim.api.nvim_get_hl(0, { name = "TelescopePromptBorder" })
vim.api.nvim_set_hl(ns_builder, 'NormalFloat', { bg = telescope_prompt_hl.bg, fg = telescope_prompt_hl.fg, })
vim.api.nvim_set_hl(ns_builder, 'FloatBorder', { bg = telescope_prompt_hl.bg, fg = telescope_prompt_hl.fg, })
vim.api.nvim_win_set_hl_ns(search_win, ns_builder)

-- local buffers = { results_buf, search_buf }

--[[
local function close_bufs(bufs)
    for _, buf in ipairs(bufs) do
        vim.api.nvim_buf_delete(buf, { force = true })
    end
end
--]]

--vim.api.nvim_create_augroup("RegexBuilder", {})

--[[
for _, buf in ipairs(buffers) do

    -- Deleting one buffer deletes all
    vim.api.nvim_create_autocmd("BufDelete", {
        buffer = buf,
        group = "RegexBuilder",
        nested = true,
        once = true,
        callback = function()
            for _, buf_del in ipairs(buffers) do
                vim.api.nvim_buf_delete(buf, { force = true })
            end
        end,
    })

    -- q press to delete buffer
    vim.keymap.set('n', 'q', function()
        vim.api.nvim_buf_delete(buf, { force = true})
    end, { noremap = true, buffer = buf })
end
--]]


