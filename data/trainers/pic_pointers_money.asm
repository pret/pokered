MACRO pic_money
    dw \1
    bcd3 \2
ENDM

TrainerPicAndMoneyPointers::
    table_width 5, TrainerPicAndMoneyPointers
    ; pic pointer, base reward money
    ; money received after battle = base money × level of last enemy mon
    pic_money YoungsterPic,    3000
    pic_money BugCatcherPic,   2000
    pic_money LassPic,         3000
    pic_money SailorPic,       6000
    pic_money JrTrainerMPic,   4000
    pic_money JrTrainerFPic,   4000
    pic_money PokemaniacPic,   10000
    pic_money SuperNerdPic,    5000
    pic_money HikerPic,        7000
    pic_money BikerPic,        4000
    pic_money BurglarPic,      18000
    pic_money EngineerPic,     10000
    pic_money JugglerPic,      7000
    pic_money FisherPic,       7000
    pic_money SwimmerPic,      1000
    pic_money CueBallPic,      5000
    pic_money GamblerPic,      14000
    pic_money BeautyPic,       14000
    pic_money PsychicPic,      2000
    pic_money RockerPic,       5000
    pic_money JugglerPic,      7000
    pic_money TamerPic,        8000
    pic_money BirdKeeperPic,   5000
    pic_money BlackbeltPic,    5000
    pic_money Rival1Pic,       7000
    pic_money ProfOakPic,      19800
    pic_money ChiefPic,        6000
    pic_money ScientistPic,    10000
    pic_money GiovanniPic,     19800
    pic_money RocketPic,       6000
    pic_money CooltrainerMPic, 7000
    pic_money CooltrainerFPic, 7000
    pic_money BrunoPic,        19800
    pic_money BrockPic,        19800
    pic_money MistyPic,        19800
    pic_money LtSurgePic,      19800
    pic_money ErikaPic,        19800
    pic_money KogaPic,         19800
    pic_money BlainePic,       19800
    pic_money SabrinaPic,      19800
    pic_money GentlemanPic,    14000
    pic_money Rival2Pic,       13000
    pic_money Rival3Pic,       19800
    pic_money LoreleiPic,      19800
    pic_money ChannelerPic,    6000
    pic_money AgathaPic,       19800
    pic_money LancePic,        19800
    assert_table_length NUM_TRAINERS
