# StructU

This is a simple low-level struct system that I have created in Luau. It can be used to store information in a compact way, without using too much memory. It's also lightweight, and not heavy on performance.

## Usage

StructU comes with low-level built-in types, that you must use to define properties within your structs. These types are used to store the property data inside buffers. This way, each property takes as much space as you want it to take, allowing you to heavily optimize memory usage. 

```luau
local StructU = require('@StructU')
local struct = StructU.struct

local float64 = StructU.float64

local vector3 = struct {
	x = float64,
	y = float64,
	z = float64
}

local newVector = vector3 {
    x = 0.4, 
    y = 0.552, 
    z = 66.66
}

print(newVector.x, newVector.y, newVector.z)
```

In the above example, we have created a new `vector3` struct that contains 3 `float64` values: "x", "y" and "z".<br>
`float64` is a 64-bit floating-point value, which allows us to define numbers with higher precision.

As another example, we can also create a simple `Person` struct:

```luau
local StructU = require('@StructU')
local struct = StructU.struct

local string = StructU.string
local int16 = StructU.int16

local Person = struct {
	Name = string(12),
    Gender = string(12),
    Age = int16
}

local newPerson = Person {
    Name = "Alex",
    Gender = "Male",
    Age = 18
}

print(newPerson.Name, newPerson.Gender, newPerson.Age)
```

In the above example, we created a `Person` struct that contains 3 properties: A `string` "Name", a `string` "Gender", and an `int16` "Age".<br>
Using StructU, you can manually define how large a `string` will be in bytes. The "Name" and "Gender" properties have a maximum size of 12 characters (bytes).

`int16` is a 16-bit signed integer that we have used with the "Age" property to represent the age of the person.

**It must be noted that, since you are the one to determine how large a certain property will be in bytes, you must be careful on how you're accessing and setting that property. Every property uses a fixed size. Attempting to exceed these sizes may cause "buffer access out of bounds" errors.**

```luau
local StructU = require('@StructU')
local struct = StructU.struct

local string = StructU.string
local int16 = StructU.int16

local Person = struct {
	Name = string(12),
    Gender = string(12),
    Age = int16
}

local newPerson = Person {
    Name = "James William Abrams",
    Gender = "Damned",
    Age = 66
}

print(newPerson.Name, newPerson.Gender, newPerson.Age)
```

This example above will cause a "buffer access out of bounds" error, because the "Name" property has been set to a `string` that is longer than 12 characters. You must either choose a different string, or use a different size.

A similar case applies to other types, such as `int16` being used with numbers that can only be used with `float32` or `float64` types.


