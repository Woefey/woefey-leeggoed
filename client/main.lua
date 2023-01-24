local function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local leeggoedlocatie = vector3(-1559.45, -432.24, 42.10) ---Change to change location of buyer
local sl = leeggoedlocatie --short version to make it easier (sl.x = x value of the vector3 and so on) 

CreateThread(function()
    while true do
        local InRange = false
        local PlayerPed = PlayerPedId()
        local PlayerPos = GetEntityCoords(PlayerPed)

            local dist = #(PlayerPos - vector3(sl.x, sl.y, sl.z)) 
            if dist < 10 then
                InRange = true
                DrawMarker(2,sl.x, sl.y, sl.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.2, 0.1, 255, 0, 0, 155, 0, 0, 0, 1, 0, 0, 0)
                if dist < 1 then

                    DrawText3Ds(sl.x, sl.y, sl.z, '~g~E~w~ - om je leeggoed te verkopen.') 
                    if IsControlJustPressed(0, 38) then
                        TriggerServerEvent('woefey-leeggoed:server:sellleeggoed')
                    end
                end
            end

        if not InRange then
            Wait(5000)
        end
        Wait(5)
    end
end)
