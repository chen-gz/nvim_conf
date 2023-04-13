local use = require('packer').use


use {
    'mhartington/formatter.nvim',
    config = function()
        require('formatter').setup{
            logging = true,
            filetype = {
                c = {
                    function()
                        return {
                            exe = "clang-format",
                            stdin = true
                        }
                    end
                },
                python = {
                    require('formatter.filetypes.python').autopep8,
                },
                go = {
                    function()
                        return {
                            exe = "gofmt",
                            args = {"-s"},
                            stdin = true
                        }
                    end
                },

            }
        }
    end

}
