
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
            [1] = 'Copies the abilities of adjacent',
            [2] = '{C:attention}Jokers{}',
            [3] = '{C:red}Destroys{} a random {C:attention}Joker{}',
            [4] = 'at {C:attention}end of round{}'
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
        local effects = {}
        local my_pos = nil

        for i, joker in ipairs(G.jokers.cards) do
            if joker == card then
                my_pos = i
                break
            end
        end

        local function add_copy_effect(target)
            if target and target ~= card then
                local ret = SMODS.blueprint_effect(card, target, context)
                if ret then
                    table.insert(effects, ret)
                end
            end
        end

        if my_pos then
            add_copy_effect(G.jokers.cards[my_pos - 1])
            add_copy_effect(G.jokers.cards[my_pos + 1])
        end


        if context.end_of_round and context.main_eval and not context.game_over and not context.retrigger_joker then
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
                        danganro_destroy_joker(randomjoker, {G.C.RED})
                        return true
                    end
                }))

                table.insert(effects, {
                    message = localize{
                        type = "name_text",
                        key = randomjoker.config.center.key
                    } .. " Executed!",
                    colour = G.C.RED
                })
            end
        end

        if #effects > 0 then
            return SMODS.merge_effects(effects)
        end
    end
}


