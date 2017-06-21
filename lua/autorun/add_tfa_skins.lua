CreateConVar("csgo_knives_tfaskins", 1, FCVAR_ARCHIVE, "Add skins for TFA knives using this pack's base if any of them installed")

local Knifetable = {}

-- Old API
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

-- New API
Knifetable["weapon_bayonet"] = "csgo_bayonet"
Knifetable["weapon_bowie"]   = "csgo_bowie"
Knifetable["weapon_butfly"]  = "csgo_butterfly"
Knifetable["weapon_falch"]   = "csgo_falchion"
Knifetable["weapon_flip"]    = "csgo_flip"
Knifetable["weapon_gut"]     = "csgo_gut"
Knifetable["weapon_karam"]   = "csgo_karambit"
Knifetable["weapon_m9"]      = "csgo_m9"
Knifetable["weapon_pushkn"]  = "csgo_daggers"
Knifetable["weapon_tackni"]  = "csgo_huntsman"

local Skinstable = {}
Skinstable["aa_fade"] = "Fade"
Skinstable["am_blackpearl_marbleized"] = "Doppler Marbleized"
Skinstable["am_doppler_phase1"] = "Doppler Phase 1"
Skinstable["am_doppler_phase2"] = "Doppler Phase 2"
Skinstable["am_doppler_phase3"] = "Doppler Phase 3"
Skinstable["am_doppler_phase4"] = "Doppler Phase 4"
Skinstable["am_emerald_marbleized"] = "Gamma Doppler Emerald"
Skinstable["am_gamma_doppler_phase1"] = "Gamma Doppler Phase 1"
Skinstable["am_gamma_doppler_phase2"] = "Gamma Doppler Phase 2"
Skinstable["am_gamma_doppler_phase3"] = "Gamma Doppler Phase 3"
Skinstable["am_gamma_doppler_phase4"] = "Gamma Doppler Phase 4"
Skinstable["am_marble_fade"] = "Marble Fade"
Skinstable["am_marked_up_fine"] = "Freehand"
Skinstable["am_ruby_marbleized"] = "Doppler Ruby"
Skinstable["am_sapphire_marbleized"] = "Doppler Sapphire"
Skinstable["am_zebra"] = "Slaughter"
Skinstable["an_tiger_orange"] = "Tiger Tooth"
Skinstable["aq_blued"] = "Blue Steel"
Skinstable["aq_damascus"] = "Damascus Steel"
Skinstable["aq_forced"] = "Stained"
Skinstable["aq_oiled"] = "Case Hardened"
Skinstable["aq_steel_knife"] = "Rust Coat"
Skinstable["cu_karam_lore"] = "Lore"
Skinstable["cu_karam_stonewash"] = "Black Laminate"
Skinstable["gs_karam_autotronic"] = "Autotronic"
Skinstable["hy_ddpat"] = "Forest DDPAT"
Skinstable["hy_forest_boreal"] = "Boreal Forest"
Skinstable["hy_ocean_knife"] = "Bright Water"
Skinstable["hy_webs"] = "Crimson Web"
Skinstable["so_night"] = "Night"
Skinstable["so_purple"] = "Ultraviolet"
Skinstable["sp_dapple"] = "Scorched"
Skinstable["sp_mesh_tan"] = "Safari Mesh"
Skinstable["sp_tape_urban"] = "Urban Masked"
Skinstable["am_marked_up"] = "Freehand"
Skinstable["cu_bayonet_lore"] = "Lore"
Skinstable["cu_bayonet_stonewash"] = "Black Laminate"
Skinstable["gs_bayonet_autotronic"] = "Autotronic"
Skinstable["aq_damascus_90"] = "Damascus Steel"
Skinstable["am_blackpearl_marbleized_b"] = "Doppler Black Pearl"
Skinstable["am_doppler_phase2_b"] = "Doppler Phase 2"
Skinstable["am_sapphire_marbleized_b"] = "Doppler Marbleized"
Skinstable["so_purple_falchion"] = "Ultraviolet"
Skinstable["cu_flip_lore"] = "Lore"
Skinstable["cu_flip_stonewash"] = "Black Laminate"
Skinstable["gs_flip_autotronic"] = "Autotronic"
Skinstable["cu_gut_lore"] = "Lore"
Skinstable["cu_gut_stonewash"] = "Black Laminate"
Skinstable["gs_gut_autotronic"] = "Autotronic"
Skinstable["cu_m9_bay_lore"] = "Lore"
Skinstable["cu_m9_bay_stonewash"] = "Black Laminate"
Skinstable["gs_m9_bay_autotronic"] = "Autotronic"
Skinstable["hy_ocean_knife_90"] = "Bright Water"
Skinstable["cu_purple_huntsman"] = "Ultraviolet"

local Material_default = {}
Material_default["$basetexture"] = "null"
Material_default["$bumpmap"] = "null-bumpmap"
Material_default["$phongexponenttexture"] = "null"
Material_default["$phong"] = "1"
Material_default["$phongboost"] = "2"
Material_default["$phongalbedoboost"] = "35"
Material_default["$phongfresnelranges"] = "[.83 .83 1]"
Material_default["$phongalbedotint"] = "1"
Material_default["$phongdisablehalflambert"] = "1"
Material_default["$basemapalphaphongmask"] = "1"
Material_default["$envmap"] = "env_cubemap"
Material_default["$envmapfresnel"] = "1"
Material_default["$envmaptint"] = "[.1 .1 .1]"
Material_default["$basealphaenvmapmask"] = "1"

local Material_am = table.Copy( Material_default )
Material_am["$phongboost"] = "48"
Material_am["$phongalbedoboost"] = "120"
Material_am["$phongfresnelranges"] = "[0.65 0.75 1]"
Material_am["$envmapfresnel"] = "0.5"
Material_am["$envmaptint"] = "[0.005 0.005 0.005]"
Material_am["$color2"] = "[1.3 1.3 1.3]"

local Material_aa = table.Copy( Material_default )
Material_aa["$phongboost"] = "32"
Material_aa["$phongalbedoboost"] = "128"
Material_aa["$phongfresnelranges"] = "[0.75 0.85 1]"
Material_aa["$envmapfresnel"] = "1"
Material_aa["$envmaptint"] = "[0.075 0.075 0.075]"
Material_aa["$color2"] = "[2 2 2]"

local Material_an = table.Copy( Material_default )
Material_an["$phongboost"] = "32"
Material_an["$phongalbedoboost"] = "128"
Material_an["$phongfresnelranges"] = "[0.75 0.85 1]"
Material_an["$envmapfresnel"] = "1"
Material_an["$envmaptint"] = "[0.018 0.018 0.018]"
Material_an["$color2"] = "[2 2 2]"

local Material_aq = table.Copy( Material_default )
Material_aq["$phongboost"] = "32"
Material_aq["$phongalbedoboost"] = "128"
Material_aq["$phongfresnelranges"] = "[0.6 0.75 1]"
Material_aq["$envmapfresnel"] = "1"
Material_aq["$envmaptint"] = "[0.02 0.02 0.025]"

local Material_cu = table.Copy( Material_default )
Material_cu["$phongboost"] = "6"
Material_cu["$phongalbedoboost"] = "16"
Material_cu["$phongfresnelranges"] = "[0.15 0.55 1]"
Material_cu["$envmapfresnel"] = "0.3"
Material_cu["$envmaptint"] = "[0.01 0.01 0.01]"

local Material_hy = table.Copy( Material_default )
Material_hy["$phongboost"] = "4"
Material_hy["$phongalbedoboost"] = "16"
Material_hy["$phongfresnelranges"] = "[0.15 0.55 1]"
Material_hy["$envmapfresnel"] = "0.2"
Material_hy["$envmaptint"] = "[0.05 0.05 0.05]"

local Material_sp = table.Copy( Material_default )
Material_sp["$phongboost"] = "8"
Material_sp["$phongalbedoboost"] = "16"
Material_sp["$phongfresnelranges"] = "[0.1 0.55 1]"
Material_sp["$envmapfresnel"] = "0.3"
Material_sp["$envmaptint"] = "[0.1 0.1 0.1]"


local function getSynonymOf( string, table )

  if table and table[ string ] then return table[ string ] end

  print("Couldn't find synonym for " .. string ..". Returning this itself.")
  return string
end



local function registerKnife( sweptable, printname, paintmaterial, skinid, classname )
  sweptable.PrintName = sweptable.PrintName .. " | " .. printname .. " (TFA)"
  sweptable.Category = 'CS:GO Knives (TFA Skins)'
  sweptable.PaintMaterial = paintmaterial
        
  weapons.Register( sweptable, classname .. "_tfa_" .. skinid )
end



local function myinit()
  if not cvars.Bool( "csgo_knives_tfaskins", true ) then return end

  if !TFA_CSGO_SKINS then 
    print("Couldn't find TFA_CSGO_SKINS table. Probably the skins (old API) are not installed at all.") 
    TFA_CSGO_SKINS = TFA_CSGO_SKINS or {}
  end
  
  for classname, v in pairs(TFA_CSGO_SKINS) do
    
    if Knifetable[ classname ] then -- we don't need to parse guns skins

      for skinid, v1 in pairs(v) do 
    
        local sweptable = weapons.Get( getSynonymOf( classname, Knifetable ) )
      
        if sweptable then
        
          registerKnife( sweptable, v1["name"], v1["tbl"][1], skinid, "csgo" )
        
        else -- if sweptable
          print( "Failed to register new knife.","\nClassname", classname, "\nSkinid:", skinid, "\nName", v1["name"],"\nMaterial", v1["tbl"][1] )
        end -- if sweptable
      
      end -- for skinid, v1
    
    else -- Knifetable[ classname ]
      print( "Ignoring " .. classname )
    end -- Knifetable[ classname ]
    
  end -- for classname, v

  --New API
  local skinsvtfs = file.Find( "materials/csgo_skins/*-diffuse.vtf", "GAME" )
  for k, vtffile in pairs( skinsvtfs ) do
    vtffile_noext = string.Replace( vtffile, ".vtf", "" )
    vtffile_explode = string.Explode( "-", vtffile_noext )
    
    local classname = getSynonymOf( vtffile_explode[1], Knifetable )
    
    local skinid = vtffile_explode[2]
    
    local st = string.sub( skinid, 1, 2 )
    
    local materialtable = table.Copy( st == "am" and Material_am
                                      or st == "aa" and Material_aa
                                      or st == "an" and Material_an
                                      or st == "aq" and Material_aq
                                      or st == "cu" and Material_cu
                                      or st == "hy" and Material_hy
                                      or st == "sp" and Material_sp
                                      or Material_default )
                                 
    materialtable["$basetexture"] = "csgo_skins/" .. vtffile_noext
    materialtable["$phongexponenttexture"] = "csgo_skins/" .. string.Replace( vtffile_noext, "-diffuse", "-exponent" )
    
    if CreateMaterial then
      CreateMaterial( vtffile_noext, "VertexLitGeneric", materialtable )
    end
    
    local printname = getSynonymOf( skinid, Skinstable )
    
    local sweptable = weapons.Get( classname )
      
    if sweptable then
      
      registerKnife( sweptable, printname, "!" .. vtffile_noext, skinid, classname )
      
    else -- if sweptable
      print( "Failed to register new knife.","\nClassname", classname, "\nSkinid:", skinid, "\nName", printname,"\nMaterial", !vtffile_noext )
    end -- if sweptable
  end
end



hook.Add( "Initialize", "add_tfa_skins_hook", myinit )
