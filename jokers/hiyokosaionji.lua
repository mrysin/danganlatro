SMODS.Joker{
    key = "hiyokosaionji",
    atlas = "hiyokosaionji",
    pos = {x = 0, y = 0},
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    pools = { ["danganro_mycustom_jokers"] = true },

    config = {
        extra = {
            mult = 7
        }
    },

    loc_txt = {
        name = "Hiyoko Saionji",
        text = {
            "{C:mult}+#1#{} Mult for each",
            "empty {C:attention}Joker{} slot"
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local empty_slots = math.max(0, G.jokers.config.card_limit - #G.jokers.cards)

            if empty_slots > 0 then
                return {
                    mult = card.ability.extra.mult * empty_slots
                }
            end
        end
    end
}
