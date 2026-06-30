
SMODS.Joker{ --Junko Enoshima
    key = "junkoenoshima",
    atlas = "junkoenoshima",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Junko Enoshima',
        ['text'] = {
            [1] = 'Copies the ability of the {C:attention}Joker{}',
            [2] = 'to the {C:attention}right{} and {C:attention}left{}.',
            [3] = '{C:red}Destroys{} a random {C:attention}Joker{}',
            [4] = 'at the {C:attention}end of round{}'
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
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,    pools = { ["danganro_mycustom_jokers"] = true },

    calculate = function(self, card, context)
        
        local my_pos = nil

        for i, joker in ipairs(G.jokers.cards) do
            if joker == card then
                my_pos = i
                break
            end
        end

        local function copy_joker(target)
            if target and target ~= card then
                local ret = SMODS.blueprint_effect(card, target, context)
                if ret then
                    SMODS.calculate_effect(ret, card)
                end
            end
        end

        if my_pos then
            copy_joker(G.jokers.cards[my_pos - 1])
            copy_joker(G.jokers.cards[my_pos + 1])
        end


        if context.end_of_round and context.main_eval and not context.game_over then
            local destroyable = {}

            for _, joker in ipairs(G.jokers.cards) do
                if joker ~= card
                and not SMODS.is_eternal(joker)
                and not joker.getting_sliced then
                    table.insert(destroyable, joker)
                end
            end

            if #destroyable > 0 then
                local randomjoker =
                    pseudorandom_element(destroyable, pseudoseed("junko"))

                randomjoker.getting_sliced = true

                G.E_MANAGER:add_event(Event({
                    func = function()
                        randomjoker:start_dissolve({G.C.RED})
                        return true
                    end
                }))

                return {
                    message = localize{
                        type = "name_text",
                        key = randomjoker.config.center.key
                    } .. " Executed!",
                    colour = G.C.RED
                }
            end
        end
    end
}


