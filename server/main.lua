local QBCore = exports['qb-core']:GetCoreObject()
local Leeggoedlijst = {
   
    ["leeggoed_lg1"]  =  1,
    ["leeggoed_lg2"]  =  1,
    ["leeggoed_lg3"]  =  1,
    ["leeggoed_lg4"]  =  1,
    ["leeggoed_lg5"]  =  1,
    ["leeggoed_lp1"]  =  1,
    ["leeggoed_lp2"]  =  1,
    ["leeggoed_lp3"]  =  1,
    ["leeggoed_lp4"]  =  1,
}

RegisterNetEvent('woefey-leeggoed:server:sellleeggoed', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    
    local xItem = Player.Functions.GetItemsByName(Leeggoedlijst)
    if xItem ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if Leeggoedlijst[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (Leeggoedlijst[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)

        Player.Functions.AddMoney("cash", price, "sold-resources")
            TriggerClientEvent('QBCore:Notify', src, "Je hebt je leeggoed verkocht voor €"..price)
            TriggerEvent("qb-log:server:CreateLog", "sellleeggoed", "resources", "blue", "**"..GetPlayerName(src) .. "** Je hebt €"..price.." Gekregen vor je leeggoed.")
                end
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "Je ehbt geen leeggoed!")
    end

end)

