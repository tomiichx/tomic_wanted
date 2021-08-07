fx_version 'cerulean'
games { 'gta5' }

author "tomiichx, rad0je"
description "Wanted Level Sistem. In-Development!"

client_scripts { 
  "klijent.lua"
}

server_scripts { 
  '@mysql-async/lib/MySQL.lua',
  'server.lua'
}

dependencies {
	'hz_framework' -- (es_extended)
}