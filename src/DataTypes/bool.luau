-- Written by @TenebrisNoctua
-- DataType module for boolean

--// Return Handler

return table.freeze({
	size = 1,
	default = false,
	requiredType = "boolean",
	
	read = @native function(buf: buffer, cursor: number)
		return buffer.readu8(buf, cursor) == 1
	end,
	write = @native function(buf: buffer, cursor: number, value: boolean)
		buffer.writeu8(buf, cursor, if value then 1 else 0)
	end
})