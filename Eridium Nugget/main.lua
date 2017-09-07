local MyMod = RegisterMod("Eridium Nugget",1)
local ItemId = {
	COLLECTIBLE_ERIDIUM_NUGGET = Isaac.GetItemIdByName("Eridium Nugget")
}

function MyMod:CacheUpdate(player, cacheFlag)
	local player = Isaac.GetPlayer(0)
    if player:HasCollectible(ItemId.COLLECTIBLE_ERIDIUM_NUGGET) then
		
	end
end

MyMod:AddCallback( ModCallbacks.MC_EVALUATE_CACHE, MyMod.CacheUpdate)