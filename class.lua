--[[
	Author: AdamJames (satom99@github)
	License: MIT
	Repository: https://github.com/satom99/lua_utils
]]

local function recursive (object, class, ...)
	local parent = getmetatable(class)
	parent = (parent and parent.__index)
	if parent then
		recursive(object, parent, ...)
	end
	local constructor = rawget(class, '__constructor')
	if constructor then
		constructor(object, ...)
	end
end

return function(parent)
	parent = parent or {}
	return setmetatable(
		{},
		{
			__index = parent,
			__call = function(self, ...)
				local object = setmetatable(
					{},
					{
						__index = self,
					}
				)
				recursive(object, self, ...)
				object.__constructor = false
				return object
			end,
		}
	)
end
