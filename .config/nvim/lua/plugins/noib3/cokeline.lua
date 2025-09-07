return {
    "noib3/cokeline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("cokeline").setup({
            -- Show the bufferline when there are at least this many visible buffers.
            show_if_buffers_are_at_least = 1,

            buffers = {
                -- A function to filter out unwanted buffers. It takes the `buffer` table
                -- (described above) as a parameter.
                -- For example, if you want to keep terminals out of your cokeline:
                --   filter = function(buffer) return buffer.type ~= 'terminal' end,
                filter = nil,

                -- If `last` new buffers are added to the end of the bufferline, if `next`
                -- they are added next to the current buffer.
                new_buffers_position = "last",
            },

            -- Default colors for the foregound/background of focused/unfocused
            -- lines. Their default values are derived from the foreground/background of
            -- other highlight groups.

            -- A list of components used to build every line of the cokeline.
            components = {
                {
                    text = function(buffer)
                        return buffer.is_focused and "▼" or " "
                    end,
                },
                {
                    text = function(buffer)
                        return buffer.is_modified and " ●" or ""
                    end,
                },
                {
                    text = function(buffer)
                        return " " .. buffer.devicon.icon
                    end,
                    hl = {
                        fg = function(buffer)
                            return buffer.devicon.color
                        end,
                    },
                },
                {
                    text = function(buffer)
                        return buffer.unique_prefix
                    end,
                    hl = {
                        style = "italic",
                    },
                },
                {
                    text = function(buffer)
                        return buffer.filename .. " "
                    end,
                },
                {
                    text = "󰅖",
                    delete_buffer_on_left_click = true,
                },
                {
                    text = " ",
                },
            },
        })
    end,
}
