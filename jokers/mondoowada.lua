SMODS.Joker{ --Mondo Owada
    key = "mondoowada",
    atlas = "mondoowada",
    config = {
        extra = {
            chips = 400,
            decrement = 2
        }
    },
    loc_txt = {
        ['name'] = 'Mondo Owada',
        ['text'] = {
            [1] = '{C:chips}+#1#{} Chips',
            [2] = 'Loses {C:chips}#2#{} Chips at {C:attention}end of round{},',
            [3] = 'then {C:attention}doubles{} this value'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {x = 0, y = 0},
    display_size = {
        w = 71,
        h = 95
    },
    cost = 4,
    rarity = 1,
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
                card.ability.extra.chips,
                card.ability.extra.decrement
            }
        }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and not context.retrigger_joker then
            if danganro_decrease_blocked(card) then
                return
            end

            card.ability.extra.chips = math.max(
                0,
                card.ability.extra.chips - card.ability.extra.decrement
            )

            if card.ability.extra.chips <= 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        danganro_destroy_joker(card)
                        return true
                    end
                }))

                return {
                    message = "Churned!",
                    colour = G.C.GOLD
                }
            end

            card.ability.extra.decrement = card.ability.extra.decrement * 2

            return {
                message = "Faster!",
                colour = G.C.CHIPS
            }
        end
    end
}


