-----------------------------------
--- Sandy Vehicles Restrictions ---
---           by Badger         ---
-----------------------------------


--[[
	Add your vehicle restrictions below for when Sandy Shores is AOP:
]]--
restrictList = {
"tempesta",
"adder",
"banshee2",
"bullet",
"cheetah",
"cyclone",
"entityXF",
"entity2",
"fmj",
"gp1",
"infernus",
"ItaliGTB",
"ItaliGTB2",
"nero",
"nero2",
"osiris",
"penetrator",
"pfister811",
"reaper",
"sc1",
"sultanRS",
"t20",
"taipan",
"tempesta",
"turismor",
"tyrus",
"vacca",
"visione",
"voltic",
"xa21",
"zentorno",
"skyline",
"supra2",
"16charger",
"rs7",
"gtr",
"mst",
"silvia",
"prototipo",
"autarch",
"Le7b",
"deveste",
"sheava",
"tezeract",
"ardent",
"btype",
"btype2",
"btype3",
"casco",
"cheetah2",
"coquette2",
"coquette3",
"jb700",
"mamba",
"manana",
"monroe",
"peyote",
"pigalle",
"stinger",
"stingerGT",
"torero",
"tornado",
"tornado2",
"tornado3",
"tornado4",
"tornado5",
"tornado6",
"ztype",
"alpha",
"banshee",
"banshee2",
"bestiagts",
"buffalo",
"buffalo2",
"buffalo3",
"carbonizzare",
"comet2",
"comet3"
"coquette",
"elegy",
"elegy2",
"feltzer2",
"feltzer3",
"furoregt",
"fusilade",
"futo",
"infernus2",
"jester",
"jester2",
"khamelion",
"kuruma",
"kuruma2",
"lynx",
"massacro",
"massacro2",
"ninef",
"ninef2",
"omnis",
"penumbra",
"rapidgt",
"rapidgt2",
"raptor",
"ruston",
"schafter2",
"schafter3",
"schafter4",
"schafter5",
"schafter6",
"schwarzer",
"seven70",
"specter",
"specter2",
"sultan",
"surano",
"tampa2",
"tropos",
"verlierer2",
"wraith", 
"skyline", 
"supra2", 
"16charger", 
"r8ppi",
"p1",
"urus",
"gsx150",
"ferporto",
"dbs2009",
"cb500x",
"cb500f",
"c7",
"lp700r",
"gt17",
"lp610",
"f82",
"lamboreventon",
"mqgts",
"rs7", 
"hcbr2017", 
"mst", 
"cayenne", 
"bbentayga", 
"gtr",
"16challenger",
}

--- Code ---
isSandyAOP = false

function has_value (tab, val)
    for index, value in ipairs(tab) do
		--TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true, args = {"Me", "Value is: " .. val}}) -- TODO debug - get rid of
        if value == val then
            return true
        end
    end
	return false
end

RegisterNetEvent("SandyRestrictions:IsAOP:Return")
AddEventHandler("SandyRestrictions:IsAOP:Return", function(aop, error)
	if aop then
		isSandyAOP = true
	else
		isSandyAOP = false
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
		if isSandyAOP then
			-- If their vehicle is super or sports, cancel tasks
			local veh = nil
			local pedPlayer = GetPlayerPed(-1)
			local pedID = PlayerPedId()
			if IsPedInAnyVehicle(pedID, false) then
                veh = GetVehiclePedIsUsing(pedID)
            else
                veh = GetVehiclePedIsTryingToEnter(pedID)
			end
			if veh and DoesEntityExist(veh) then
				local model = GetEntityModel(veh)
				for i = 1, #restrictList do
					local restrictHash = GetHashKey(restrictList[i])
					if (model == restrictHash) then
						ShowInfo("~r~Restricted in Sandy")
						DeleteEntity(veh)
						ClearPedTasksImmediately(pedID)
					end
				end
			end
		end
	end
end)

--- Functions ---
function ShowInfo(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentSubstringPlayerName(text)
	DrawNotification(false, false)
end
