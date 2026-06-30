
SMODS.Joker{ --Hifumi Yamada
    key = "hifumiyamada",
    atlas = "hifumiyamada",
    config = {
        extra = {
            repetitions0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Hifumi Yamada',
        ['text'] = {
            [1] = 'Retrigger scored',
            [2] = '{C:attention}Queens 2{} times'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {x = 0, y = 0},
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,    pools = { ["danganro_mycustom_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card:get_id() == 12 then
                return {
                    repetitions = 2,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}


