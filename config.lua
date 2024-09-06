Config = {}

-- Configuración de los ítems
Config.Items = {
    ['porro'] = {
        name = 'porro',
        healthBoost = 25, -- Aumenta la salud en 25
        hungerReduction = 400000, -- Reduce el hambre en 300000 unidades
        thirstReduction = 0, -- Reduce la sed en 150000 unidades
        armorBoost = 0, -- No afecta la armadura
        animationDict = 'amb@world_human_smoking@male@male_a@enter',
        animationName = 'enter',
        animationDuration = 8000, -- Duración de la animación en ms
        visualEffect = 'DrugsDrivingIn', -- Efecto visual (opcional)
        effectDuration = 70000 -- Duración del efecto visual en ms
    },
    ['cocaina'] = {
        name = 'cocaina',
        healthBoost = 50, -- Aumenta la salud en 50
        hungerReduction = 0, -- No afecta el hambre
        thirstReduction = 400000, -- No afecta la sed
        armorBoost = 10, -- Aumenta la armadura en 10
        animationDict = 'anim@mp_player_intcelebrationmale@face_palm', -- Diccionario de animación
        animationName = 'face_palm', -- Animación que lleva la mano a la cara (similar a la nariz)                   
        animationDuration = 4000, -- Duración de la animación en ms
        visualEffect = 'HeistCelebPass', -- Efecto visual (opcional)
        effectDuration = 70000 -- Duración del efecto visual en ms
    }
    
    
}

