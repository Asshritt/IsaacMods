local MyMod = RegisterMod("Krieg", 1)

local KriegStats = { 
	-- These are all relative to Isaac's base stats.
	DAMAGE = 3,	
	SPEED = 0,
	SHOTSPEED = 0,
	TEARHEIGHT = 0,
	TEARFALLINGSPEED = 0,
	LUCK = 0,
	FLYING = false,									
	TEARFLAG = 0, 
	TEARCOLOR = Color(1.0, 1.0, 1.0, 1.0, 0, 0, 0),
	COSTUME = Isaac.GetCostumeIdByPath("gfx/characters/character_KriegHead.anm2")
}

function KriegStats:onCache(player, cacheFlag)
	if player:GetName() == "Krieg" then -- Especially here!
		if cacheFlag == CacheFlag.CACHE_DAMAGE then
			player.Damage = player.Damage + KriegStats.DAMAGE
		end
		if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
			player.ShotSpeed = player.ShotSpeed + KriegStats.SHOTSPEED
		end
		if cacheFlag == CacheFlag.CACHE_RANGE then
			player.TearHeight = player.TearHeight - KriegStats.TEARHEIGHT
			player.TearFallingSpeed = player.TearFallingSpeed + KriegStats.TEARFALLINGSPEED
		end
		if cacheFlag == CacheFlag.CACHE_SPEED then
			player.MoveSpeed = player.MoveSpeed + KriegStats.SPEED
		end
		if cacheFlag == CacheFlag.CACHE_LUCK then
			player.Luck = player.Luck + KriegStats.LUCK
		end
		if cacheFlag == CacheFlag.CACHE_FLYING and KriegStats.FLYING then
			player.CanFly = true
		end
		if cacheFlag == CacheFlag.CACHE_TEARFLAG then
			player.TearFlags = player.TearFlags | KriegStats.TEARFLAG
		end
		if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
			player.TearColor = KriegStats.TEARCOLOR
		end
		player:AddNullCostume(KriegStats.COSTUME)
	end
end

MyMod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, KriegStats.onCache);