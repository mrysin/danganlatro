SMODS.Joker{
    key = "akaneowari",
    atlas = "akaneowari",
    pos = {x = 0, y = 0},
    blueprint_compat = true,
    soulable = false,

    cost = 8,
    rarity = 2,
    unlocked = true,
    discovered = true,
    pools = { ["danganro_mycustom_jokers"] = true },    

    config = {
        extra = {
            chips = 500,
            decrement = 100
        }
    },

    loc_txt = {
        name = "Akane Owari",
        text = {"{C:chips}+#1#{} chips,", "loses {C:chips}#2#{} every round"}
    },

    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.decrement
            }
        }
    end,

    calculate = function (self, card, context) 
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
        if context.end_of_round and context.main_eval and not context.game_over then
            card.ability.extra.chips = math.max(0, card.ability.extra.chips - 100)

            if card.ability.extra.chips <= 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:start_dissolve()
                        return true
                    end
                }))

                return {
                    message = "idk",
                    color = G.C.GOLD
                }
            end

            return {
                message = "-100",
                colour = G.C.CHIPS
            }
        end
    end
}

