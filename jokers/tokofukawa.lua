
SMODS.Joker{ --Toko Fukawa
    key = "tokofukawa",
    atlas = "tokofukawa",
    config = {
        extra = {
            mult0 = -10,
            chance = 1,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Toko Fukawa',
        ['text'] = {
            [1] = '{C:mult}#1#{} Mult',
            [2] = '{C:green}#2# in #3#{} chance to {C:attention}transform{}',
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
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,    pools = { ["danganro_danganro_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1

        local num, den = SMODS.get_probability_vars(
            card,
            p,
            card.ability.extra.odds,
            'j_danganro_tokofukawa'
        )

        return {
            vars = {card.ability.extra.mult0, num, den}
        }
    end,
    
    calculate = function(self, card, context)
        local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.mult0
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval then
            if SMODS.pseudorandom_probability(
                card,
                'tokofukawa',
                p,
                card.ability.extra.odds,
                'j_danganro_tokofukawa'
            ) then
                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:start_dissolve()
                        SMODS.add_card({key = "j_danganro_genocidejack"})
                        G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                        return true
                    end
                }))
                return{
                    message = "Sneezed!",
                    colour = G.C.GOLD
                }
            end
        end
    end
}


