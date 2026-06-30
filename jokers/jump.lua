
SMODS.Joker{ --Jum-P
    key = "jump",
    atlas = "jump",
    config = {
        extra = {
            dollars0 = 4
        }
    },
    loc_txt = {
        ['name'] = 'Jum-P',
        ['text'] = {
            [1] = 'Gain {C:money}$4{} when {C:attention}hand is played{}',
            [2] = '{C:red}Dies{} at the {C:attention}end of round{}'
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

    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rif' 
            or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.before == true then
            ease_dollars(4)
        end
        if context.end_of_round and context.main_eval and not context.game_over then
            G.E_MANAGER:add_event(Event({
                func = function()
                    card:start_dissolve()
                    return true
                end
            }))
            return {
                message = "kii-kii!",
                color = G.C.Gold
            }
        end
    end
}


