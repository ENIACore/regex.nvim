local Substitutor = {}

---@class Substitutor
---Builder is the first UI to create search & replace regex
---Creates search, options, preview, and replace panes
function Substitutor:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

return Substitutor

