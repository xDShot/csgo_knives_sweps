ITEM.Name = 'Shadow Daggers | Damascus Steel'
ITEM.Price = 20000
ITEM.Model = 'models/weapons/w_csgo_push.mdl'
ITEM.Skin = 3
ITEM.WeaponClass = 'csgo_daggers_damascus'

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