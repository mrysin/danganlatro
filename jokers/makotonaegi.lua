
SMODS.Joker{ --Makoto Naegi
    key = "makotonaegi",
    atlas = "makotonaegi",
    config = {
        extra = {
            success = 1,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Makoto Naegi',
        ['text'] = {
            [1] = 'Any scored {C:attention}card{} turns into a {C:attention}Lucky Card{}',
            [2] = 'Each {C:attention}card{} also has a {C:green}#1# in #2#{} chance',
            [3] = 'to get a {C:attention}Red Seal{} too'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },

    loc_vars = function (self, info_queue, card)
        local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1

        local num, den = SMODS.get_probability_vars(
            card,
            p,
            card.ability.extra.odds,
            'j_danganro_makotonaegi'
        )

        return {
            vars = {
                num,
                den
            }
        }
    end,

    pos = {x = 0, y = 0},
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,    pools = { ["danganro_danganro_jokers"] = true },
    
    calculate = function(self, card, context)
        local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1
        if context.before then
            for _, c in ipairs(context.scoring_hand) do
                c:set_ability(G.P_CENTERS.m_lucky)
                if SMODS.pseudorandom_probability(
                    card,
                    'makotonaegi',
                    p,
                    card.ability.extra.odds,
                    'j_danganro_makotonaegi'
                ) then
                    c:set_seal("Red")
                end
            end
        end
    end
}


