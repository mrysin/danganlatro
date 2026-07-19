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

function danganro_destroy_joker(card, colours)
    local flags = SMODS.calculate_context({
        joker_type_destroyed = true,
        card = card
    })

    if flags.no_destroy then
        card.getting_sliced = nil
        return false
    end

    card:start_dissolve(colours)
    return true
end

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
    assert(SMODS.load_file("jokers/byakuyatogam1.lua"))()
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
    assert(SMODS.load_file("jokers/chiakinanami.lua"))()
    assert(SMODS.load_file("jokers/hajimehinata.lua"))()
    assert(SMODS.load_file("jokers/izurukamakura.lua"))()
    assert(SMODS.load_file("jokers/hiyokosaionji.lua"))()
    assert(SMODS.load_file("jokers/fuyohikokuzuryu.lua"))()
    assert(SMODS.load_file("jokers/fuy0hik0kuzuryu.lua"))()
    assert(SMODS.load_file("jokers/mahirukoizumi.lua"))()
    assert(SMODS.load_file("jokers/mikantsumiki.lua"))()
    assert(SMODS.load_file("jokers/nagitokomaeda.lua"))()
    assert(SMODS.load_file("jokers/nekomarunidai.lua"))()
    assert(SMODS.load_file("jokers/mechamaru.lua"))()
    assert(SMODS.load_file("jokers/pekopekoyama.lua"))()
    assert(SMODS.load_file("jokers/sonianevermind.lua"))()
    assert(SMODS.load_file("jokers/teruteruhanamura.lua"))()
    assert(SMODS.load_file("jokers/ultimateimposter.lua"))()
    assert(SMODS.load_file("decks/despairdeck.lua"))()
    assert(SMODS.load_file("decks/hopedeck.lua"))()
    assert(SMODS.load_file("decks/monokumadeck.lua"))()
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
        ["j_danganro_byakuyatogam1"] = true,
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
        ["j_danganro_kyokokirigiri"] = true,
        ["j_danganro_akaneowari"] = true,
        ["j_danganro_chiakinanami"] = true,
        ["j_danganro_hajimehinata"] = true,
        ["j_danganro_izurukamakura"] = true,
        ["j_danganro_hiyokosaionji"] = true,
        ["j_danganro_fuyohikokuzuryu"] = true,
        ["j_danganro_fuy0hik0kuzuryu"] = true,
        ["j_danganro_mahirukoizumi"] = true,
        ["j_danganro_mikantsumiki"] = true,
        ["j_danganro_nagitokomaeda"] = true,
        ["j_danganro_nekomarunidai"] = true,
        ["j_danganro_mechamaru"] = true,
        ["j_danganro_pekopekoyama"] = true,
        ["j_danganro_sonianevermind"] = true,
        ["j_danganro_teruteruhanamura"] = true
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

SMODS.ObjectType({
    key = "danganro_decreasing_jokers",
    cards = {
        ["j_danganro_akaneowari"] = true,
        ["j_danganro_aoiasahina"] = true,
        ["j_danganro_mondoowada"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {},
        retrigger_joker = true,
        post_trigger = true
    }
end
