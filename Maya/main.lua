local MyMod = RegisterMod("Maya", 1)

local MayaStats = { 
	-- These are all relative to Isaac's base stats.
	DAMAGE = 0,	
	SPEED = 0,
	SHOTSPEED = 0,
	TEARHEIGHT = 0,
	TEARFALLINGSPEED = 0,
	LUCK = 0,
	FLYING = false,									
	TEARFLAG = 0, 
	TEARCOLOR = Color(0.6, 0.6, 1.0, 1.0, 0, 0, 0),
	COSTUME = Isaac.GetCostumeIdByPath("gfx/characters/character_MayaHead.anm2")
}

function MayaStats:onCache(player, cacheFlag)
	if player:GetName() == "Maya" then -- Especially here!
		if cacheFlag == CacheFlag.CACHE_DAMAGE then
			player.Damage = player.Damage + MayaStats.DAMAGE
		end
		if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
			player.ShotSpeed = player.ShotSpeed + MayaStats.SHOTSPEED
		end
		if cacheFlag == CacheFlag.CACHE_RANGE then
			player.TearHeight = player.TearHeight - MayaStats.TEARHEIGHT
			player.TearFallingSpeed = player.TearFallingSpeed + MayaStats.TEARFALLINGSPEED
		end
		if cacheFlag == CacheFlag.CACHE_SPEED then
			player.MoveSpeed = player.MoveSpeed + MayaStats.SPEED
		end
		if cacheFlag == CacheFlag.CACHE_LUCK then
			player.Luck = player.Luck + MayaStats.LUCK
		end
		if cacheFlag == CacheFlag.CACHE_FLYING and MayaStats.FLYING then
			player.CanFly = true
		end
		if cacheFlag == CacheFlag.CACHE_TEARFLAG then
			player.TearFlags = player.TearFlags | MayaStats.TEARFLAG
		end
		if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
			player.TearColor = MayaStats.TEARCOLOR
		end
		player:AddNullCostume(MayaStats.COSTUME)
	end
end

MyMod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, MayaStats.onCache);