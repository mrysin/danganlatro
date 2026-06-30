
SMODS.Joker{ --Sakura Ogami
    key = "sakuraogami",
    atlas = "sakuraogami",
    config = {
        extra = {
            xmult = 2,
            chance = 1,
            success = 10
        }
    },
    loc_txt = {
        ['name'] = 'Sakura Ogami',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult',
            [2] = '{C:green}#2# in #3#{} chance to {C:red}die{} and {C:attention}generate{} an',
            [3] = '{C:enhanced}Enhanced{}, {C:dark_edition}Editioned{}, and {C:attention}Sealed{}',
            [4] = '{C:attention}Ace{}, {C:attention}Queen{} and {C:attention}Jack{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {x = 0, y = 0},
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,    pools = { ["danganro_danganro_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1

        local num, den = SMODS.get_probability_vars(
            card,
            p,
            card.ability.extra.success,
            'j_danganro_sakuraogami'
        )

        return {
            vars = {
                card.ability.extra.xmult,
                num, 
                den
            }
        }
    end,
    
    calculate = function(self, card, context)
        local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1
        if context.joker_main then
            return {
                Xmult = card.ability.extra.xmult
            }
        end
        if context.end_of_round and context.main_eval and not context.game_over then
            if SMODS.pseudorandom_probability(
                card,
                'sakuraogami',
                p,
                card.ability.extra.success,
                'j_danganro_sakuraogami'
            ) then
                create_random_card("A")
                create_random_card("Q")
                create_random_card("J")
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:start_dissolve()
                        return true
                    end
                }))
                return {
                    message = "Poisoned!",
                    colour = G.C.GREEN
                }
            end
        end
    end 
}

function create_random_card(cardrank)
    local suits = {"Spades", "Hearts", "Clubs", "Diamonds"}

    local enhancements = {
        G.P_CENTERS.m_bonus,
        G.P_CENTERS.m_mult,
        G.P_CENTERS.m_wild,
        G.P_CENTERS.m_glass,
        G.P_CENTERS.m_steel,
        G.P_CENTERS.m_stone,
        G.P_CENTERS.m_gold,
        G.P_CENTERS.m_lucky
    }

    local seals = {"Red", "Blue", "Gold", "Purple"}

    local editions = {
        {foil = true},
        {holo = true},
        {polychrome = true},
        {negative = true}
    }

    local c = SMODS.add_card({
        set = "Base",
        rank = cardrank,
        suit = pseudorandom_element(suits, pseudoseed("suit"))
    })

    c:set_ability(pseudorandom_element(enhancements, pseudoseed("enh")))
    c:set_seal(pseudorandom_element(seals, pseudoseed("seal")))
    c:set_edition(pseudorandom_element(editions, pseudoseed("ace_edition")), true)

    return c
end


