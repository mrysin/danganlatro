SMODS.Joker{
    key = "izurukamakura",
    atlas = "izurukamakura",
    pos = {x = 0, y = 0},
    cost = 8,
    rarity = 3,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pools = { ["danganro_mycustom_jokers"] = true },

    config = {
        extra = {
            odds = 4
        }
    },

    loc_txt = {
        name = "Izuru Kamukura",
        text = {
            "{C:green}#1# in #2#{} chance to",
            "{C:attention}retrigger{} each other {C:attention}Joker{}"
        }
    },

    loc_vars = function(self, info_queue, card)
        local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1

        local num, den = SMODS.get_probability_vars(
            card,
            p,
            card.ability.extra.odds,
            "j_danganro_izurukamakura"
        )

        return {
            vars = {
                num,
                den
            }
        }
    end,

    in_pool = function(self, args)
        return false
    end,

    calculate = function(self, card, context)
        if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= card then
            local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1

            if SMODS.pseudorandom_probability(
                card,
                "izurukamakura",
                p,
                card.ability.extra.odds,
                "j_danganro_izurukamakura"
            ) then
                return {
                    repetitions = 1,
                    message = localize("k_again_ex"),
                    card = card
                }
            end
        end
    end
}
