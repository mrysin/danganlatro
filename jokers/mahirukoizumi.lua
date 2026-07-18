SMODS.Joker{
    key = "mahirukoizumi",
    atlas = "mahirukoizumi",
    pos = {x = 0, y = 0},
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    pools = { ["danganro_mycustom_jokers"] = true },

    loc_txt = {
        name = "Mahiru Koizumi",
        text = {
            "Scored {C:attention}face cards{} gain a random",
            "{C:enhanced}Enhancement{} and {C:attention}Seal{}"
        }
    },

    calculate = function(self, card, context)
        if context.before and not context.retrigger_joker then
            local enhancements = {
                G.P_CENTERS.m_bonus,
                G.P_CENTERS.m_mult,
                G.P_CENTERS.m_wild,
                G.P_CENTERS.m_glass,
                G.P_CENTERS.m_steel,
                G.P_CENTERS.m_stone,
                G.P_CENTERS.m_gold,
                G.P_CENTERS.m_lucky
            }
            local seals = {"Red", "Blue", "Gold", "Purple"}
            local changed = false

            for _, playing_card in ipairs(context.scoring_hand) do
                if playing_card:is_face()
                and not next(SMODS.get_enhancements(playing_card))
                and not playing_card.seal then
                    playing_card:set_ability(
                        pseudorandom_element(enhancements, pseudoseed("mahiru_enhancement"))
                    )
                    playing_card:set_seal(
                        pseudorandom_element(seals, pseudoseed("mahiru_seal"))
                    )
                    changed = true
                end
            end

            if changed then
                return {
                    message = "Developed!",
                    colour = G.C.FILTER
                }
            end
        end
    end
}
