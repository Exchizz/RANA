--requires ranalib_map module.
local forager = {}

local search_radius = 0
local move_radius = 0
local spot_spacing = 0

local resting_spot 	= {R=230,G=130,B=130}
local background 	= {R=0,G=0,B=0}

local restingSpots = {}

--state descriptors
local state_search	= "searching"
local state_rest 	= "resting"
local state = state_search

--state functions
local _Search
local _Eat

function forager.forage()

	if not Moving then
		
		if state == state_search then
			_Search()
		elseif state == state_rest then
			_Rest()
		end
	end
end

function resting.configure(configuration)

	move_speed = configuration.speed
	spot_spacing = configuration.spot_spacing

end

function resting.reset()

	state = state_search

end_Search = function()

	local table = Map.radialMapScan(search_radius)

	local start_index = l_getRandomInteger(1, #table)

	for i = 0, #table-1 do
		
		local index = (start_index+i) % #table + 1
		  
		local r = table[index].R
		local g = table[index].G
		local b = table[index].B

		if _CompareColor({R=r,G=g,B=b}, resting_spot) then

			Move.to{x=table[index].posX, y=table[index].posY}
		
			--set a new state and return
			state = state_eat
			return
		end		

	end
	--if no grass is found search a new area
	Move.to{x=PositionX+l_getRandomInteger(-move_radius, move_radius), y=PositionY+l_getRandomInteger(-move_radius, move_radius)}
	
end

_ = function()

	if Map.quantumModify(PositionX, PositionY, grass, background) then

		Energy = Energy + 1
	end

	state = state_search

end

_CompareColor = function(color1, color2)
	
	if color1.R == color2.R and color1.G == color2.G and color1.B == color2.B then

		return true

	end

	return false

end


return forager
