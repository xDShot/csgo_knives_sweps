ITEM.Name = 'Bowie knife | Freehand'
ITEM.Price = 20000
ITEM.Model = 'models/weapons/w_csgo_bowie.mdl'
ITEM.Skin = 17
ITEM.WeaponClass = 'csgo_bowie_freehand'

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