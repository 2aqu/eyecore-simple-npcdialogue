Config = {}

Config.NPCs = {
    {
        coords = vector4(395.31, -980.84, 29.31, 73.63), -- NPC'nin koordinatları ve yönü
        model = 'a_m_m_soucent_04', -- NPC modeli
        dialog = {
            "Merhaba, yardıma ihtiyacın var mı?",
            "Bugün hava güzel değil mi?",
            "Dikkatli ol, şehirde tehlikeli insanlar var."
        },
        item = 'water_bottle', -- Verilecek item (QB-Core item ismi)
        itemCount = 1 -- Verilecek item sayısı
    },
    -- Diğer NPC'ler için aynı formatı kullanabilirsiniz
}
