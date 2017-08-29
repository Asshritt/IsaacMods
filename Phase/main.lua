local MyMod = RegisterMod("Phase",1)
local COLLECTIBLE_PHASE = Isaac.GetItemIdByName("Phase!!")
local tearflag = false

function MyMod:CacheUpdate(player, cacheFlag)
	local player = Isaac.GetPlayer(0)
    if player:HasCollectible(COLLECTIBLE_PHASE) then
		if cacheFlag == CacheFlag.CACHE_DAMAGE then
			player.Damage = player.Damage + 1.5;
		end
		if cacheFlag == CacheFlag.CACHE_SPEED then
			player.MoveSpeed = player.MoveSpeed * 1.5
		end
	end
end

MyMod:AddCallback( ModCallbacks.MC_EVALUATE_CACHE, MyMod.CacheUpdate)