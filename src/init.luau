--!strict
--!native

-- Written by @TenebrisNoctua
-- Contains the main StructU code.

--// Variables

local Types = require('@self/Types')
local Proxy = require('@self/Proxy')

local int8 = require('@self/DataTypes/int8')
local int16 = require('@self/DataTypes/int16')
local int32 = require('@self/DataTypes/int32')
local int64 = require('@self/DataTypes/int64')
local uint8 = require('@self/DataTypes/uint8')
local uint16 = require('@self/DataTypes/uint16')
local uint32 = require('@self/DataTypes/uint32')
local uint64 = require('@self/DataTypes/uint64')
local float32 = require('@self/DataTypes/float32')
local float64 = require('@self/DataTypes/float64')
local bool = require('@self/DataTypes/bool')
local string = require('@self/DataTypes/string')

local AllDataTypes = {int8, int16, int32, int64, uint8, uint16, uint32, uint64, float32, float64, bool}
local Ref: any = table.create(0)

--// Local Functions

-- Since we can't exactly know the size of a string, we opt the user into giving its size manually.
-- This could've been done in another way, where the buffer is re-allocated once the string has been replaced.
-- However, re-allocations may be expensive, so I'm using a more static approach.

local function createString(size: number)
	if typeof(size) ~= "number" then error(`Expected number for the size argument, got {typeof(size)} instead.`) end
	
	local newString = table.clone(string)
	newString.size = size + 2
	newString.ref = Ref
	return table.freeze(newString)
end

local function isValidType(valueType: dataType<any>)
	local foundTable = table.find(AllDataTypes :: anyTable, valueType)
	local foundRef = valueType.ref == Ref
	return foundTable or foundRef
end

--// Types

type dataType<T> = Types.dataType<T>
type anyTable = Types.anyTable
type StructU = Types.StructU

--// Library Functions

local function struct(structData: {[string]: dataType<any>})
	local indexKeys = {}
	local indexValues = {}
	
	local position = 0
	local match = 0
	
	for key, valueType in structData do
		if not isValidType(valueType) then match += 1 end
		indexKeys[key] = position
		indexValues[position] = valueType
		position += valueType.size
	end
	
	if match > 0 then error("Invalid data type within the struct data.") end
	
	return function(dataTable: anyTable?)
		local newBuffer = buffer.create(position)
		local newObject = Proxy {
			__index = function(t: anyTable, i: any)
				if i == "raw" then return newBuffer end
				
				local pos = indexKeys[i]
				if not pos then error("Property does not exist.") end
				
				local val = indexValues[pos]
				if not val then error("Value type for the property does not exist.") end
				
				return val.read(newBuffer, pos)
			end,
			__newindex = function(t: anyTable, i: any, v: any)
				local pos = indexKeys[i]
				if not pos then error("Property does not exist.") end

				local val = indexValues[pos]
				local valType = typeof(v)
				local requiredType = val.requiredType
				
				if not val then error("Value type for the property does not exist.") end
				if valType ~= requiredType then error(`Expected {requiredType} for property "{i}", got {valType}.`) end
				
				val.write(newBuffer, pos, v)
			end,
			__tostring = function()
				return tostring(newBuffer)
			end
		}
		
		for key, valueType in structData do
			local value = if dataTable then dataTable[key] else valueType.default
			local valType = typeof(value)
			local requiredType = valueType.requiredType
			
			if valType ~= requiredType then error(`Expected {requiredType} for property "{key}", got {valType}.`) end
			
			valueType.write(newBuffer, indexKeys[key], value)
		end
		
		return newObject
	end
end

return {
	struct = struct,
	
	int8 = int8 :: any,
	int16 = int16 :: any,
	int32 = int32 :: any,
	int64 = int64 :: any,
	uint8 = uint8 :: any,
	uint16 = uint16 :: any,
	uint32 = uint32 :: any,
	uint64 = uint64 :: any,
	float32 = float32 :: any,
	float64 = float64 :: any,
	bool = bool :: any,
	
	string = createString,
} :: StructU