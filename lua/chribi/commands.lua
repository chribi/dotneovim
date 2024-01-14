local function cd_current_file()
    local current = vim.fn.expand('%:p:h')
    vim.cmd.tcd(current)
end

local function cd_current_gitroot()
    local current = vim.fn.expand('%:p:h')
    local gitfolder = vim.fn.finddir('.git', current .. ';')
    if (gitfolder == '') then
        print("Not a git repository")
    end
    local gitroot = vim.fn.fnamemodify(gitfolder, ':h')
    vim.cmd.tcd(gitroot)
end

vim.api.nvim_create_user_command("Cdc", cd_current_file, { desc = "cd to directory of current file" });
vim.api.nvim_create_user_command("Cdg", cd_current_gitroot, { desc = "cd to git root of current file" });
