SMODS.Joker{
    key = "byakuyatogam1",
    atlas = "byakuyatogam1",
    pos = {x = 0, y = 0},
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    pools = { ["danganro_mycustom_jokers"] = true },

    config = {
        extra = {
            target_id = nil
        }
    },

    loc_txt = {
        name = "Byakuya Togami (1)",
        text = {
            "Copies ability of {C:attention}Joker{} to the right",
            "Locks onto that Joker when first triggered",
            "{C:inactive}(Target cannot be changed){}"
        }
    },

    calculate = function(self, card, context)
        if not card.ability.extra.target_id then
            for i, joker in ipairs(G.jokers.cards) do
                if joker == card and G.jokers.cards[i + 1] then
                    card.ability.extra.target_id = G.jokers.cards[i + 1].sort_id
                    break
                end
            end
        end

        if card.ability.extra.target_id then
            for _, joker in ipairs(G.jokers.cards) do
                if joker.sort_id == card.ability.extra.target_id then
                    return SMODS.blueprint_effect(card, joker, context)
                end
            end
        end
    end
}
