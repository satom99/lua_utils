# Lua utils

A collection of Lua utilities used in my projects.

### class.lua

###### Module containing class hineritance and method declaration using the least resources possible.
```lua
local animal = class()
animal.friendly = true

local dinosaur = class(animal)
dinosaur.extinct = true

local pet = dinosaur()
print(pet.friendly) -- true
print(pet.extinct) -- true
```

#####  Further documentation can be found [here](https://github.com/satom99/lua_utils/wiki).