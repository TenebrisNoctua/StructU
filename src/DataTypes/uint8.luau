-- Written by @TenebrisNoctua
-- DataType module for uint8

--// Return Handler

return table.freeze({
	size = 1,
	default = 0,
	requiredType = "number",
	
	read = @native function(buf: buffer, cursor: number)
		return buffer.readu8(buf, cursor)
	end,
	write = @native function(buf: buffer, cursor: number, value: number)
		buffer.writeu8(buf, cursor, value)
	end
})