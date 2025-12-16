-- Written by @TenebrisNoctua
-- DataType module for string

--// Return Handler

return {
	size = 2,
	default = "",
	requiredType = "string",
	ref = nil, -- Used internally for checking if a type is valid.
	
	read = @native function(buf: buffer, cursor: number)
		local length = buffer.readu16(buf, cursor)
		return buffer.readstring(buf, cursor + 2, length)
	end,
	write = @native function(buf: buffer, cursor: number, value: string)
		local length = string.len(value)
		buffer.writeu16(buf, cursor, length)
		buffer.writestring(buf, cursor + 2, value)
	end
}
