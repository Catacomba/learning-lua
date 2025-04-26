-- Function have multiple return values

local function_with_multiple_returns = function()
	return 1, 2, 3, 4
end

local first, second, last = function_with_multiple_returns()

print("First: ", first)
print("Second: ", second)
print("Third: ", last)
-- Any additional values are discarded

local variable_arguments = function(...)
	local arguments = { ... }
	for index, value in ipairs({ ... }) do
		print(index, value)
	end
	return table.unpack(arguments)
end

print("==========================")
-- this will print all the inputs
print("1: ", variable_arguments("hey", " world", "!"))
print("==========================")
-- this will print only the "hey", because there is only 1 slot between "2:" and "finished"
print("2: ", variable_arguments("hey", " world", "!"), " finished")

-- FUnctions with a single string input can be called without (), but my config will always add () on save anyway for consistency
local single_string_function = function(str)
	print("Im a single " .. str)
end

local s2 = single_string_function("string function")
-- if the next line did not have () it would be the same as the previous line
local s1 = single_string_function "string function"
print(s2, s1)

-- You can do similarly with tables
local setup = function(opts)
	if opts.defaults == nil then
		opts.defaults = 18
	end

	print(opts.defaults, opts.other)
end

setup({ default = 12, other = false })
setup { other = true }
