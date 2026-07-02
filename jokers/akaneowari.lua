SMODS.Joker{
    key = "akaneowari",
    atlas = "akaneowari",
    pos = {x = 0, y = 0},
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    soulable = false,

    cost = 8,
    rarity = 2,
    unlocked = true,
    discovered = true,
    pools = {
        ["danganro_mycustom_jokers"] = true,
        ["danganro_decreasing_jokers"] = true
    },

    config = {
        extra = {
            chips = 500,
            decrement = 100
        }
    },

    loc_txt = {
        name = "Akane Owari",
        text = {
            "{C:chips}+#1#{} Chips",
            "Loses {C:chips}#2#{} Chips at {C:attention}end of round{}"
        }
    },

    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.decrement
            }
        }
    end,

    calculate = function (self, card, context) 
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
        if context.end_of_round and context.main_eval and not context.game_over and not context.blueprint and not context.retrigger_joker then
            if danganro_decrease_blocked(card) then
                return
            end

            card.ability.extra.chips = math.max(0, card.ability.extra.chips - card.ability.extra.decrement)

            if card.ability.extra.chips <= 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        danganro_destroy_joker(card)
                        return true
                    end
                }))

                return {
                    message = "Left!",
                    colour = G.C.GOLD
                }
            end

            return {
                message = "-" .. card.ability.extra.decrement,
                colour = G.C.CHIPS
            }
        end
    end
}

