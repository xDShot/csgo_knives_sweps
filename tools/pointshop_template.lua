ITEM.Name = {printname}
ITEM.Price = 20000
ITEM.Model = 'models/weapons/w_{modelname}.mdl'
ITEM.Skin = {skinindex}
ITEM.WeaponClass = '{luaname}'

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