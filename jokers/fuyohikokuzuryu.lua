SMODS.Joker{
    key = "fuyohikokuzuryu",
    atlas = "fuyohikokuzuryu",
    pos = {x = 0, y = 0},
    cost = 0,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    pools = { ["danganro_mycustom_jokers"] = true },

    config = {
        extra = {
            chips = 50,
            odds = 5
        }
    },

    loc_txt = {
        name = "Fuyuhiko Kuzuryu",
        text = {
            "{C:chips}+#1#{} Chips for each empty",
            "{C:attention}Joker{} slot",
            "{C:green}#2# in #3#{} chance to {C:attention}transform{}"
        }
    },

    loc_vars = function(self, info_queue, card)
        local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1
        local num, den = SMODS.get_probability_vars(
            card,
            p,
            card.ability.extra.odds,
            "j_danganro_fuyohikokuzuryu"
        )

        return {
            vars = {
                card.ability.extra.chips,
                num,
                den
            }
        }
    end,

    calculate = function (self, card, context)
        local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1

        if context.joker_main then
            local empty_slots = math.max(0, G.jokers.config.card_limit - #G.jokers.cards)

            if empty_slots > 0 then
                return {
                    chips = empty_slots * card.ability.extra.chips
                }
            end
        end

        if context.end_of_round and context.main_eval and not context.blueprint and not context.retrigger_joker and not context.game_over then
            if SMODS.pseudorandom_probability(
                card,
                "fuyohikokuzuryu",
                p,
                card.ability.extra.odds,
                "j_danganro_fuyohikokuzuryu"
            ) then
                G.GAME.joker_buffer = G.GAME.joker_buffer + 1

                G.E_MANAGER:add_event(Event({
                    func = function()
                        danganro_destroy_joker(card)
                        SMODS.add_card({ key = "j_danganro_fuy0hik0kuzuryu" })
                        G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                        return true
                    end
                }))

                return {
                    message = "Transformed!",
                    colour = G.C.GOLD
                }
            end
        end
    end
}
