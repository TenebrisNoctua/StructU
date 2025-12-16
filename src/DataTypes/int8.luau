-- Written by @TenebrisNoctua
-- DataType module for int8

--// Return Handler

return table.freeze({
	size = 1,
	default = 0,
	requiredType = "number",
	
	read = @native function(buf: buffer, cursor: number)
		return buffer.readi8(buf, cursor)
	end,
	write = @native function(buf: buffer, cursor: number, value: number)
		buffer.writei8(buf, cursor, value)
	end
})