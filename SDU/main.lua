local MyMod = RegisterMod("SDU",1)
local ItemId = {
	COLLECTIBLE_SDU = Isaac.GetItemIdByName("SDU")
}

function MyMod:CacheUpdate(player, cacheFlag)	
	local player = Isaac.GetPlayer(0)
    if player:HasCollectible(ItemId.COLLECTIBLE_SDU) then
		
	end
end

MyMod:AddCallback( ModCallbacks.MC_EVALUATE_CACHE, MyMod.CacheUpdate)