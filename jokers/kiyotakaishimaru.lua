SMODS.Joker{
    key = "kiyotakaishimaru",
    config = {
        extra = {
            chips = 10
        }
    },

    loc_txt = {
        name = "Kiyotaka Ishimaru",
        text = {
            "{C:blue}+#1#{} Chips, increases by",
            "{C:blue}+30{} every round"
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
                card.ability.extra.chips
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end

        if context.end_of_round and context.main_eval then
            card.ability.extra.chips = card.ability.extra.chips + 20

            return {
                message = "Stronger!",
                colour = G.C.CHIPS
            }
        end
    end
}

