SMODS.Back{
    key = "monokumadeck",
    atlas = "monokumadeck",
    pos = {x = 0, y = 0},
    config = {
        joker_slot = 3,
        extra = {
            chance = 5
        }
    },
    unlocked = true,
    discovered = true,

    loc_txt = {
        name = "Monokuma Deck",
        text = {"{C:dark_edition}+3 Joker Slots{}", "{C:green}1 in #1#{} chance to {C:red}destroy{}", "{C:attention}2 Jokers{} after every {C:}boss blind{}", "{C:legendary}legendaries{} will not get {C:red}destroyed{}"}
    },

    loc_vars = function(self, info_queue, card)
        local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1

        local num, den = SMODS.get_probability_vars(
            self,
            p,
            self.config.extra.chance,
            'd_danganro_monokumadeck'
        )

        return {
            vars = {
                num,
                den
            }
        }
    end,

    calculate = function(self, back, context)
        local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1

        if context.blind_defeated
            and context.blind
            and context.blind.boss
            and SMODS.pseudorandom_probability(
                self,
                "monokumadeck",
                p,
                self.config.extra.chance,
                "d_danganro_monokumadeck"
            ) then
            local destroyable = {}
            for _, joker in ipairs(G.jokers.cards) do
                if joker.config.center.rarity ~= 4
                    and not SMODS.is_eternal(joker)
                    and not joker.getting_sliced then
                    table.insert(destroyable, joker)
                end
            end

            for _ = 1, math.min(2, #destroyable) do
                local victim = pseudorandom_element(destroyable, pseudoseed("monokumadeck_victim"))
                for i, joker in ipairs(destroyable) do
                    if joker == victim then
                        table.remove(destroyable, i)
                        break
                    end
                end

                victim.getting_sliced = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        danganro_destroy_joker(victim, {G.C.RED})
                        return true
                    end
                }))
            end

            return {
                message = "Punishment!",
                colour = G.C.RED
            }
        end
    end
}
