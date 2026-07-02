SMODS.Joker{
    key = "fuy0hik0kuzuryu",
    atlas = "fuyohikokuzuryueyepatch",
    pos = {x = 0, y = 0},
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    pools = { ["danganro_mycustom_jokers"] = true },

    config = {
        extra = {
            chips = 30
        }
    },

    loc_txt = {
        name = "Fuy0hik0 Kuzuryu",
        text = {
            "{C:chips}+#1#{} Chips for each",
            "occupied {C:attention}Joker{} slot"
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips
            }
        }
    end,

    in_pool = function(self, args)
        return false
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local jokers = #G.jokers.cards

            return {
                chips = jokers * card.ability.extra.chips
            }
        end
    end
}
