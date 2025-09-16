local buf = vim.api.nvim_create_buf(false, true)

-- Window height and width half of terminal size
local win_height = math.floor(vim.o.lines / 2)
local win_width = math.floor(vim.o.columns / 2)

-- Window row/col anchor calulated to place window in center of terminal
local win_row = math.floor((vim.o.lines - win_height) / 2)
local win_col = math.floor((vim.o.columns - win_width) / 2)

local win_opts = {
    relative='win',                 -- Relative to window
    win=0,                          -- Relative to CURRENT window
    anchor='NW',                    -- NW corner placed at (row,col)
    height=win_height,              -- Float height
    width=win_width,                -- Float width
    row=win_row,                    -- Float row (0 based indexing)
    col=win_col,                    -- Float col (0 based indexing)
    focusable=true,                 -- User can enter window
    mouse=true,                     -- Mouse events interact with window normally
    zindex=50,                      -- Default zindex
    border='rounded',               -- Rounded border from winborder
    title='Regex Builder',          -- Window title, defaulted highlight group is FloatTitle
    title_pos='center',             -- Title position
    footer='Regex Builder',         -- Window footer, defaulted highlight group is FloatTitle
    footer_pos='center',            -- Footer position
    noautocmd=false,                -- Allows autocommands while window is open
    fixed=false,                    -- If window is to be truncated, neovim repositions
    hide=false,                     -- Unhidden
}

-- Open floating window
local win = vim.api.nvim_open_win(buf, false, win_opts)

-- Map q to delete buffer (and changes) and close floating window
vim.keymap.set('n', 'q', function ()
    vim.api.nvim_buf_delete(buf, { force=true })
    end,
    { noremap=true, buffer=buf }
)

-- Disable floating window line numbers
vim.wo[win].relativenumber = false
vim.wo[win].nu = false



vim.api.nvim_buf_set_lines(buf, 0, 0, true, {'this is a test'})
