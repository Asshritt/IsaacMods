local MyMod = RegisterMod("The Bee",1)
local ItemId = {
	COLLECTIBLE_THE_BEE = Isaac.GetItemIdByName("The Bee")
}

function MyMod:CacheUpdate(player, cacheFlag)	
	local player = Isaac.GetPlayer(0)
    if player:HasCollectible(ItemId.COLLECTIBLE_THE_BEE) then
		player:AddSoulHearts(4)
	end
end

MyMod:AddCallback( ModCallbacks.MC_POST_NEW_LEVEL, MyMod.CacheUpdate)