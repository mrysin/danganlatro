SMODS.Joker{
    key = "mechamaru",
    atlas = "nekomarunidairobot",
    pos = {x = 0, y = 0},
    cost = 0,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    pools = { ["danganro_mycustom_jokers"] = true },

    config = {
        extra = {
            repetitions = 1
        }
    },

    loc_txt = {
        name = "Mechamaru",
        text = {
            "Retriggers the leftmost and",
            "rightmost {C:attention}Jokers{}"
        }
    },

    in_pool = function(self, args)
        return false
    end,

    calculate = function(self, card, context)
        if context.retrigger_joker_check
        and not context.retrigger_joker
        and context.other_card ~= card then
            if context.other_card == G.jokers.cards[1]
            or context.other_card == G.jokers.cards[#G.jokers.cards] then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = localize("k_again_ex"),
                    card = card
                }
            end
        end
    end
}
