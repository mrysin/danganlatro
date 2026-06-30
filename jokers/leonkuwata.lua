
SMODS.Joker{ --Leon Kuwata
    key = "leonkuwata",
    atlas = "leonkuwata",
    config = {
        extra = {
            repetitions = 15,
            mult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Leon Kuwata',
        ['text'] = {
            [1] = '{C:red}+1{} Mult',
            [2] = '{C:attention}Again{}, and {C:attention}again{},',
            [3] = 'and {C:attention}again{}, and {C:attention}again{}, and {C:attention}again{},',
            [4] = 'and {C:attention}again{}, and {C:attention}again{}, and {C:attention}again{},',
            [5] = 'and {C:attention}again{}, and {C:attention}again{}, and {C:attention}again{},',
            [6] = 'and {C:attention}again{}, and {C:attention}again{}, and {C:attention}again{}'
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
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,    pools = { ["danganro_mycustom_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                for i = 1, 15 do
                    SMODS.calculate_effect({mult = 1}, card)
                end
            end
        end
    end
}


