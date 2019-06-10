-----------------------------------
--- Sandy Vehicles Restrictions ---
---           Public            ---
---           by Badger         ---
-----------------------------------

isSandyAOP = false

RegisterCommand("sandy", function(source, args, rawCommand)
    sm = stringsplit(rawCommand, " ");
	if IsPlayerAceAllowed(source, "Restrictions.Sandy") then
		if sm[1] == "sandy" then
			-- Example command: /aopr <location> on/off <--- Future maybe
			if sm[2] == "on" then
				CancelEvent()
				TriggerClientEvent('chat:addMessage', -1, {color = { 255, 0, 0}, multiline = true, args = {"^1AOP is now Sandy Shores and Super/Sports cars can no longer be driven!"}})
				isSandyAOP = true
				TriggerClientEvent('SandyRestrictions:IsAOP:Return', -1, isSandyAOP, false)
			end
			if sm[2] == "off" then
				CancelEvent()
				TriggerClientEvent('chat:addMessage', -1, {color = { 255, 0, 0}, multiline = true, args = {"^2Super/Sports car can be driven again! :)"}})
				isSandyAOP = false
				TriggerClientEvent('SandyRestrictions:IsAOP:Return', -1, isSandyAOP, false)
			end
		end
	end
end, true)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end