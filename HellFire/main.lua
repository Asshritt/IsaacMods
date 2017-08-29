local MyMod = RegisterMod("HellFire",1)
local COLLECTIBLE_HELLFIRE = Isaac.GetItemIdByName("HellFire")

function MyMod:onUseHellFire()
	local player = Isaac.GetPlayer(0)
	if player:GetShootingJoystick(player):Length() > 0.1 then
		for i = 0 , 10 do
			Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, player.Position, player.GetShootingJoystick(player):Normalized() * 14 , player):ToEffect()
		end
	end
	return true
end

MyMod:AddCallback(ModCallbacks.MC_USE_ITEM, MyMod.onUseHellFire, MyMod.COLLECTIBLE_HELLFIRE)