local I, IC, L = select(2, ...):unpack()

I.mult = 1

function I:Round(num, idp)
    if(idp and idp > 0) then
        local mult = 10 ^ idp
        return floor(num * mult + 0.5) / mult
    end
    return floor(num + 0.5)
end

function I:Scale(x)
    return (self.mult*math.floor(x/self.mult+.5))
end

function I:ShortValue(v)
        if v >= 1e6 or v <= -1e6 then
            return ("%.1fm"):format(v / 1e6):gsub("%.?0+([km])$", "%1")
        elseif v >= 1e3 or v <= -1e3 then
            return ("%.1fk"):format(v / 1e3):gsub("%.?0+([km])$", "%1")
        else
            return v
        end
        -- if v >= 1e8 or v <= -1e8 then
        --     return ("%.1f" .. SECOND_NUMBER_CAP):format(v / 1e8):gsub("%.?0+([km])$", "%1")
        -- elseif v >= 1e4 or v <= -1e4 then
        --     return ("%.1f" .. FIRST_NUMBER_CAP):format(v / 1e4):gsub("%.?0+([km])$", "%1")
        -- else
        --     return v
        -- end
end

function I:GetScreenQuadrant(frame)
    local x, y = frame:GetCenter()
    local screenWidth = GetScreenWidth()
    local screenHeight = GetScreenHeight()
    local point

    if not frame:GetCenter() then
        return "UNKNOWN", frame:GetName()
    end

    if (x > (screenWidth / 4) and x < (screenWidth / 4)*3) and y > (screenHeight / 4)*3 then
        point = "TOP"
    elseif x < (screenWidth / 4) and y > (screenHeight / 4)*3 then
        point = "TOPLEFT"
    elseif x > (screenWidth / 4)*3 and y > (screenHeight / 4)*3 then
        point = "TOPRIGHT"
    elseif (x > (screenWidth / 4) and x < (screenWidth / 4)*3) and y < (screenHeight / 4) then
        point = "BOTTOM"
    elseif x < (screenWidth / 4) and y < (screenHeight / 4) then
        point = "BOTTOMLEFT"
    elseif x > (screenWidth / 4)*3 and y < (screenHeight / 4) then
        point = "BOTTOMRIGHT"
    elseif x < (screenWidth / 4) and (y > (screenHeight / 4) and y < (screenHeight / 4)*3) then
        point = "LEFT"
    elseif x > (screenWidth / 4)*3 and y < (screenHeight / 4)*3 and y > (screenHeight / 4) then
        point = "RIGHT"
    else
        point = "CENTER"
    end

    return point
end