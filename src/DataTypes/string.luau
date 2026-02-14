-- Written by @TenebrisNoctua
-- DataType module for string

local writestring = buffer.writestring
local readstring = buffer.readstring

local readu16 = buffer.readu16
local writeu16 = buffer.writeu16

local len = string.len

--// Return Handler

return {
	size = 2,
	default = "",
	requiredType = "string",
	ref = nil, -- Used internally for checking if a type is valid.
	
	read = @native function(buf: buffer, cursor: number)
		local length = readu16(buf, cursor)
		return readstring(buf, cursor + 2, length)
	end,
	write = @native function(buf: buffer, cursor: number, value: string)
		local length = len(value)
		writeu16(buf, cursor, length)
		writestring(buf, cursor + 2, value)
	end
}