fx_version 'cerulean'
game 'gta5'

author 'Your Name'
description 'NPC interaction script with dialogue and item giving'
version '1.0.0'

client_scripts {
    'client.lua',
    'dialogueui/dialogue.js',
    'dialogueui/dialogue.html',
    'config.lua'
}

server_scripts {
    '@qb-core/import.lua', -- Örnek olarak qb-core bağımlılığı
    'server.lua',
    'config.lua'
}

ui_page 'dialogueui/dialogue.html'

dependencies {
    'qb-core' -- Eğer kullanıyorsanız
}
