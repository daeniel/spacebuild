--
-- Created by IntelliJ IDEA.
-- User: Stijn
-- Date: 28/12/12
-- Time: 19:37
-- To change this template use File | Settings | File Templates.
--

--Lua specific
local error = error
local tostring = tostring
local type = type

-- Gmod specific
local CurTime = CurTime
local net = net
-- Class specific
local C = CLASS
local sb = sb;
local core = sb.core

function C:isA(className)
    return className == "LegacyBloomInfo"
end

function C:init(data)
    self.data = data
    if string.len(data[2]) > 0 then
        local case2 = data[2]
        self.Col_r = tonumber(string.Left(case2, string.find(case2," ") - 1))
        case2 = string.Right(case2, (string.len(case2) - string.find(case2," ")))
        self.Col_g = tonumber(string.Left(case2, string.find(case2," ") - 1))
        case2 = string.Right(case2, (string.len(case2) - string.find(case2," ")))
        self.Col_b = tonumber(case2)
    end
    if string.len(data[3]) > 0 then
        local case3 = data[3]
        self.SizeX = tonumber(string.Left(case3, string.find(case3," ") - 1))
        case3 = string.Right(case3, (string.len(case3) - string.find(case3," ")))
        self.SizeY = tonumber(case3)
    end
    self.passes = data[4] and tonumber(data[4]) or nil
    self.darken = data[5] and tonumber(data[5]) or nil
    self.multiply = data[6] and tonumber(data[6]) or nil
    self.color = data[7] and tonumber(data[7]) or nil
    self.id = data[16]

    self.modified = CurTime()
end

function C:getID()
   return self.id
end