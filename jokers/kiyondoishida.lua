SMODS.Joker{
    key = "kiyondoishida",
    config = {
        extra = {
            chips = 200,
            success = 4,
        }
    },

    loc_txt = {
        name = "Kiyondo Ishida",
        text = {
            "{C:blue}+#1#{} Chips",
            "{C:green}#2# in #3#{} chance to get {C:red}hammered{}",
            "at the {C:attention}end of round{}"
        },
        unlock = {
            "Unlocked by default."
        }
    },

    pos = {x = 0, y = 0},
    display_size = {w = 71, h = 95},

    cost = 5,
    rarity = 2,

    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,

    unlocked = true,
    discovered = true,

    atlas = "kiyondoishida",
    pools = {["danganro_mycustom_jokers"] = true},

    loc_vars = function(self, info_queue, card)
        local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1

        local num, den = SMODS.get_probability_vars(
            card,
            p,
            card.ability.extra.success,
            'j_danganro_kiyondoishida'
        )

        return {
            vars = {
                card.ability.extra.chips,
                num, 
                den
            }
        }
    end,

    calculate = function(self, card, context)

        local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1

        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end

        if context.end_of_round and context.main_eval then
            if SMODS.pseudorandom_probability(
                card,
                'kiyondoishida',
                p,
                card.ability.extra.success,
                'j_danganro_kiyondoishida'
            ) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:start_dissolve()
                        return true
                    end
                }))

                return {
                    message = "Hammered!",
                    colour = G.C.RED
                }
            end
        end
    end
}

