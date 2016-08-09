ITEM.Name = 'Huntsman Knife | Forest DDPAT'
ITEM.Price = 20000
ITEM.Model = 'models/weapons/w_csgo_tactical.mdl'
ITEM.Skin = 5
ITEM.WeaponClass = 'csgo_huntsman_ddpat'

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