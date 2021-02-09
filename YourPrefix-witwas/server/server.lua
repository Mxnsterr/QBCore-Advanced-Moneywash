YourCore = nil
TriggerEvent('YourCore:GetObject', function(obj) YourCore = obj end) 


RegisterServerEvent("YourPrefix-witwas:server:washmoney")
AddEventHandler("YourPrefix-witwas:server:washmoney", function()
    local geldAmount = 500
    local randomMultiplier = math.random()
    local bedragZonderAfronding = geldAmount * randomMultiplier
    local afgerond = math.floor(bedragZonderAfronding)

    if afgerond < 150 then
        afgerond = afgerond + 100

    else
        afgerond = afgerond
    end
    
    local failed = geldAmount - afgerond

    local src = source
    local Player = YourCore.Functions.GetPlayer(src)
    local item = Player.Functions.GetItemByName('zwartgeld')

    if item.amount < 500 then
        TriggerClientEvent('YourCore:Notify', src, 'Je hebt minder dan '..geldAmount.. ' biljetten', "error")

    else
        TriggerClientEvent('YourCore:Notify', src, 'Je hebt €'..afgerond.. ' wit geld verdiend en er zijn '..failed..' biljetten mislukt', "success")
        Player.Functions.AddMoney("cash", afgerond, "washed-money")

        Player.Functions.RemoveItem("zwartgeld", geldAmount)
        TriggerEvent('inventory:client:ItemBox', YourCore.Shared.Items["zwartgeld"], "remove")
    end
end)

RegisterServerEvent("YourPrefix-witwas:server:bekijkTik")
AddEventHandler("YourPrefix-witwas:server:bekijkTik", function()
    local item = "waskaart"
    local chance = math.random(1,10)
    local src = source
    local Player = YourCore.Functions.GetPlayer(src)

    if chance == 5 then
    TriggerClientEvent('YourCore:Notify', src, 'Je hebt een kaart gevonden!', "success")
    Player.Functions.AddItem(item, 1)
    TriggerEvent('inventory:client:ItemBox', YourCore.Shared.Items[item], "add")
    
    else 
        TriggerClientEvent('YourCore:Notify', src, 'Je hebt niets gevonden...', "error")
    end
end)

