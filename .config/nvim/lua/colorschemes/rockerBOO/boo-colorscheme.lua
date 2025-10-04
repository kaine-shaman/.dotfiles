return {
    "rockerBOO/boo-colorscheme-nvim",
    config = function()
        require('boo-colorscheme').use({
            italic = false,
            -- theme = "boo",
            -- theme = "crimson_moonlight",
            -- theme = "forest_stream",
            -- theme = "radioactive_waste",
            theme = "sunset_cloud",
        })
    end,
}
