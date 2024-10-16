fx_version 'cerulean'
game 'gta5'

author 'Mr.Traxx'
description 'Repair Kit for ESX'
version '1.0.0'

-- Declare dependencies
dependency 'es_extended'
dependency 'esx_addoninventory'
shared_script '@es_extended/imports.lua'

-- Client script
client_script 'client.lua'

-- Server script
server_script 'server.lua'
