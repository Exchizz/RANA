posX = 0
posY0ltho = 0
ID = 0
macroF = 0
timeRes = 0


-- Init of the lua frog, function called upon initilization of the LUA auton:
function initAuton(x, y, id, macroFactor, timeResolution)

	posX = x
	posY = y
	ID = id
	macroF = macroFactor
	timeRes = timeResolution

	l_debug("Agent #: " .. id .. " has been initialized")

end

-- Event Handling:
function handleEvent(origX, origY, origID, origDesc, origTable)
	--make a response:
	l_debug(ID.." : "..origDesc )
	if origDesc == "ping" then
		--l_debug("making pong" )
		desc = "pong"
		s_calltable = "empty"
		propagationSpeed = 340
		targetID = 0
		return propagationSpeed, s_calltable, desc, targetID
	end

        return 0,0,0,"null"
end

--Determine whether or not this Auton will initiate an event.
function initiateEvent()

	--l_debug("color "..r..","..g..","..b)
	if l_getMersenneInteger(1,100) <= 5 then
		calltable = {name = "communication", index = 2, arg1 = callStrength}
		s_calltable = serializeTbl(calltable) 
		desc = "ping"
		propagationSpeed = 340
		targetID = 0;
		--l_gridMove(posX, posY, newPosX, newPosY)
		--posX = newPosX
		--posY = newPosY
		return propagationSpeed, s_calltable, desc, targetID
	end

	return 0,0,0,"null"
end


function getSyncData()
	return posX, posY
end

function simDone()
	l_debug("Agent #: " .. ID .. " is done\n")
end


function serializeTbl(val, name, depth)
	--skipnewlines = skipnewlines or false
	depth = depth or 0
	local tbl = string.rep("", depth)
	if name then
		if type(name)=="number" then
			namestr = "["..name.."]"
			tbl= tbl..namestr.."="
		elseif name then 
			tbl = tbl ..name.."="
			--else tbl = tbl .. "systbl="
		end	
	end
	if type(val) == "table" then
		tbl = tbl .. "{"
		local i = 1
		for k, v in pairs(val) do
			if i ~= 1 then
				tbl = tbl .. ","
			end	
			tbl = tbl .. serializeTbl(v,k, depth +1) 
			i = i + 1;
		end
		tbl = tbl .. string.rep(" ", depth) ..  "}"
	elseif type(val) == "number" then
		tbl = tbl .. tostring(val) 
	elseif type(val) == "string" then
		tbl = tbl .. string.format("%q", val)
	else
		tbl = tbl .. "[datatype not serializable:".. type(val) .. "]"
	end

	return tbl
end