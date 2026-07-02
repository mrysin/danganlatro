
SMODS.Joker{ --Cham-P
    key = "champ",
    atlas = "champ",
    config = {
        extra = {
            chips0 = 300
        }
    },
    loc_txt = {
        ['name'] = 'Cham-P',
        ['text'] = {
            [1] = '{C:chips}+#1#{} Chips',
            [2] = '{C:red}Destroyed{} at {C:attention}end of round{}'
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
    cost = 0,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,    pools = { ["danganro_Hamster"] = true },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips0
            }
        }
    end,

    in_pool = function(self, args)
        return false
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return{
                chips = card.ability.extra.chips0
            }
        end
        if context.end_of_round and context.main_eval and not context.game_over and not context.retrigger_joker then
            G.E_MANAGER:add_event(Event({
                func = function()
                    danganro_destroy_joker(card)
                    return true
                end
            }))
            return {
                message = "kii-kii!",
                colour = G.C.GOLD
            }
        end
    end
}


