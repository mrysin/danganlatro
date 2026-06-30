
SMODS.Joker{ --Byakuya Togami
    key = "byakuyatogami",
    atlas = "byakuyatogami",
    config = {
        extra = {
            freejokerslots = 0,
            payout = 5,
            chance = 7
        }
    },
    loc_txt = {
        ['name'] = 'Byakuya Togami',
        ['text'] = {
            [1] = 'Gain {C:money}$#1#{} at the {C:attention}end of round{} for each',
            [2] = 'empty {C:attention}Joker{} slot',
            [3] = '{C:green}#2# in #3#{} chance to {C:attention}transform{}'
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
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,    pools = { ["danganro_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)

        local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1

        local num, den = SMODS.get_probability_vars(
            card,
            p,
            card.ability.extra.chance,
            'j_danganro_byakuyatogami'
        )

        return {
            vars = {
                card.ability.extra.payout,
                num,
                den
            }
        }
    end,

    calculate = function(self,card, context)
        local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1

        if context.end_of_round and context.main_eval then
            local emptySlots = G.jokers.config.card_limit - #G.jokers.cards

            if SMODS.pseudorandom_probability(
                card,
                'byakuya',
                p,
                card.ability.extra.chance,
                'j_danganro_byakuyatogami'
            ) then
                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:start_dissolve()
                        local joker_card = SMODS.add_card({ key = 'byakuyatogamievolved' })
                        G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                        return true
                    end
                }))

                return {
                    message = "realized...",
                    colour = G.C.GOLD
                }
            end

            return {
                dollars = emptySlots * card.ability.extra.payout,
                message = "$" .. (emptySlots * card.ability.extra.payout),
                colour = G.C.MONEY
            }
        end
    end
}


