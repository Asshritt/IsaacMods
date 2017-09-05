local MyMod = RegisterMod("Maggie",1)
local ItemId = {
	COLLECTIBLE_MAGGIE = Isaac.GetItemIdByName("Maggie")
}
local nbTears = nil
local dir
local coef

function MyMod:onUseMaggie()
	local player = Isaac.GetPlayer(0)
	if player:GetShootingJoystick(player):Length() > 0.1 then
		nbTears = 10
		dir = player.GetShootingJoystick(player):Normalized()
	else 
		
	end
	return true
end

function MyMod:shootTears()
	local player = Isaac.GetPlayer(0)
	if player:NeedsCharge() == true and Isaac:GetFrameCount() % 200 == 0 and player:HasCollectible(ItemId.COLLECTIBLE_MAGGIE) then
		player:SetActiveCharge(player:GetActiveCharge() + 1)
	end
	if nbTears ~= nil and nbTears ~= 0 then
		for i = 0 , 6 do
			coef = math.random(8, 14)
			Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, player.Position, dir * coef, player):ToEffect()
			local entities = Isaac.GetRoomEntities()
			for j = 1, #entities do
				if entities[j].Type == EntityType.ENTITY_TEAR and entities[j].FrameCount == 0 then
					entities[j].Velocity = entities[j].Velocity:Rotated(math.random(-4, 4))
				end
			end
		end
		nbTears = 0
	end
end

MyMod:AddCallback(ModCallbacks.MC_USE_ITEM, MyMod.onUseMaggie, ItemId.COLLECTIBLE_MAGGIE)
MyMod:AddCallback(ModCallbacks.MC_POST_UPDATE, MyMod.shootTears)