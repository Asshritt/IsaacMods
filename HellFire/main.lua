local MyMod = RegisterMod("HellFire",1)
local ItemId = {
	COLLECTIBLE_HELLFIRE = Isaac.GetItemIdByName("HellFire")
}
local nbTears = nil
local dir

function MyMod:onUseHellFire()
	local player = Isaac.GetPlayer(0)
	if player:GetShootingJoystick(player):Length() > 0.1 then
		nbTears = 30
		dir = player.GetShootingJoystick(player):Normalized()
	else 
		
	end
	return true
end

function MyMod:shootTears()
	local player = Isaac.GetPlayer(0)
	if nbTears ~= nil and nbTears ~= 0 then
		Isaac.Spawn(EntityType.ENTITY_TEAR, 5, 0, player.Position, dir * 14 , player):ToEffect()
		nbTears = nbTears - 1
	end
end

MyMod:AddCallback(ModCallbacks.MC_USE_ITEM, MyMod.onUseHellFire, ItemId.COLLECTIBLE_HELLFIRE)
MyMod:AddCallback(ModCallbacks.MC_POST_UPDATE, MyMod.shootTears)