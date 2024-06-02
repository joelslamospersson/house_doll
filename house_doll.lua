local action = Action()

function action.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	-- Creates a function to get the player's house by player GUID
	local home = getHouseByPlayerGUID(getPlayerGUID(player))
	-- If player does not own a house, return false
    if not home then
        player:sendTextMessage(MESSAGE_ADMINISTRATOR, "Sorry, You don't own a house.")
        return false 
    end
	-- Is player in combat?
	if player:hasCondition(CONDITION_INFIGHT) then -- Use player:getCondition() to check if the player is in combat, using hasCondition instead.
		--print(player:hasCondition(CONDITION_INFIGHT)) -- Print the condition status to the server console, debug
		player:sendTextMessage(MESSAGE_ADMINISTRATOR, "You can't use this item while in combat.")
	else
		-- Continue with script if the above conditions are false
		player:teleportTo(getHouseEntry(home))
		--print(player:getCondition(CONDITION_INFIGHT)) -- Debug message
		item:remove(1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have been teleported to your house.")
		return true
	end
end

action:id(27845, 27846) -- Item id
action:register()
