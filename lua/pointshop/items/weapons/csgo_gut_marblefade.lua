ITEM.Name = "Gut Knife" .. " | " .. "Marble Fade"
ITEM.Price = 20000
ITEM.Model = "models/weapons/w_csgo_gut.mdl"
ITEM.Skin = 13
ITEM.WeaponClass = "csgo_gut_marblefade"

function ITEM:OnEquip(ply)
	ply:Give(self.WeaponClass)
end

function ITEM:OnBuy(ply)
	ply:Give(self.WeaponClass)
	ply:SelectWeapon(self.WeaponClass)
end

function ITEM:OnSell(ply)
	ply:StripWeapon(self.WeaponClass)
end

function ITEM:OnHolster(ply)
	ply:StripWeapon(self.WeaponClass)
end
