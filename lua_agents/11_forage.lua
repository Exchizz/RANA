--requires ranalib_map module.

local forager = {}

local search_radius = 0
local move_radius = 0

local food_color 		= {0,255,0}
local background_color 	= {0,0,0}

--state descriptors
local state_search	= "searching"
local state_eat 	= "eating"
local state = state_search

--state functions
local _Search
local _Eat

function forager.forage()

	if not Moving then
		
		if state == state_search then
			_Search()
		elseif state == state_eat then
			_Eat()
		end
	end
end

function forager.configure(configuration)

	search_radius = configuration.search_radius
	move_radius = configuration.search_move_radius
	move_speed = configuration.speed
	food_color = configuration.food_color
	background_color = configuration.background_color

end

function forager.reset()

	state = state_search

end

_Search = function()

	local table = Map.radialMapScan(search_radius)

	local start_index = l_getRandomInteger(1, #table)

	for i = 0, #table-1 do
		
		--local index = i
		local index = (start_index+i) % #table + 1
		  
		local r = table[index].R
		local g = table[index].G
		local b = table[index].B

		if _CompareColor({r,g,b}, food_color) then

			Move.to{x=table[index].posX, y=table[index].posY}
		
		---set a new state and return
			state = state_eat
			return
		end		

	end
	--if no grass is found search a new area
	Move.to{x=PositionX+l_getRandomInteger(-move_radius, move_radius), y=PositionY+l_getRandomInteger(-move_radius, move_radius)}
	
end

_Eat = function()

	--Map.modifyColor(PositionX, PositionY, background_color)
	if Map.quantumModify(PositionX, PositionY, food_color, background_color) then

		Food = Food + 1
	end

	state = state_search

end



_CompareColor = function(color1, color2)
	
	if color1[1] == color2[1] and color1[2] == color2[2] and color1[3] == color2[3] then

		return true

	end

	return false

end


return forager
