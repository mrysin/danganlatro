
SMODS.Joker{ --Gundham Tanaka
    key = "gundhamtanaka",
    atlas = "gundhamtanaka",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Gundham Tanaka',
        ['text'] = {
            [1] = 'Creates a random {C:dark_edition}Dark Deva{}',
            [2] = 'when {C:attention}Blind{} is selected',
            [3] = '{C:inactive}(Must have room){}'
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
    discovered = true,    pools = { ["danganro_danganro_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                func = function()
                    
                    local created_joker = false
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        created_joker = true
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'danganro_Hamster' })
                                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                                return true
                            end
                        }))
                    end
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                    end
                    return true
                end
            }
        end
    end
}


