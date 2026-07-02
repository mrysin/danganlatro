
SMODS.Joker{ --San-D
    key = "sand",
    atlas = "sand",
    config = {
        extra = {
            mult0 = 50
        }
    },
    loc_txt = {
        ['name'] = 'San-D',
        ['text'] = {
            [1] = '{C:mult}+#1#{} Mult',
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
                card.ability.extra.mult0
            }
        }
    end,
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rif' 
            or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.mult0
            }
        end
        if context.end_of_round and context.main_eval and not context.game_over and not context.retrigger_joker then
            G.E_MANAGER:add_event(Event({
                func = function()
                    danganro_destroy_joker(card)
                    return true
                end
            }))
            return{
                message = "kii-kii!",
                colour = G.C.GOLD
            }
        end
    end
}


