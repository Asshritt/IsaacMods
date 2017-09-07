local MyMod = RegisterMod("Class Mod",1)
local ItemId = {
	COLLECTIBLE_CLASS_MOD = Isaac.GetItemIdByName("Class Mod")
}

function MyMod:CacheUpdate(player, cacheFlag)	
	local player = Isaac.GetPlayer(0)
    if player:HasCollectible(ItemId.COLLECTIBLE_CLASS_MOD) then
		if cacheFlag == CacheFlag.CACHE_DAMAGE then
			player.Damage = player.Damage + 3;
		end
	end
end

MyMod:AddCallback( ModCallbacks.MC_EVALUATE_CACHE, MyMod.CacheUpdate)