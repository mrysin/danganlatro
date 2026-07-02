SMODS.Joker{
    key = "nagitokomaeda",
    atlas = "nagitokomaeda",
    pos = {x = 0, y = 0},
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    pools = { ["danganro_mycustom_jokers"] = true },

    config = {
        extra = {
            mult = 0,
            gain = 0.5
        }
    },

    loc_txt = {
        name = "Nagito Komaeda",
        text = {
            "Gains {C:mult}+#1#{} Mult whenever",
            "another {C:attention}Joker{} triggers",
            "{C:inactive}(Currently {C:mult}+#2#{} {C:inactive}Mult){}"
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.gain,
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.post_trigger
        and context.other_card ~= card
        and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.gain

            return {
                message = localize("k_upgrade_ex"),
                colour = G.C.MULT
            }
        end

        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}
