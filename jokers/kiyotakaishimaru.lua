SMODS.Joker{
    key = "kiyotakaishimaru",
    config = {
        extra = {
            chips = 10,
            gain = 20
        }
    },

    loc_txt = {
        name = "Kiyotaka Ishimaru",
        text = {
            "{C:chips}+#1#{} Chips",
            "Gains {C:chips}+#2#{} Chips at {C:attention}end of round{}"
        },
        unlock = {
            "Unlocked by default."
        }
    },

    pos = {x = 0, y = 0},
    display_size = {w = 71, h = 95},

    cost = 4,
    rarity = 2,

    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    unlocked = true,
    discovered = true,

    atlas = "kiyotakaishimaru",
    pools = {["danganro_mycustom_jokers"] = true},

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.gain
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end

        if context.end_of_round and context.main_eval and not context.blueprint and not context.retrigger_joker and not context.game_over then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.gain

            return {
                message = "Stronger!",
                colour = G.C.CHIPS
            }
        end
    end
}

