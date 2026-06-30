
SMODS.Joker{ --Mukuro Ikusaba
    key = "mukuroikusaba",
    atlas = "mukuroikusaba",
    config = {
        extra = {
            mult = 20,
            chips = 150
        }
    },
    loc_txt = {
        ['name'] = 'Mukuro Ikusaba',
        ['text'] = {
            [1] = '{C:red}+20{} Mult',
            [2] = '{C:blue}+150{} Chips'
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
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,    pools = { ["danganro_mycustom_jokers"] = true },
    loc_vars = function (self, info_queue, card) 
        return {vars = {card.ability.extra.mult, card.ability.extra.chips}}
    end,
    calculate = function (self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips
            }
        end
    end
}


