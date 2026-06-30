SMODS.Joker{ --Yasuhiro Hagakure
    key = "yasuhirohagakure",
    atlas = "yasuhirohagakure",
    config = {
        extra = {}
    },
    loc_txt = {
        ['name'] = 'Yasuhiro Hagakure',
        ['text'] = {
            [1] = '{C:attention}Triples{} all {C:green}probabilities{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {x = 0, y = 0},
    display_size = {
        w = 71,
        h = 95
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,    pools = { ["danganro_danganro_jokers"] = true },

    calculate = function(self, card, context)
        if context.fix_probability then
            return {
                numerator = context.numerator * 3,
                denominator = context.denominator
            }
        end
    end
}


