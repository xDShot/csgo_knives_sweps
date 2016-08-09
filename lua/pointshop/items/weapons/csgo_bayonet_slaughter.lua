ITEM.Name = 'Bayonet Knife | Slaughter'
ITEM.Price = 20000
ITEM.Model = 'models/weapons/w_csgo_bayonet.mdl'
ITEM.Skin = 8
ITEM.WeaponClass = 'csgo_bayonet_slaughter'

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