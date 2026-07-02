
SMODS.Joker{ --Sayaka Maizono
    key = "sayakamaizono",
    atlas = "sayakamaizono",
    config = {
        extra = {
            shop_slots_increase = '1',
            booster_slots_increase = '1',
            discount_amount = '10'
        }
    },
    loc_txt = {
        ['name'] = 'Sayaka Maizono',
        ['text'] = {
            [1] = '{C:attention}+1{} card slot and {C:attention}+1{} Booster slot',
            [2] = 'in the {C:attention}shop{}',
            [3] = 'All shop items are {C:money}10%{} cheaper'
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
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,    pools = { ["danganro_danganro_jokers"] = true },
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        change_shop_size(1)
        SMODS.change_booster_limit(1)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.I.CARD) do
                if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        change_shop_size(-1)
        SMODS.change_booster_limit(-1)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.I.CARD) do
                if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
    end
}


local card_set_cost_ref = Card.set_cost
function Card:set_cost()
    card_set_cost_ref(self)
    
    if next(SMODS.find_card("j_danganro_sayakamaizono")) then
        if (self.ability.set == 'Joker' or self.ability.set == 'Tarot' or self.ability.set == 'Planet' or self.ability.set == 'Spectral' or self.ability.set == 'Enhanced' or self.ability.set == 'Booster' or self.ability.set == 'Voucher') then
            self.cost = math.max(0, math.floor(self.cost * (1 - (10) / 100)))
        end
    end
    
    self.sell_cost = math.max(1, math.floor(self.cost / 2)) + (self.ability.extra_value or 0)
    self.sell_cost_label = self.facing == 'back' and '?' or self.sell_cost
end


