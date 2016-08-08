#!/usr/bin/python

import sys
import io
import argparse
import ast

parser = argparse.ArgumentParser(description='Automatically generate lua files using template and list of knives. Don\'t waste time on editing each lua, do it at once!')
parser.add_argument('-t', default='template.txt', help='template file')
parser.add_argument('-l', default='kniveslist.txt', help='list file')
parser.add_argument('-d', default='../lua/weapons/', help='where to save lua files')
parser.add_argument('-b', default='csgo_baseknife', help='name of base class')

args = parser.parse_args()

Template_file	= io.open(args.t, 'r')
Template_text	= Template_file.read()
Template_file.close()
List_file		= io.open(args.l, 'r')
Lua_dir			= args.d
Base_name		= args.b

line_number = 0
for line in List_file:
	line_number = line_number + 1
	if line[0] == '#' or line.strip() == "":
		print('Line', line_number, 'is skipped.')
		continue
	column = ast.literal_eval(line)
	
	Lua_name	= column[0]
	Model_name	= column[1]
	Knife_name	= column[2]
	Skin_name	= column[3]
	Skin_index	= column[4]
	Are_daggers	= column[5] > 0 and 'true' or 'false'
	
	Print_name	= Knife_name + (Skin_name != 'noskin' and (' | ' + Skin_name) or '')
	
	Equip_Menu	= '''{
			type = "item_weapon",
			desc = "knife_desc"
		}'''
	Can_buy		= "{ ROLE_TRAITOR }"
	
	Format =	{'basename':Base_name,
				'luaname':Lua_name,
				'modelname':Model_name,
				'skinindex':Skin_index,
				'printname':Print_name,
				'aredaggers':Are_daggers,
				'equipmenu':Equip_Menu,
				'canbuy':Can_buy}
	
	output_text = Template_text.format(**Format)
	print(output_text)
	
	output_file = open(Lua_dir + Lua_name + '.lua', 'w')
	output_file.write(output_text)
	output_file.close()
	
#don't forget to close all remaining files
List_file.close()