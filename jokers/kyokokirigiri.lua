
SMODS.Joker{ --Kyoko Kirigiri
    key = "kyokokirigiri",
    atlas = "kyokokirigiri",
    config = {
        extra = {
            counter = 0,
            Xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Kyoko Kirigiri',
        ['text'] = {
            [1] = 'Gains {X:red,C:white}X0.5{} Mult for every',
            [2] = '{C:attention}8 Jokers{} sold {C:inactive}(#1#/8){}',
            [3] = '{C:inactive}(Currently {X:red,C:white}X#2#{} {C:inactive}Mult){}'
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
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,    pools = { ["danganro_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.counter, card.ability.extra.Xmult}}
    end,
    
    calculate = function(self, card, context)
        if context.selling_card and not context.blueprint and not context.retrigger_joker then
            card.ability.extra.counter = card.ability.extra.counter + 1

            if card.ability.extra.counter >= 8 then
                card.ability.extra.counter = 0
                card.ability.extra.Xmult = card.ability.extra.Xmult + 0.5

                return {
                    message = card.ability.extra.Xmult,
                    colour = G.C.MULT
                }
            end
        end
        if context.joker_main then
            return{
                x_mult = card.ability.extra.Xmult
            }
        end
    end
}


