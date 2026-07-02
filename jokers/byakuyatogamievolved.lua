
SMODS.Joker{ --Byakuya Togami Evolved
    key = "byakuyatogamievolved",
    atlas = "byakuyatogamievolved",
    config = {
        extra = {
            payout = 5
        }
    },
    loc_txt = {
        ['name'] = 'Byakuya Togami Evolved',
        ['text'] = {
            [1] = 'Earn {C:money}$#1#{} for each {C:attention}Joker{}',
            [2] = 'at {C:attention}end of round{}'
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
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,    pools = { ["danganro_mycustom_jokers"] = true },

    loc_vars = function(self, info_queue, card) 
        return {vars = {card.ability.extra.payout}}
    end,

    
    in_pool = function(self, args)
        return false
    end,

    calculate = function(self, card,context)
        if context.end_of_round and context.main_eval then
            local jokers = #G.jokers.cards

            return {
                dollars = jokers * card.ability.extra.payout,
                message = "$" .. (jokers * card.ability.extra.payout),
                colour = G.C.MONEY
            }
        end
    end
}


