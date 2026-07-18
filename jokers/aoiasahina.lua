
SMODS.Joker{ --Aoi Asahina
    key = "aoiasahina",
    atlas = "aoiasahina",
    config = {
        extra = {
            mult = 100,
            decrement = 10
        }
    },
    loc_txt = {
        ['name'] = 'Aoi Asahina',
        ['text'] = {
            [1] = '{C:mult}+#1#{} Mult',
            [2] = 'Loses {C:mult}#2#{} Mult at {C:attention}end of round{}'
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
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    pools = {
        ["danganro_mycustom_jokers"] = true,
        ["danganro_decreasing_jokers"] = true
    },
    
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.decrement
            }
        }
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.mult
            }
        end
        if context.end_of_round and context.main_eval and not context.game_over and not context.blueprint and not context.retrigger_joker then
            if danganro_decrease_blocked(card) then
                return
            end

            card.ability.extra.mult = math.max(0, card.ability.extra.mult - card.ability.extra.decrement)

            if card.ability.extra.mult <= 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        danganro_destroy_joker(card)
                        return true
                    end
                }))

                return {
                    message = "Cya!",
                    colour = G.C.GOLD
                }
            end

            return {
                message = "-" .. card.ability.extra.decrement,
                colour = G.C.MULT
            }
        end
    end
}

