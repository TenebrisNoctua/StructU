-- Written by @TenebrisNoctua
-- DataType module for uint16

--// Return Handler

return table.freeze({
	size = 2,
	default = 0,
	requiredType = "number",
	
	read = @native function(buf: buffer, cursor: number)
		return buffer.readu16(buf, cursor)
	end,
	write = @native function(buf: buffer, cursor: number, value: number)
		buffer.writeu16(buf, cursor, value)
	end
})