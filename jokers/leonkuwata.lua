
SMODS.Joker{ --Leon Kuwata
    key = "leonkuwata",
    atlas = "leonkuwata",
    config = {
        extra = {
            repetitions = 15,
            mult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Leon Kuwata',
        ['text'] = {
            [1] = '{C:mult}+1{} Mult',
            [2] = '{C:attention}Again{}, and {C:attention}again{},',
            [3] = 'and {C:attention}again{}, and {C:attention}again{}, and {C:attention}again{},',
            [4] = 'and {C:attention}again{}, and {C:attention}again{}, and {C:attention}again{},',
            [5] = 'and {C:attention}again{}, and {C:attention}again{}, and {C:attention}again{},',
            [6] = 'and {C:attention}again{}, and {C:attention}again{}, and {C:attention}again{}'
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
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,    pools = { ["danganro_mycustom_jokers"] = true },

    calculate = function(self, card, context)
        if context.joker_main then
            local effects = {}

            for i = 1, card.ability.extra.repetitions do
                table.insert(effects, {
                    mult = card.ability.extra.mult
                })
            end

            return SMODS.merge_effects(effects)
        end
    end
}


