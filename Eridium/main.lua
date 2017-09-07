local MyMod = RegisterMod("Eridium",1)
local ItemId = {
	COLLECTIBLE_ERIDIUM_BARS = Isaac.GetItemIdByName("Eridium bars")
}
local rand

function MyMod:CacheUpdate(player, cacheFlag)	
	local player = Isaac.GetPlayer(0)
	rand = math.random(4)
    if player:HasCollectible(ItemId.COLLECTIBLE_ERIDIUM_BARS) then
		if rand == 1 then
			if cacheFlag == CacheFlag.CACHE_DAMAGE then
				player.Damage = player.Damage * 1.2;
			end
		elseif rand == 2 then
			if cacheFlag == CacheFlag.CACHE_FIREDELAY then
				player.FireDelay = player.FireDelay * 1.2;
			end
		elseif rand == 3 then
			if cacheFlag == CacheFlag.CACHE_SPEED then
				player.MoveSpeed = player.MoveSpeed * 1.2;
			end
		elseif rand == 4 then
			if cacheFlag == CacheFlag.CACHE_LUCK then
				player.Luck = player.Luck + 2;
			end
		end
		player.TearColor = Color(1.0, 0, 1.0, 1.0, 0, 0, 0)
	end
end

MyMod:AddCallback( ModCallbacks.MC_EVALUATE_CACHE, MyMod.CacheUpdate)