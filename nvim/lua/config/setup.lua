-- Line Numbers
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.numberwidth = 3

function ToggleLineNumbers ()
  if vim.wo.number then
    vim.wo.number = false
    vim.wo.relativenumber = false
  else 
    vim.wo.number = true
    vim.wo.relativenumber = true
  end
end
vim.keymap.set('n', '<leader>num', ToggleLineNumbers)


-- Indent & Spacing
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- Searching
vim.opt.hlsearch = false    -- highlight search results
vim.opt.incsearch = true    -- incremental search

-- Colors
vim.opt.termguicolors = true

-- Enable the sign column to prevent jumping
vim.opt.signcolumn = "yes"

-- Enable system clipboard
--vim.opt.clipboard = "unamed,unnamedplus"

-- Scrolling & Cursor
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = false
vim.opt.cursorcolumn = false
vim.opt.updatetime = 50   -- system/cursor update timeout

-- Fold settings for nvim-ufo `./plugins/ufo.lua`
vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Spell Check
vim.opt.spell = true
vim.opt.spelllang = 'en_us'
vim.cmd([[highlight SpellBad cterm=underline gui=underline]])
vim.cmd([[highlight SpellLocal cterm=none gui=none]])

-- Toggle spell check
local spellcheck = true
local function ToggleSpellCheck ()
	if spellcheck then
		vim.opt.spell = false
		vim.cmd('echo "Spell check disabled"')
	else
		vim.opt.spell = true
		vim.cmd('echo "Spell check enabled"')
	end
    spellcheck = not spellcheck
end
vim.keymap.set('n', '<leader>sc', ToggleSpellCheck)

-- Enable Keystrokes on VimEnter
vim.cmd([[autocmd VimEnter * Keystrokes]])
