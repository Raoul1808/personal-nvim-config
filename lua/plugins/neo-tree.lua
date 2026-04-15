return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    opts = {
        default_component_configs = {
            indent = {
                with_expanders = true,
            },
        },
        filesystem = {
            filtered_items = {
                visible = true,
            },
        },
    },
}
