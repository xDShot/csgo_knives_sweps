AddCSLuaFile()

local TTT = ( GAMEMODE_NAME == "terrortown" or cvars.Bool("csgo_knives_force_ttt", false) )

DEFINE_BASECLASS( TTT and "weapon_tttbase" or "weapon_base" )

if ( SERVER ) then

	SWEP.Weight			= 5
	SWEP.AutoSwitchTo	= false
	SWEP.AutoSwitchFrom	= false
	
	CreateConVar("csgo_knives_oldsounds", 0, FCVAR_ARCHIVE, "Play old sounds when swinging knife or hitting wall")
	CreateConVar("csgo_knives_backstabs", 1, FCVAR_ARCHIVE, "Allow backstabs")
	CreateConVar("csgo_knives_primary", 1, FCVAR_ARCHIVE, "Allow primary attacks")
	CreateConVar("csgo_knives_secondary", 1, FCVAR_ARCHIVE, "Allow secondary attacks")
	CreateConVar("csgo_knives_inspecting", 1, FCVAR_ARCHIVE, "Allow inspecting")
	CreateConVar("csgo_knives_force_ttt", 0, FCVAR_ARCHIVE, "Forces knives to enable TTT mode. For debug purposes. Normally you shouldn't enable it unless you haven't any trouble getting it work in ttt")
	
	CreateConVar("csgo_knives_dmg_sec_back", 180, FCVAR_ARCHIVE, "How much damage deal when hit with secondary attack from behind")
	CreateConVar("csgo_knives_dmg_sec_front", 65, FCVAR_ARCHIVE, "How much damage deal when hit with secondary attack in front or from side")
	CreateConVar("csgo_knives_dmg_prim_back", 90, FCVAR_ARCHIVE, "How much damage deal when hit with primary attack from behind")
	CreateConVar("csgo_knives_dmg_prim_front1", 40, FCVAR_ARCHIVE, "How much damage deal when hit with primary attack in front or from side (value randomly being picked between *_front1 and *_front2)")
	CreateConVar("csgo_knives_dmg_prim_front2", 25, FCVAR_ARCHIVE, "How much damage deal when hit with primary attack in front or from side (value randomly being picked between *_front1 and *_front2)")
end



if ( CLIENT ) then
--	CreateClientConVar( "csgo_knives_cl_lefthanded", "0", true, false, "Flip knives viewmodel and hold knives on left hand" ) -- ToDo
	
	SWEP.PrintName			= "CS:GO baseknife"
	SWEP.Slot				= TTT and 6 or 2
	SWEP.SlotPos			= 0
	SWEP.DrawAmmo			= false
	SWEP.DrawCrosshair		= true
	SWEP.ViewModelFOV		= 65
	SWEP.ViewModelFlip		= false
	SWEP.CSMuzzleFlashes	= true
	SWEP.UseHands			= true
	SWEP.ViewModelFlip		= false -- cvars.Bool("csgo_knives_cl_lefthanded", false) -- ToDo
end

SWEP.Category				= "CS:GO Knives"

SWEP.Spawnable				= false
SWEP.AdminSpawnable			= false

--SWEP.ViewModel			= "models/weapons/v_csgo_default.mdl"
--SWEP.WorldModel			= "models/weapons/W_csgo_default.mdl"

SWEP.DrawWeaponInfoBox		= false

SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.ClipSize		= -1
SWEP.Primary.Damage			= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			="none"


SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Damage		= -1
SWEP.Secondary.Automatic	= true
SWEP.Secondary.Ammo			="none"

--- TTT config values

-- Kind specifies the category this weapon is in. Players can only carry one of
-- each. Can be: WEAPON_... MELEE, PISTOL, HEAVY, NADE, CARRY, EQUIP1, EQUIP2 or ROLE.
-- Matching SWEP.Slot values: 0      1       2     3      4      6       7        8
SWEP.Kind = WEAPON_EQUIP

-- If AutoSpawnable is true and SWEP.Kind is not WEAPON_EQUIP1/2, then this gun can
-- be spawned as a random weapon.
SWEP.AutoSpawnable = false

-- The AmmoEnt is the ammo entity that can be picked up when carrying this gun.
-- SWEP.AmmoEnt = "item_ammo_smg1_ttt"

-- CanBuy is a table of ROLE_* entries like ROLE_TRAITOR and ROLE_DETECTIVE. If
-- a role is in this table, those players can buy this.
SWEP.CanBuy = nil -- We are not supposed to buy base knife

-- InLoadoutFor is a table of ROLE_* entries that specifies which roles should
-- receive this weapon as soon as the round starts. In this case, none.
SWEP.InLoadoutFor = nil

-- If LimitedStock is true, you can only buy one per round.
SWEP.LimitedStock = false

-- If AllowDrop is false, players can't manually drop the gun with Q
SWEP.AllowDrop = true

-- If IsSilent is true, victims will not scream upon death.
SWEP.IsSilent = true

-- If NoSights is true, the weapon won't have ironsights
SWEP.NoSights = true

-- This sets the icon shown for the weapon in the DNA sampler, search window,
-- equipment menu (if buyable), etc.
SWEP.Icon = "vgui/ttt/icon_nades" -- most generic icon I guess

function SWEP:SetupDataTables() --This also used for variable declaration and SetVar/GetVar getting work
	self:NetworkVar( "Float", 0, "InspectTime" )
	self:NetworkVar( "Float", 1, "IdleTime" )
end



function SWEP:Initialize()
	self:SetSkin(self.SkinIndex or 0) -- Sets worldmodel skin
	self:SetHoldType( self.AreDaggers and "fist" or "knife" ) -- Avoid using SetWeaponHoldType! Otherwise the players could hold it wrong!
end



function SWEP:Think()
	self.Owner:GetViewModel():SetSkin(self.SkinIndex or 0)
	if CurTime()>=self:GetIdleTime() then
		self.Weapon:SendWeaponAnim( ACT_VM_IDLE )
		self:SetIdleTime( CurTime() + self.Owner:GetViewModel():SequenceDuration() )
	end
end



function SWEP:Deploy()
	self:SetInspectTime( 0 )
	self:SetIdleTime( CurTime() + self.Owner:GetViewModel():SequenceDuration() )
	self.Weapon:SendWeaponAnim( ACT_VM_DRAW )
	local NextAttack = 1
	self.Weapon:SetNextPrimaryFire( CurTime() + NextAttack )
	self.Weapon:SetNextSecondaryFire( CurTime() + NextAttack )
--	self.Weapon:EmitSound( "Weapon_Knife.Deploy" ) -- The deploy sound should be played only from v_ model
	return true
end



function SWEP:EntityFaceBack(ent)
	local angle = self.Owner:GetAngles().y -ent:GetAngles().y
	if angle < -180 then angle = 360 +angle end
	if angle <= 90 and angle >= -90 then return true end
	return false
end



function SWEP:FindHullIntersection(VecSrc, tr, Mins, Maxs, pEntity)
	
	local VecHullEnd = VecSrc + ((tr.HitPos - VecSrc) * 2)
	
	local tracedata = {}

	tracedata.start		= VecSrc
	tracedata.endpos	= VecHullEnd
	tracedata.filter	= pEntity
	tracedata.mask		= MASK_SOLID
	tracedata.mins		= Mins
	tracedata.maxs		= Maxs
	
	local tmpTrace = util.TraceLine( tracedata )

	if tmpTrace.Hit then
		tr = tmpTrace
		return tr
	end
	
	local Distance	= 999999
	--local MinMaxs	= { Mins, Maxs }

	for i = 0, 1 do
		for j = 0, 1 do
			for k = 0, 1 do
				
				local VecEnd = Vector()
				
				--VecEnd.x = VecHullEnd.x + MinMaxs[i].x -- Attempt to index a nil value :\
				--VecEnd.y = VecHullEnd.y + MinMaxs[j].y
				--VecEnd.z = VecHullEnd.z + MinMaxs[k].z
				VecEnd.x = VecHullEnd.x + (i>0 and Maxs.x or Mins.x)
				VecEnd.y = VecHullEnd.y + (j>0 and Maxs.y or Mins.y)
				VecEnd.z = VecHullEnd.z + (k>0 and Maxs.z or Mins.z)
				
				tracedata.endpos = VecEnd
				
				tmpTrace = util.TraceLine( tracedata )
				
				if tmpTrace.Hit then
					ThisDistance = (tmpTrace.HitPos - VecSrc):Length()

					if (ThisDistance < Distance) then
						tr = tmpTrace
						Distance = ThisDistance
					end
				end
			end -- for k
		end -- for j
	end --for i

	return tr
end



function SWEP:PrimaryAttack()
	if not cvars.Bool("csgo_knives_primary", true) or ( CurTime() < self.Weapon:GetNextPrimaryFire() ) then return end
	self:DoAttack( false )
end



function SWEP:SecondaryAttack()
	if not cvars.Bool("csgo_knives_secondary", true) or ( CurTime() < self.Weapon:GetNextSecondaryFire() ) then return end
	self:DoAttack( true )
end



function SWEP:DoAttack( Altfire )
	local Weapon	= self.Weapon
	local Attacker	= self:GetOwner()
	local Range		= Altfire and 48 or 64
	
	Attacker:LagCompensation(true)
	
	local Forward	= Attacker:GetAimVector()
	local AttackSrc	= Attacker:GetShootPos()
	local AttackEnd	= AttackSrc + Forward * Range

	local tracedata = {}

	tracedata.start		= AttackSrc
	tracedata.endpos	= AttackEnd
	tracedata.filter	= Attacker
	tracedata.mask		= MASK_SOLID
	tracedata.mins		= Vector( -16, -16, -18 ) -- head_hull_mins
	tracedata.maxs		= Vector( 16, 16, 18 ) -- head_hull_maxs

	local tr = util.TraceLine( tracedata )
	if not tr.Hit then tr = util.TraceHull( tracedata ) end
	if tr.Hit and ( not (IsValid(tr.Entity) and tr.Entity) or tr.HitWorld ) then 
		-- Calculate the point of intersection of the line (or hull) and the object we hit
		-- This is and approximation of the "best" intersection
		local HullDuckMins, HullDuckMaxs = Attacker:GetHullDuck()
		tr = self:FindHullIntersection(AttackSrc, tr, HullDuckMins, HullDuckMaxs, Attacker)
		AttackEnd = tr.HitPos -- This is the point on the actual surface (the hull could have hit space)
	end 

	local DidHit			= tr.Hit and not tr.HitSky
	local HitEntity			= IsValid(tr.Entity) and tr.Entity or Entity(0) -- Ugly hack to destroy glass surf. 0 is worldspawn.
	local DidHitPlrOrNPC	= HitEntity and ( HitEntity:IsPlayer() or HitEntity:IsNPC() ) and IsValid( HitEntity )

	Attacker:LagCompensation(false) -- Don't forget to disable it!

	-- Calculate damage and deal hurt if we can
	local Backstab = cvars.Bool("csgo_knives_backstabs", true) and DidHitPlrOrNPC and self:EntityFaceBack( HitEntity ) -- Because we can only backstab creatures
	local RMB_BACK   = cvars.Number("csgo_knives_dmg_sec_back", 180)
	local RMB_FRONT  = cvars.Number("csgo_knives_dmg_sec_front", 65)
	local LMB_BACK   = cvars.Number("csgo_knives_dmg_prim_back", 90)
	local LMB_FRONT1 = cvars.Number("csgo_knives_dmg_prim_front1", 40)
	local LMB_FRONT2 = cvars.Number("csgo_knives_dmg_prim_front2", 25)

	local Damage = ( Altfire and (Backstab and RMB_BACK or RMB_FRONT) ) or ( Backstab and LMB_BACK ) or ( ( math.random(0,5) == 3 ) and LMB_FRONT1 ) or LMB_FRONT2 -- This is random it chooses between LMB_FRONT1 AND LMB_FRONT2

	local damageinfo = DamageInfo()
	damageinfo:SetAttacker( Attacker )
	damageinfo:SetInflictor( self )
	damageinfo:SetDamage( Damage )
	damageinfo:SetDamageType( bit.bor( DMG_BULLET , DMG_NEVERGIB ) )
	damageinfo:SetDamageForce( Forward * 1000 )
	damageinfo:SetDamagePosition( AttackEnd )
	HitEntity:DispatchTraceAttack( damageinfo, tr, Forward )

	if tr.HitWorld then util.Decal("ManhackCut", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal) end

	--Change next attack time
	local NextAttack = Altfire and 1.0 or DidHit and 0.5 or 0.4
	Weapon:SetNextPrimaryFire( CurTime() + NextAttack )
	Weapon:SetNextSecondaryFire( CurTime() + NextAttack )

	--Send animation to attacker
	Attacker:SetAnimation( PLAYER_ATTACK1 )

	--Send animation to viewmodel
	local Act = DidHit and ( Altfire and ( Backstab and ACT_VM_SWINGHARD or ACT_VM_HITCENTER2 ) or ( Backstab and ACT_VM_SWINGHIT or ACT_VM_HITCENTER ) ) or ( Altfire and ACT_VM_MISSCENTER2 or ACT_VM_MISSCENTER )
	if Act then
		Weapon:SendWeaponAnim( Act )
		self:SetIdleTime( CurTime() + self.Owner:GetViewModel():SequenceDuration() )
	end

	--Play sound
	-- Sound("...") were added to precache sounds
	local Oldsounds		= cvars.Bool("csgo_knives_oldsounds", false)
	local StabSnd		= Sound("csgo_knife.Stab")
	local HitSnd		= Sound("csgo_knife.Hit")
	local HitwallSnd	= Oldsounds and Sound("csgo_knife.HitWall_old") or Sound("csgo_knife.HitWall")
	local SlashSnd		= Oldsounds and Sound("csgo_knife.Slash_old") or Sound("csgo_knife.Slash")

	local Snd			= DidHitPlrOrNPC and ( Altfire and StabSnd or HitSnd ) or DidHit and HitwallSnd or SlashSnd
	-- if Snd then Weapon:EmitSound( Snd ) end -- Probably causes sound missing
	Weapon:EmitSound( Snd )

	return true
end



function SWEP:Reload()
	if self.Owner:IsNPC() then return end -- NPCs aren't supposed to reload it

	local keydown = self.Owner:KeyDown(IN_ATTACK) or self.Owner:KeyDown(IN_ATTACK2) or self.Owner:KeyDown(IN_ZOOM)
	if not cvars.Bool("csgo_knives_inspecting", true) or keydown then return end

	local getseq = self:GetSequence()
	local act = self:GetSequenceActivity(getseq) --GetActivity() method doesn't work :\
	if ( act == ACT_VM_IDLE_LOWERED and CurTime() < self:GetInspectTime() ) then
		self:SetInspectTime( CurTime() + 0.1 ) -- We should press R repeately instead of holding it to loop
		return end

	self.Weapon:SendWeaponAnim(ACT_VM_IDLE_LOWERED)
	self:SetIdleTime( CurTime() + self.Owner:GetViewModel():SequenceDuration() )
	self:SetInspectTime( CurTime() + 0.1 )
end

--YOU'RE WINNER!