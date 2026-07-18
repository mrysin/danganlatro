SMODS.Joker{
    key = "mikantsumiki",
    atlas = "mikantsumiki",
    pos = {x = 0, y = 0},
    cost = 10,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    pools = { ["danganro_mycustom_jokers"] = true },

    loc_txt = {
        name = "Mikan Tsumiki",
        text = {
            "{C:attention}Jokers{} and playing cards",
            "cannot be {C:red}debuffed{}"
        }
    },

    calculate = function(self, card, context)
        if context.debuff_card
        and (
            context.debuff_card.ability.set == "Joker"
            or SMODS.is_playing_card(context.debuff_card)
        ) then
            return {
                prevent_debuff = true
            }
        end
    end
}
