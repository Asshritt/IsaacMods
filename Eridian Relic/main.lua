local MyMod = RegisterMod("Eridian Relic",1)
local ItemId = {
	COLLECTIBLE_ERIDIAN_RELIC = Isaac.GetItemIdByName("Eridian Relic")
}

function MyMod:CacheUpdate(player, cacheFlag)
	local player = Isaac.GetPlayer(0)
    if player:HasCollectible(ItemId.COLLECTIBLE_ERIDIAN_RELIC) then
		
	end
end

MyMod:AddCallback( ModCallbacks.MC_EVALUATE_CACHE, MyMod.CacheUpdate)