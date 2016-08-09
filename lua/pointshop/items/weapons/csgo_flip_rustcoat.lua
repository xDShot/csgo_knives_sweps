ITEM.Name = 'Flip Knife | Rust Coat'
ITEM.Price = 20000
ITEM.Model = 'models/weapons/w_csgo_flip.mdl'
ITEM.Skin = 12
ITEM.WeaponClass = 'csgo_flip_rustcoat'

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