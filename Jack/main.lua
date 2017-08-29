local MyMod = RegisterMod("Jack", 1)

local JackStats = { 
  -- These are all relative to Isaac's base stats.
	DAMAGE = 2,	
	SPEED = 0,
	SHOTSPEED = 0,
	TEARHEIGHT = 0,
	TEARFALLINGSPEED = 0,
	LUCK = 2,
	FLYING = false,									
	TEARFLAG = 2, 
	TEARCOLOR = Color(1.0, 1.0, 1.0, 1.0, 0, 0, 0),
	COSTUME = Isaac.GetCostumeIdByPath("gfx/characters/character_JackHead.anm2")
}

function JackStats:onCache(player, cacheFlag)
	if player:GetName() == "Jack" then
		if cacheFlag == CacheFlag.CACHE_DAMAGE then
			player.Damage = player.Damage + JackStats.DAMAGE
		end
		if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
			player.ShotSpeed = player.ShotSpeed + JackStats.SHOTSPEED
		end
		if cacheFlag == CacheFlag.CACHE_RANGE then
			player.TearHeight = player.TearHeight - JackStats.TEARHEIGHT
			player.TearFallingSpeed = player.TearFallingSpeed + JackStats.TEARFALLINGSPEED
		end
		if cacheFlag == CacheFlag.CACHE_SPEED then
			player.MoveSpeed = player.MoveSpeed + JackStats.SPEED
		end
		if cacheFlag == CacheFlag.CACHE_LUCK then
			player.Luck = player.Luck + JackStats.LUCK
		end
		if cacheFlag == CacheFlag.CACHE_FLYING and JackStats.FLYING then
			player.CanFly = true
		end
		if cacheFlag == CacheFlag.CACHE_TEARFLAG then
			player.TearFlags = player.TearFlags | JackStats.TEARFLAG
		end
		if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
			player.TearColor = JackStats.TEARCOLOR
		end
		player:AddNullCostume(JackStats.COSTUME)
	end
end

MyMod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, JackStats.onCache);