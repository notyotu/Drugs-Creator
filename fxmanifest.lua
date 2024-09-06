fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'notyotu'
description 'Un recurso para crear items usables'
version '1.0.0'

-- Script del cliente
client_script {
    "config.lua",
    'client.lua'
}

-- Script del servidor
server_script {
    'config.lua',
    'server.lua'
}

escrow_ignore {
    'config.lua'
}
