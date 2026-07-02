local function contains(array, value)
    for _, v in ipairs(array) do
        if v == value then
            return true
        end
    end
    return false
end

SMODS.Joker{
    key = "chiakinanami",
    atlas = "chiakinanami",
    pos = {x = 0, y = 0},
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pools = { ["danganro_mycustom_jokers"] = true },

    config = {
        extra = {
            gain = 0.3,
            Xmult = 1,
            enhancements = {},
            editions = {},
            seals = {}
        }
    },

    loc_txt = {
        name = "Chiaki Nanami",
        text = {
            "Gain {X:red,C:white}X#1#{} Mult when a {C:attention}unique{}",
            "{C:enhanced}Enhancement{}, {C:dark_edition}Edition{}, or {C:attention}Seal{}",
            "is played, resets at {C:attention}end of round{}",
            "(Currently {X:red,C:white}X#2#{} Mult)"
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.gain,
                card.ability.extra.Xmult
            }
        }
    end,

    cost = 7,
    rarity = 3,
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if context.joker_main then
            if not context.blueprint and not context.retrigger_joker then
                for _, c in ipairs(context.scoring_hand) do
                    local enhancement = c.config.center.key
                    local edition = c.edition and c.edition.key
                    local seal = c.seal

                    if enhancement and enhancement ~= "c_base" and not contains(card.ability.extra.enhancements, enhancement) then
                        card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.gain
                        table.insert(card.ability.extra.enhancements, enhancement)
                    end

                    if edition and not contains(card.ability.extra.editions, edition) then
                        card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.gain
                        table.insert(card.ability.extra.editions, edition)
                    end

                    if seal and not contains(card.ability.extra.seals, seal) then
                        card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.gain
                        table.insert(card.ability.extra.seals, seal)
                    end
                end
            end

            return {
                xmult = card.ability.extra.Xmult
            }
        end

        if context.end_of_round and context.main_eval and not context.blueprint and not context.retrigger_joker then
            card.ability.extra.enhancements = {}
            card.ability.extra.editions = {}
            card.ability.extra.seals = {}
            card.ability.extra.Xmult = 1
            return {
                message = localize("k_reset")
            }
        end
    end
}
