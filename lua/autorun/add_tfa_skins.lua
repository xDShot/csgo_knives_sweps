CreateConVar("csgo_knives_tfaskins", 1, FCVAR_ARCHIVE, "Add skins for TFA knives using this pack's base if any of them installed")

local Knifetable = {}
  
Knifetable["tfa_csgo_bayonet"] = "csgo_bayonet"
Knifetable["tfa_csgo_butfly"]  = "csgo_butterfly"
Knifetable["tfa_csgo_ctknife"] = "csgo_default_knife"
Knifetable["tfa_csgo_falch"]   = "csgo_falchion"
Knifetable["tfa_csgo_flip"]    = "csgo_flip"
Knifetable["tfa_csgo_gut"]     = "csgo_gut"
Knifetable["tfa_csgo_karam"]   = "csgo_karambit"
Knifetable["tfa_csgo_m9"]      = "csgo_m9"
Knifetable["tfa_csgo_pushkn"]  = "csgo_daggers"
Knifetable["tfa_csgo_tackni"]  = "csgo_huntsman"
Knifetable["tfa_csgo_tknife"]  = "csgo_default_t"



local function getSynonymOf( string, table )

  if table and table[ string ] then return table[ string ] end

  print("Couldn't find synonym for " .. string ..". Returning this itself.")
  return string
end



local function myinit()
  if not cvars.Bool( "csgo_knives_tfaskins", true ) then return end

  if !TFA_CSGO_SKINS then 
    print("Couldn't find TFA_CSGO_SKINS table. Probably the skins are not installed at all.") 
    return
  end
  
  for classname, v in pairs(TFA_CSGO_SKINS) do
    
    if Knifetable[ classname ] then -- we don't need to parse guns skins

      for skinid, v1 in pairs(v) do 
    
        local sweptable = weapons.Get( getSynonymOf( classname, Knifetable ) )
      
        if sweptable then
        
          sweptable.PrintName = sweptable.PrintName .. " | " .. v1["name"]
          sweptable.Category = 'CS:GO Knives (TFA Skins)'
          sweptable.PaintMaterial = v1["tbl"][1]
        
          weapons.Register( sweptable, "csgo_tfa_" .. skinid )
        
        else -- if sweptable
          print( "Failed to register new knife.","\nClassname", classname, "\nSkinid:", skinid, "\nName", v1["name"],"\nMaterial", v1["tbl"][1] )
        end -- if sweptable
      
      end -- for skinid, v1
    
    else -- Knifetable[ classname ]
      print( "Ignoring " .. classname )
    end -- Knifetable[ classname ]
    
  end -- for classname, v

end



hook.Add( "Initialize", "add_tfa_skins_hook", myinit )