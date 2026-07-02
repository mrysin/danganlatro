SMODS.Joker{
    key = "sonianevermind",
    atlas = "sonianevermind",
    pos = {x = 0, y = 0},
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    pools = { ["danganro_mycustom_jokers"] = true },

    config = {
        extra = {
            xmult = 1,
            gain = 0.2
        }
    },

    loc_txt = {
        name = "Sonia Nevermind",
        text = {
            "Gains {X:red,C:white}X#1#{} Mult whenever",
            "a {C:attention}Joker{} or playing card is destroyed",
            "{C:inactive}(Currently {X:red,C:white}X#2#{} {C:inactive}Mult){}"
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.gain,
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.remove_playing_cards then
            for _, c in ipairs(context.removed) do
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain
            end
        end
        if context.destroying_cards then
            for _, c in ipairs(context.destroyed) do
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.xmult
            }
        end
    end
}
