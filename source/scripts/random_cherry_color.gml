//random_cherry_color()
//returns a random sprite index for a cherry
if(!global.use_original_cherries) return choose(
    sprCherry,
    sprCherryPink,
    sprCherryOrange,
    sprCherryMagenta,
    sprCherryViolet,
    sprCherryBlue,
    sprCherryAzure,
    sprCherryCyan,
    sprCherryEmerald,
    sprCherryGreen,
    sprCherryChartreuse,
    sprCherryYellow,
    sprCherryGray,
    sprCherryWhite,
    sprCherryBlack,
) else return choose(
    sprCherryNew,
    sprCherryPinkNew,
    sprCherryOrangeNew,
    sprCherryMagentaNew,
    sprCherryVioletNew,
    sprCherryBlueNew,
    sprCherryAzureNew,
    sprCherryCyanNew,
    sprCherryEmeraldNew,
    sprCherryGreenNew,
    sprCherryChartreuseNew,
    sprCherryYellowNew,
    sprCherryGrayNew,
    sprCherryWhiteNew,
    sprCherryBlackNew,
)