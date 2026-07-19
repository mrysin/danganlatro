SMODS.Back{
    key = "hopedeck",
    atlas = "hopedeck",
    pos = {x = 0, y = 0},
    config = {
        joker_slot = -3
    },
    unlocked = true,
    discovered = true,

    loc_txt = {
        name = "Hope Deck",
        text = {"{C:dark_edition}#1# Joker Slots{}", "{C:attention}+1{} before every {C:gold}Big Blind{}"}
    },

    loc_vars = function(self, info_queue, card)
        local value = self.config.joker_slot
        local msg = value > 0 and ("+" .. value) or tostring(value)

        return {
            vars = {
                msg
            }
        }
    end,

    calculate = function(self, back, context)
      if context.setting_blind
        and G.GAME.blind_on_deck == "Big" then
            G.jokers.config.card_limit =
                G.jokers.config.card_limit + 1
      end
    end
}
