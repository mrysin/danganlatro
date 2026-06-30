
SMODS.Joker{ --Aoi Asahina
    key = "aoiasahina",
    atlas = "aoiasahina",
    config = {
        extra = {
            Aoi = 100
        }
    },
    loc_txt = {
        ['name'] = 'Aoi Asahina',
        ['text'] = {
            [1] = '{C:mult}+#1#{} Mult, reduces',
            [2] = 'by {C:mult}10{} every round'
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
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,    pools = { ["danganro_mycustom_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Aoi}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.Aoi
            }
        end
        if context.end_of_round and context.main_eval then
            card.ability.extra.Aoi = math.max(0, card.ability.extra.Aoi - 10)

            if card.ability.extra.Aoi <= 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:start_dissolve()
                        return true
                    end
                }))

                return {
                    message = "Cya!",
                    colour = G.C.GOLD
                }
            end

            return {
                message = "-10",
                colour = G.C.MULT
            }
        end
    end
}


