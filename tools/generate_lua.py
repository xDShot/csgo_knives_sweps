#!/usr/bin/python

import sys
import io
import argparse
import ast

Q = "'"

parser = argparse.ArgumentParser(description='Automatically generate lua files using template and list of knives. Don\'t waste time on editing each lua, do it at once!')
parser.add_argument('-wt', default='weapon_template.lua', help='weapon template file')
parser.add_argument('-wd', default='../lua/weapons/', help='where to save weapons lua files')
parser.add_argument('-pt', default='pointshop_template.lua', help='pointshop item template file')
parser.add_argument('-pd', default='../lua/pointshop/items/weapons/', help='where to save pointshop items lua files')
parser.add_argument('-l', default='kniveslist.txt', help='list file')
parser.add_argument('-b', default='csgo_baseknife', help='name of base class')

args = parser.parse_args()

Weapon_file = io.open(args.wt, 'r')
Weapon_text = Weapon_file.read()
Weapon_file.close()

Pointshop_file = io.open(args.pt, 'r')
Pointshop_text = Pointshop_file.read()
Pointshop_file.close()

List_file = io.open(args.l, 'r')

Weapon_dir = args.wd
Pointshop_dir = args.pd
Base_name = args.b

line_number = 0
for line in List_file:
    line_number = line_number + 1
    if line[0] == '#' or line.strip() == "":
        # print('Line', line_number, 'is skipped.')
        continue
    column = ast.literal_eval(line)

    Lua_name    = column[0]
    Model_name  = column[1]
    Knife_name  = column[2]
    Skin_name   = column[3]
    Skin_index  = column[4]
    Are_daggers = column[5] > 0 and 'true' or 'false'
    
    Print_name = Skin_name == 'noskin' and ( Q + Knife_name + Q ) or ( Q + Knife_name + Q + ' .. ' +  Q +' | ' + Q + ' .. ' + Q + Skin_name + Q)
    
    Equip_Menu = '''{
            type = "item_weapon",
            desc = "knife_desc"
        }'''
    Can_buy = "{ ROLE_TRAITOR }"
    
    Format = {'basename':Base_name,
              'luaname':Lua_name,
              'modelname':Model_name,
              'skinindex':Skin_index,
              'printname':Print_name,
              'aredaggers':Are_daggers,
              'equipmenu':Equip_Menu,
              'canbuy':Can_buy}
    
    output_text = Weapon_text.format(**Format)
    # print(output_text)

    output_file = open(Weapon_dir + Lua_name + '.lua', 'w')
    output_file.write(output_text)
    output_file.close()

    output_text = Pointshop_text.format(**Format)
    # print(output_text)

    output_file = open(Pointshop_dir + Lua_name + '.lua', 'w')
    output_file.write(output_text)
    output_file.close()

# don't forget to close all remaining files
List_file.close()