SMODS.Joker{
    key = "genocidejack",
    atlas = "genocidejack",

    config = {
        extra = {
            repetitions = 3
        }
    },

    loc_txt = {
        name = 'Genocide Jack',
        text = {
            'Retrigger each played or held',
            '{C:attention}Jack{} {C:attention}#1#{} additional times'
        }
    },

    pos = {x = 0, y = 0},
    display_size = { w = 71, h = 95 },

    cost = 20,
    rarity = 4,

    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    pools = {
        ["danganro_danganro_jokers"] = true
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.repetitions }
        }
    end,

    in_pool = function(self, args)
        return false
    end,

    calculate = function(self, card, context)

        if context.repetition
        and (context.cardarea == G.play or context.cardarea == G.hand) then

            local c = context.other_card

            if c and c:get_id() == 11 then
                return {
                    repetitions = card.ability.extra.repetitions,
                    card = card,
                    message = "Again!"
                }
            end
        end
    end
}


