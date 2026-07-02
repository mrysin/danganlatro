SMODS.Joker{
    key = "pekopekoyama",
    atlas = "pekopekoyama",
    pos = {x = 0, y = 0},
    cost = 0,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    pools = { ["danganro_mycustom_jokers"] = true },

    config = {
        extra = {
            xmult = 1.5,
            fuyuhiko_xmult = 3
        }
    },

    loc_txt = {
        name = "Peko Pekoyama",
        text = {
            "{X:red,C:white}X#1#{} Mult",
            "{X:red,C:white}X#2#{} Mult instead if either",
            "{C:attention}Fuyuhiko Kuzuryu{} is present"
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.fuyuhiko_xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local fuyuhiko_present =
                next(SMODS.find_card("j_danganro_fuyohikokuzuryu"))
                or next(SMODS.find_card("j_danganro_fuy0hik0kuzuryu"))

            return {
                xmult = fuyuhiko_present
                    and card.ability.extra.fuyuhiko_xmult
                    or card.ability.extra.xmult
            }
        end
    end
}
