#!/usr/bin/env lua

---@return table
local function read_config_file()
	local f = assert(loadfile('zond_config.lua'), 'zond_config.lua not found')

	local my_data = f()
	return my_data
end

--- Getting full path to create symlink correctly
---@param path string
---@return string
local function resolve_destination_path(path)
	-- startswith snippet
	if string.sub(path, 1, 1) == '~' then
		return os.getenv('HOME') .. path:sub(2)
	end
	return path
end

--- Creates symlinks based on zond_config.lua
local function create_files_symlink()
	local data = read_config_file()
	local dotfiles_path = data.config.dotpath
	-- mount command string
	for _, value in pairs(data.mappings) do
		local full_source_path = os.getenv('PWD') .. '/' .. dotfiles_path .. '/' .. value.source
		local full_destination_path = resolve_destination_path(value.destination)
		local symlink_command = 'ln -sf ' .. full_source_path .. ' ' .. full_destination_path

		-- os.execute(symlink_command)
		local handle = io.popen(symlink_command)
		local result = handle:read('a')
		if result ~= '' then
			print('Maybe something went wrong')
			print('Report or get help at https://github.com/ivansantiagojr/zond/issues')
		end
	end
	print('Process finished, now you can check if everything is right.')
	print('If you noticed anything wrong, you can report at https://github.com/ivansantiagojr/zond/issues')
end

create_files_symlink()
