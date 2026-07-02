SMODS.Joker{
    key = "nekomarunidai",
    atlas = "nekomarunidai",
    pos = {x = 0, y = 0},
    cost = 10,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    pools = { ["danganro_mycustom_jokers"] = true },

    config = {
        extra = {
            repetitions = 1,
            odds = 10
        }
    },

    loc_txt = {
        name = "Nekomaru Nidai",
        text = {
            "Retriggers the leftmost {C:attention}Joker{}",
            "{C:green}#1# in #2#{} chance to be {C:attention}reborn{}",
            "at {C:attention}end of round{}"
        }
    },

    loc_vars = function(self, info_queue, card)
        local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1
        local num, den = SMODS.get_probability_vars(
            card,
            p,
            card.ability.extra.odds,
            "j_danganro_nekomarunidai"
        )

        return {
            vars = {
                num,
                den
            }
        }
    end,

    calculate = function(self, card, context)
        if context.retrigger_joker_check
        and not context.retrigger_joker
        and context.other_card ~= card
        and context.other_card == G.jokers.cards[1] then
            return {
                repetitions = card.ability.extra.repetitions,
                message = localize("k_again_ex"),
                card = card
            }
        end

        if context.end_of_round
        and context.main_eval
        and not context.game_over
        and not context.blueprint
        and not context.retrigger_joker then
            local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1

            if SMODS.pseudorandom_probability(
                card,
                "nekomarunidai",
                p,
                card.ability.extra.odds,
                "j_danganro_nekomarunidai"
            ) then
                G.GAME.joker_buffer = G.GAME.joker_buffer + 1

                G.E_MANAGER:add_event(Event({
                    func = function()
                        danganro_destroy_joker(card)
                        SMODS.add_card({ key = "j_danganro_mechamaru" })
                        G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                        return true
                    end
                }))

                return {
                    message = "Reborn!",
                    colour = G.C.GOLD
                }
            end
        end
    end
}
