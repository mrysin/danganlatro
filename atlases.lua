local danganro_is_mobile = G.F_MOBILE_UI
    or love.system.getOS() == "Android"
    or love.system.getOS() == "iOS"

local function danganro_joker_atlas(definition)
    if danganro_is_mobile then
        definition.path = "Mobile/" .. definition.path
        definition.px = 71
        definition.py = 95
    end

    return SMODS.Atlas(definition)
end

danganro_joker_atlas{
    key = "akaneowari",
    path = "Jokers/akaneowari.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "alterego",
    path = "Jokers/alterego.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "aoiasahina",
    path = "Jokers/aoiasahina.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "bigbangmonokuma",
    path = "Jokers/bigbangmonokuma.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "byakuyatogam1",
    path = "Jokers/byakuyatogam1.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "byakuyatogami",
    path = "Jokers/byakuyatogami.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "byakuyatogamievolved",
    path = "Jokers/byakuyatogamievolved.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "celestialudenberg",
    path = "Jokers/celestialudenberg.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "champ",
    path = "Jokers/champ.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "chiakinanami",
    path = "Jokers/chiakinanami.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "chihirofujisaki",
    path = "Jokers/chihirofujisaki.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "fuyohikokuzuryu",
    path = "Jokers/fuyohikokuzuryu.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "fuyohikokuzuryueyepatch",
    path = "Jokers/fuyohikokuzuryueyepatch.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "genocidejack",
    path = "Jokers/genocidejack.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "gundhamtanaka",
    path = "Jokers/gundhamtanaka.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "hajimehinata",
    path = "Jokers/hajimehinata.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "hifumiyamada",
    path = "Jokers/hifumiyamada.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "hiyokosaionji",
    path = "Jokers/hiyokosayanji.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "ibukimioda",
    path = "Jokers/ibukimioda.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "izurukamakura",
    path = "Jokers/izurukamakura.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "jump",
    path = "Jokers/jump.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "junk03nosh1ma",
    path = "Jokers/junk03nosh1ma.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "junkoenoshima",
    path = "Jokers/junkoenoshima.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "kazuichisoda",
    path = "Jokers/kazuichisoda.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "kiyondoishida",
    path = "Jokers/kiyondoishida.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "kiyotakaishimaru",
    path = "Jokers/kiyotakaishimaru.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "kyokokirigiri",
    path = "Jokers/kyokokirigiri.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "leonkuwata",
    path = "Jokers/leonkuwata.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "magaz",
    path = "Jokers/magaz.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "mahirukoizumi",
    path = "Jokers/mahirukoizumi.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "makotonaegi",
    path = "Jokers/makotonaegi.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "mikantsumiki",
    path = "Jokers/mikantsumiki.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "minimaru",
    path = "Jokers/minimaru.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "mondoowada",
    path = "Jokers/mondoowada.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "monokuma",
    path = "Jokers/monokuma.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "mukuroikusaba",
    path = "Jokers/mukuroikusaba.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "nagitokomaeda",
    path = "Jokers/nagitokomaeda.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "nekomarunidai",
    path = "Jokers/nekomarunidai.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "nekomarunidairobot",
    path = "Jokers/nekomarunidairobot.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "pekopekoyama",
    path = "Jokers/pekopekoyama.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "rocket",
    path = "Jokers/rocket.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "sakuraogami",
    path = "Jokers/sakuraogami.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "sand",
    path = "Jokers/sand.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "sayakamaizono",
    path = "Jokers/sayakamaizono.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "sonianevermind",
    path = "Jokers/sonianevermind.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "surveillancecamera",
    path = "Jokers/surveillancecamera.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "teruteruhanamura",
    path = "Jokers/teruteruhanamura.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "timebomb",
    path = "Jokers/timebomb.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "tokofukawa",
    path = "Jokers/tokofukawa.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "ultimateimposter",
    path = "Jokers/ultimateimposter.png",
    px = 1207,
    py = 1615
}
danganro_joker_atlas{
    key = "yasuhirohagakure",
    path = "Jokers/yasuhirohagakure.png",
    px = 1207,
    py = 1615
}
