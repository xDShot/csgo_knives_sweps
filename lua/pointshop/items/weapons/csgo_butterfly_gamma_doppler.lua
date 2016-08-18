ITEM.Name = 'Butterfly Knife | Gamma Doppler'
ITEM.Price = 20000
ITEM.Model = 'models/weapons/w_csgo_butterfly.mdl'
ITEM.Skin = 18
ITEM.WeaponClass = 'csgo_butterfly_gamma_doppler'

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