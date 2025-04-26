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

-- Both of these examples work the same
setup({ default = 12, other = false })
setup { other = true }

local myTable = {}

-- the next 2 lines are exactly the same
function myTable.something(self, ...) end

function myTable:something_with_self_included(...) end

-- meta tables and meta methods
local vector_mt = {}

-- _add is a meta method, think of it like a self defined implementation of a specific operator
vector_mt.__add = function(left, right)
	return setmetatable({
		left[1] + right[1],
		left[2] + right[2],
		left[3] + right[3],
	}, vector_mt)
end

local v1 = setmetatable({ 3, 1, 5 }, vector_mt)
local v2 = setmetatable({ 4, -43, 2 }, vector_mt)
local v3 = v1 + v2

print(v3[1], v3[2], v3[3])
print(v3)

-- Output:
-- 7
-- -42
-- 7
-- 14, -84, 14
--
