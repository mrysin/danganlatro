SMODS.Joker{
    key = "hajimehinata",
    atlas = "hajimehinata",
    pos = {x = 0, y = 0},
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    pools = { ["danganro_mycustom_jokers"] = true },

    config = {
        extra = {
            plusmult = 4,
            odds = 4
        }
    },

    loc_txt = {
        name = "Hajime Hinata",
        text = {
            "{C:mult}+#1#{} Mult",
            "{C:green}#2# in #3#{} chance to {C:attention}transcend{}",
            "at {C:attention}end of round{}"
        }
    },

    loc_vars = function(self, info_queue, card)
        local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1

        local num, den = SMODS.get_probability_vars(
            card,
            p,
            card.ability.extra.odds,
            "j_danganro_hajimehinata"
        )

        return {
            vars = {
                card.ability.extra.plusmult,
                num,
                den
            }
        }
    end,

    calculate = function(self, card, context)
        local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1


        if context.joker_main then
            return {
                mult = card.ability.extra.plusmult,
            }
        end
        if context.end_of_round and context.main_eval and not context.blueprint and not context.retrigger_joker and not context.game_over then
            if SMODS.pseudorandom_probability(
                card,
                'hajime',
                p,
                card.ability.extra.odds,
                'j_danganro_hajimehinata'
            ) then
                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        danganro_destroy_joker(card)
                        SMODS.add_card({ key = "j_danganro_izurukamakura" })
                        G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                        return true
                    end
                }))

                return {
                    message = "Transcended!",
                    colour = G.C.GOLD
                }
            end
        end
    end
}
