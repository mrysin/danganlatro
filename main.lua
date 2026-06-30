SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "placeholder",
    path = "placeholder.png",
    px = 71,
    py = 95
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end
-- this function is used to load everything within a folder.-- Jokerforge doesnt use it because it doesnt make loading order easy
local function load_folder(path)
    local files = NFS.getDirectoryItemsInfo(mod_path .. "/" .. path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file(path .. file_name))()
        end
    end
end
-- load the jokers
if true then
    assert(SMODS.load_file("jokers/byakuyatogami.lua"))()
    assert(SMODS.load_file("jokers/aoiasahina.lua"))()
    assert(SMODS.load_file("jokers/celestialudenberg.lua"))()
    assert(SMODS.load_file("jokers/chihirofujisaki.lua"))()
    assert(SMODS.load_file("jokers/byakuyatogamievolved.lua"))()
    assert(SMODS.load_file("jokers/alterego.lua"))()
    assert(SMODS.load_file("jokers/hifumiyamada.lua"))()
    assert(SMODS.load_file("jokers/junk03nosh1ma.lua"))()
    assert(SMODS.load_file("jokers/mukuroikusaba.lua"))()
    assert(SMODS.load_file("jokers/junkoenoshima.lua"))()
    assert(SMODS.load_file("jokers/kiyotakaishimaru.lua"))()
    assert(SMODS.load_file("jokers/kiyondoishida.lua"))()
    assert(SMODS.load_file("jokers/mondoowada.lua"))()
    assert(SMODS.load_file("jokers/leonkuwata.lua"))()
    assert(SMODS.load_file("jokers/kyokokirigiri.lua"))()
    assert(SMODS.load_file("jokers/sakuraogami.lua"))()
    assert(SMODS.load_file("jokers/sayakamaizono.lua"))()
    assert(SMODS.load_file("jokers/tokofukawa.lua"))()
    assert(SMODS.load_file("jokers/genocidejack.lua"))()
    assert(SMODS.load_file("jokers/yasuhirohagakure.lua"))()
    assert(SMODS.load_file("jokers/champ.lua"))()
    assert(SMODS.load_file("jokers/sand.lua"))()
    assert(SMODS.load_file("jokers/jump.lua"))()
    assert(SMODS.load_file("jokers/magaz.lua"))()
    assert(SMODS.load_file("jokers/gundhamtanaka.lua"))()
    assert(SMODS.load_file("jokers/makotonaegi.lua"))()
    assert(SMODS.load_file("jokers/akaneowari.lua"))()
    assert(SMODS.load_file("atlases.lua"))()
end
function SMODS.current_mod.reset_game_globals(run_start)
    local jokerPool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Joker' then
            if (not v.mod) then
                G.GAME.banned_keys[k] = true
            end
        end
    end
end

SMODS.ObjectType({
    key = "danganro_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "danganro_mycustom_jokers",
    cards = {
        ["j_danganro_byakuyatogami"] = true,
        ["j_danganro_aoiasahina"] = true,
        ["j_danganro_celestialudenberg"] = true,
        ["j_danganro_chihirofujisaki"] = true,
        ["j_danganro_byakuyatogamievolved"] = true,
        ["j_danganro_alterego"] = true,
        ["j_danganro_hifumiyamada"] = true,
        ["j_danganro_junk03nosh1ma"] = true,
        ["j_danganro_mukuroikusaba"] = true,
        ["j_danganro_junkoenoshima"] = true,
        ["j_danganro_kiyotakaishimaru"] = true,
        ["j_danganro_kiyondoishida"] = true,
        ["j_danganro_mondoowada"] = true,
        ["j_danganro_leonkuwata"] = true,
        ["j_danganro_kyokokirigiri"] = true
    },
})

SMODS.ObjectType({
    key = "danganro_danganro_jokers",
    cards = {
        ["j_danganro_sakuraogami"] = true,
        ["j_danganro_sayakamaizono"] = true,
        ["j_danganro_tokofukawa"] = true,
        ["j_danganro_genocidejack"] = true,
        ["j_danganro_yasuhirohagakure"] = true,
        ["j_danganro_gundhamtanaka"] = true,
        ["j_danganro_makotonaegi"] = true
    },
})

SMODS.ObjectType({
    key = "danganro_Hamster",
    cards = {
        ["j_danganro_champ"] = true,
        ["j_danganro_sand"] = true,
        ["j_danganro_jump"] = true,
        ["j_danganro_magaz"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {} 
    }
end