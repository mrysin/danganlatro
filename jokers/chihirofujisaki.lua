SMODS.Joker{ --Chihiro Fujisaki
    key = "chihirofujisaki",
    atlas = "chihirofujisaki",

    config = {
        extra = {
            xmult0 = 2,
            chance = 4
        }
    },

    loc_txt = {
        ['name'] = 'Chihiro Fujisaki',
        ['text'] = {
            [1] = '{X:red,C:white}X#3#{} Mult',
            [2] = '{C:green}#1# in #2#{} chance to get {C:red}whacked{}'
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
        ["danganro_mycustom_jokers"] = true
    },

    loc_vars = function(self, info_queue, card)
        local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1

        local num, den = SMODS.get_probability_vars(
            card,
            p,
            card.ability.extra.chance,
            'j_danganro_chihirofujisaki'
        )

        return {
            vars = {
                num,
                den,
                card.ability.extra.xmult0
            }
        }
    end,

    calculate = function(self, card, context)

        local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1

        if context.joker_main then
            return {
                Xmult = card.ability.extra.xmult0
            }
        end

        if context.end_of_round
        and context.main_eval
        and not context.blueprint
        and not context.retrigger_joker
        and not context.game_over then

            if SMODS.pseudorandom_probability(
                card,
                'chihirofujisaki',
                p,
                card.ability.extra.chance,
                'j_danganro_chihirofujisaki'
            ) then

                G.E_MANAGER:add_event(Event({
                    func = function()
                        danganro_destroy_joker(card)
                        return true
                    end
                }))

                

                return {
                    message = "Whacked!",
                    colour = G.C.RED
                }
            end
        end
    end
}


