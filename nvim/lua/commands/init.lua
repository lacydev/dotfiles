------------------------------------------------------------------
-- Commands [commands]
------------------------------------------------------------------

-- using '\\' because windows

local source = string.sub(debug.getinfo(1,'S').source, 2, -9)
local paths = vim.split(vim.fn.glob(source .. '*.lua'), '\n')

if #paths <= 1 then
	print("No script files found in ./commands/ directory")
else
	-- Get the filenames and require them
	for _, path in ipairs(paths) do
		path_split = vim.fn.split(path, '\\')	--path is a string path_split is a table
		file = string.gsub(path_split[#path_split], '%.lua?$', '')	-- trim off .lua\n
		if file ~= 'init' then
			require('commands.' .. file)
		end
	end
end
