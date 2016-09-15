local I, IC, L = select(2, ...):unpack()

function I:Round(num, idp)
    if(idp and idp > 0) then
        local mult = 10 ^ idp
        return floor(num * mult + 0.5) / mult
    end
    return floor(num + 0.5)
end