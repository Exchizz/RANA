----begin_license--
--
--Copyright 	2013 - 2016 	Søren Vissing Jørgensen.
--
--This file is part of RANA.
--
--RANA is free software: you can redistribute it and/or modify
--it under the terms of the GNU General Public License as published by
--the Free Software Foundation, either version 3 of the License, or
--(at your option) any later version.
--
--RANA is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--GNU General Public License for more details.
--
--You should have received a copy of the GNU General Public License
--along with RANA.  If not, see <http://www.gnu.org/licenses/>.
--
----end_license--

--The following global values are set via the simulation core:
-- ------------------------------------
-- IMMUTABLES.
-- ------------------------------------
-- ID -- id of the agent.
-- STEP_RESOLUTION 	-- resolution of steps, in the simulation core.
-- EVENT_RESOLUTION	-- resolution of event distribution.
-- ENV_WIDTH -- Width of the environment in meters.
-- ENV_HEIGHT -- Height of the environment in meters.
-- ------------------------------------
-- VARIABLES.
-- ------------------------------------
-- PositionX	 	-- Agents position in the X plane.
-- PositionY	 	-- Agents position in the Y plane.
-- DestinationX 	-- Agents destination in the X plane.
-- DestinationY 	-- Agents destination in the Y plane.
-- StepMultiple 	-- Amount of steps to skip.
-- Speed 		-- Movement speed of the agent in meters pr. second.
-- Moving 		-- Denotes wether this agent is moving (default = false).
-- GridMove 		-- Is collision detection active (default = false).
-- ------------------------------------

-- Import valid Rana lua libraries.
Event = require "ranalib_event"

-- Init of the lua frog, function called upon initilization of the LUA auton.
function _InitializeAgent()

    if ID == 1 then
            PositionX = 20
            PositionY = 20
    end
    if ID == 2 then
            PositionX = 60
            PositionY = 20
    end

end

function HandleEvent(event)

        if event.description == "ping" then
                            --say("Agent: "..ID .." received a ping from: "..event.ID .." saying: "..event.table.msg)
                        Event.emit{speed=343,targetID=event.ID, description="pong"}

        elseif event.description == "pong" then
                            --say("Agent: "..ID.." received a pong from agent: ".. event.ID)
        end

end

function takeStep()
        --print("Agent:"..ID.." is emiting ping")
    Event.emit{speed=343,description="ping",table={msg="I am agent "..ID}}

end

function cleanUp()
end
