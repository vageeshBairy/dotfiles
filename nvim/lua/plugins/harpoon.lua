return {
    'ThePrimeagen/harpoon',
    -- harpoon
    opts = {
        global_settings = {
            -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
            save_on_toggle = false,

            -- saves the harpoon file upon every change. disabling is unrecommended.
            save_on_change = true,

            -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
            enter_on_sendcmd = false,

            -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
            tmux_autoclose_windows = false,

            -- filetypes that you want to prevent from adding to the harpoon list menu.
            excluded_filetypes = { "harpoon" },

            -- set marks specific to each git branch inside git repository
            mark_branch = false,

            -- enable tabline with harpoon marks
            tabline = false,
            tabline_prefix = "   ",
            tabline_suffix = "   ",
        }
    },
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")


        vim.keymap.set("n", "<leader>a", mark.add_file)

        vim.keymap.set("n", "<a-1>", function() ui.nav_file(1) end, { desc = "navigate to 1st marked file" })
        vim.keymap.set("n", "<a-2>", function() ui.nav_file(2) end, { desc = "navigate to 2nd marked file" })
        vim.keymap.set("n", "<a-3>", function() ui.nav_file(3) end, { desc = "navigate to 3rd marked file" })
        vim.keymap.set("n", "<a-4>", function() ui.nav_file(4) end, { desc = "navigate to 4th marked file" })

        vim.keymap.set('n', '<leader>hm', mark.add_file, { desc = "mark the file for navigation" })
        vim.keymap.set("n", "<leader>he", ui.toggle_quick_menu, { desc = "toggle the harpoon quick menu" })
        vim.keymap.set('n', '<leader>hn', ui.nav_next, { desc = "navigate to next file" })
        vim.keymap.set('n', '<leader>hp', ui.nav_prev, { desc = "navigate to previous file" })
    end
}
