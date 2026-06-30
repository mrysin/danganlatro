
SMODS.Joker{ --Celestia Ludenberg
    key = "celestialudenberg",
    atlas = "celestialudenberg",
    config = {
        extra = {
            multmin = 5,
            multmax = 10,
            moneymin = 2,
            moneymax = 5,
            chipsmin = 40,
            chipsmax = 60
        }
    },
    loc_txt = {
        ['name'] = 'Celestia Ludenberg',
        ['text'] = {
            [1] = "Each scored {C:attention}card{} gives either:",
            [2] = "{C:mult}+#1#-#2#{} Mult, {C:money}$#3#-#4#{}, or {C:chips}+#5#-#6#{} chips"
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
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,    pools = { ["danganro_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.multmin,
                card.ability.extra.multmax,
                card.ability.extra.moneymin,
                card.ability.extra.moneymax,
                card.ability.extra.chipsmin,
                card.ability.extra.chipsmax
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then

            local roll = pseudorandom(pseudoseed('celestia'))
            local choice

            if roll < 1/3 then
                choice = 1
            elseif roll < 2/3 then
                choice = 2
            else
                choice = 3
            end

            if choice == 1 then
                local mult = pseudorandom(
                    pseudoseed('celestia_mult'),
                    card.ability.extra.multmin,
                    card.ability.extra.multmax
                )

                return {
                    mult = mult,
                    colour = G.C.MULT
                }

            elseif choice == 2 then
                local money = pseudorandom(
                    pseudoseed('celestia_money'),
                    card.ability.extra.moneymin,
                    card.ability.extra.moneymax
                )

                ease_dollars(money)

                return {
                    message = "$" .. money,
                    colour = G.C.MONEY
                }

            else
                local chips = pseudorandom(
                    pseudoseed('celestia_chips'),
                    card.ability.extra.chipsmin,
                    card.ability.extra.chipsmax
                )

                return {
                    chips = chips,
                    colour = G.C.CHIPS
                }
            end
        end
    end
}


