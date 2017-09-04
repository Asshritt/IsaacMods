local MyMod = RegisterMod("Xp",1)
local ItemId = {
	COLLECTIBLE_XP = Isaac.GetItemIdByName("Xp!!")
}

function MyMod:CacheUpdate(player, cacheFlag)	
	local player = Isaac.GetPlayer(0)
    if player:HasCollectible(ItemId.COLLECTIBLE_XP) then
		if cacheFlag == CacheFlag.CACHE_DAMAGE then
			player.Damage = player.Damage * 1.2;
		end
	end
end

MyMod:AddCallback( ModCallbacks.MC_EVALUATE_CACHE, MyMod.CacheUpdate)