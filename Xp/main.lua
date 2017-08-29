local MyMod = RegisterMod("Xp",1)
local COLLECTIBLE_XP = Isaac.GetItemIdByName("Xp!!")

function MyMod:CacheUpdate(player, cacheFlag)	
	local player = Isaac.GetPlayer(0)
    if player:HasCollectible(COLLECTIBLE_XP) then
		if cacheFlag == CacheFlag.CACHE_DAMAGE then
			player.Damage = player.Damage * 1.2;
		end
	end
end

MyMod:AddCallback( ModCallbacks.MC_EVALUATE_CACHE, MyMod.CacheUpdate)