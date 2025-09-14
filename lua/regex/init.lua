local buf = vim.api.nvim_create_buf(false, true)
print('new buffer is', buf)

-- 11 height
-- 3 float height
-- math.floor((11 - 3) / 2) = 4 (0 indexed)


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
    height=win_height,                      -- Float height
    width=win_width,                       -- Float width
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
    --verticle=
    --split=
}
local win = vim.api.nvim_open_win(buf, false, win_opts)
print('new window is', win)

--[[

 - style: (optional) Configure the appearance of the window. Currently
     only supports one value:
     - "minimal"  Nvim will display the window with many UI options
                  disabled. This is useful when displaying a temporary
                  float where the text should not be edited. Disables
                  'number', 'relativenumber', 'cursorline', 'cursorcolumn',
                  'foldcolumn', 'spell' and 'list' options. 'signcolumn'
                  is changed to `auto` and 'colorcolumn' is cleared.
                  'statuscolumn' is changed to empty. The end-of-buffer
                   region is hidden by setting `eob` flag of
                  'fillchars' to a space char, and clearing the
                  `hl-EndOfBuffer` region in 'winhighlight'.
 - footer: Footer (optional) in window border, string or list.
   List should consist of `[text, highlight]` tuples.
   If string, or a tuple lacks a highlight, the default highlight group is `FloatFooter`.
 - footer_pos: Footer position. Must be set with `footer` option.
   Value can be one of "left", "center", or "right".
   Default is `"left"`.
 - noautocmd: If true then all autocommands are blocked for the duration of
   the call.
 - fixed: If true when anchor is NW or SW, the float window
          would be kept fixed even if the window would be truncated.
 - hide: If true the floating window will be hidden.
 - vertical: Split vertically `:vertical`.
 - split: Split direction: "left", "right", "above", "below".

]]--



















































































