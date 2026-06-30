SMODS.Joker{ --Junk0 3nosh1ma
    key = "junk03nosh1ma",

    config = {
        extra = {
            xmult = 3,
            odds = 2
        }
    },

    loc_txt = {
        name = "Junk0 3nosh1ma",
        text = {
            "{X:red,C:white}X3{} Mult",
            "{C:green}#1# in #2#{} chance to {C:red}die{}"
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

    atlas = "junk03nosh1ma",

    pools = {
        ["danganro_mycustom_jokers"] = true
    },

    loc_vars = function(self, info_queue, card)

        local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1

        local num, den = SMODS.get_probability_vars(
            card,
            p,
            card.ability.extra.odds,
            'j_danganro_junk03nosh1ma'
        )

        return {
            vars = { num, den }
        }
    end,

    calculate = function(self, card, context)

        local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1

        if context.joker_main then
            return {
                Xmult = card.ability.extra.xmult
            }
        end

        if context.end_of_round
        and context.main_eval
        and not context.game_over
        and not card.ability.eternal then

            if SMODS.pseudorandom_probability(
                card,
                'junk03nosh1ma',
                p,
                card.ability.extra.odds,
                'j_danganro_junk03nosh1ma'
            ) then

                G.GAME.pool_flags.danganro_Junko = true

                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        card:start_dissolve({G.C.RED})
                        return true
                    end
                }))

                return {
                    message = "Punished!",
                    colour = G.C.RED
                }
            end
        end
    end
}

