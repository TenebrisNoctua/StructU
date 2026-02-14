-- Written by @TenebrisNoctua
-- DataType module for uint64

local readu32 = buffer.readu32
local writeu32 = buffer.writeu32

--// Return Handler

return table.freeze({
	size = 8,
	default = 0,
	requiredType = "number",

	read = @native function(buf: buffer, cursor: number)
		local low = readu32(buf, cursor)
		local high = readu32(buf, cursor + 4)
		return high * 4294967296 + low
	end,

	write = @native function(buf: buffer, cursor: number, value: number)
		local v = value % 2 ^ 64
		local low = v % 0x100000000
		local high = v // 0x100000000

		writeu32(buf, cursor, low)
		writeu32(buf, cursor + 4, high)
	end
})