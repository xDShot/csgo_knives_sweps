ITEM.Name = 'Falchion Knife'
ITEM.Price = 20000
ITEM.Model = 'models/weapons/w_csgo_falchion.mdl'
ITEM.Skin = 0
ITEM.WeaponClass = 'csgo_falchion'

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