SMODS.Back{
    key = "despairdeck",
    atlas = "despairdeck",
    pos = {x = 0, y = 0},
    unlocked = true,
    discovered = true,

    config = {
        joker_slot = 2,
        extra = {
            chance = 4
        }
    },

    loc_txt = {
        name = "Despair Deck",
        text = {"{C:dark_edition}+2 Joker Slots{}", "{C:green}1 in #1#{} chance to {C:red}destroy{}", "a {C:attention}Joker{} at the {C:attention}end of round{}", "{C:legendary}legendaries{} will not get {C:red}destroyed{}"}
    },

    loc_vars = function(self, info_queue, card)
        local p = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1

        local num, den = SMODS.get_probability_vars(
            self,
            p,
            self.config.extra.chance,
            'd_danganro_despairdeck'
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

        if context.end_of_round and context.main_eval and not context.game_over
            and SMODS.pseudorandom_probability(
                self,
                "despairdeck",
                p,
                self.config.extra.chance,
                "d_danganro_despairdeck"
            ) then
            local destroyable = {}
            for _, joker in ipairs(G.jokers.cards) do
                if joker.config.center.rarity ~= 4
                    and not SMODS.is_eternal(joker)
                    and not joker.getting_sliced then
                    table.insert(destroyable, joker)
                end
            end

            local victim = pseudorandom_element(destroyable, pseudoseed("despairdeck_victim"))
            if victim then
                victim.getting_sliced = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        danganro_destroy_joker(victim, {G.C.RED})
                        return true
                    end
                }))

                return {
                    message = "Executed!",
                    colour = G.C.RED
                }
            end
        end
    end
}
