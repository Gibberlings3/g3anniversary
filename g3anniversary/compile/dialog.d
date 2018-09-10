BEGIN ~g3maid~ // copied from wench1.dlg

IF ~RandomNum(6,1)~ THEN BEGIN 0
  SAY #15352
  IF ~~ THEN EXIT
END

IF ~RandomNum(6,2)~ THEN BEGIN 1
  SAY #15353
  IF ~~ THEN EXIT
END

IF ~RandomNum(6,3)~ THEN BEGIN 2
  SAY #15356
  IF ~~ THEN EXIT
END

IF ~RandomNum(6,4)~ THEN BEGIN 3
  SAY #15359
  IF ~~ THEN EXIT
END

IF ~RandomNum(6,5)~ THEN BEGIN 4
  SAY #15360
  IF ~~ THEN EXIT
END

IF ~RandomNum(6,6)~ THEN BEGIN 5
  SAY #15361
  IF ~~ THEN EXIT
END

/////                                                  \\\\\
///// Idobek                                           \\\\\
/////                                                  \\\\\

BEGIN G3KEBODI
IF ~InParty("Keldorn")
    See("Keldorn")
    !Dead("Keldorn")
    !StateCheck("Keldorn",CD_STATE_NOTVALID)
    Global("G3SuleciKeldornExchange","GLOBAL",0)~ THEN BEGIN KeldornInit SAY @10949
  IF ~~ DO ~SetGlobal("G3SuleciKeldornExchange","GLOBAL",1)~ EXTERN G3SULECI KeldornBanter
END

IF ~Global("G3SuleciActivated","GLOBAL",2)~ THEN BEGIN QuestActive SAY @10950
  IF ~~ THEN EXTERN G3SULECI QuestActive
END

IF ~Global("G3SuleciActivated","GLOBAL",1)
    Global("G3SuleciKeldornExchange","GLOBAL",1)~ THEN BEGIN ActivatedKeldornMet SAY @10951
  IF ~~ REPLY @10952 GOTO Drini
  IF ~~ REPLY @10953 GOTO Drini
  IF ~~ REPLY @10954 GOTO Drini
END

IF ~Global("G3SuleciActivated","GLOBAL",1)
    Global("G3SuleciKeldornExchange","GLOBAL",0)~ THEN BEGIN ActivatedNoKeldorn SAY @10949
  IF ~~ REPLY @10955 GOTO MyBoss
  IF ~~ REPLY @10956 GOTO FineByMe
  IF ~InParty("Keldorn")
      See("Keldorn")
      !Dead("Keldorn")
      !StateCheck("Keldorn",CD_STATE_NOTVALID)~ DO ~SetGlobal("G3SuleciKeldornExchange","GLOBAL",1)~ EXTERN G3SULECI KeldornBanter
END 

IF ~RandomNum(3,1)~ THEN BEGIN RandomGreeting1 SAY
  @10957
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,2)~ THEN BEGIN RandomGreeting2 SAY
  @10958
  IF ~~ THEN EXIT
END

IF ~RandomNum(3,3)~ THEN BEGIN RandomGreeting3 SAY
  @10959
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN MyBoss SAY
  @10960
  IF ~~ REPLY @10961 GOTO Actually
  IF ~~ REPLY @10962 GOTO Drini
  IF ~~ REPLY @10956 GOTO FineByMe
END

IF ~~ THEN BEGIN FineByMe SAY
  @10963
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN TheSir SAY
  @10964
  IF ~~ REPLY @10965 GOTO SirSuleci
  IF ~~ REPLY @10966 GOTO FineByMe
END

IF ~~ THEN BEGIN SirSuleci SAY
  @10967
  IF ~~ REPLY @10961 GOTO Actually
  IF ~~ REPLY @10968 GOTO Drini
END

IF ~~ THEN BEGIN Actually SAY
  @10969
  IF ~~ REPLY @10952 GOTO Drini
  IF ~~ REPLY @10970 GOTO Drini
  IF ~~ REPLY @10971 GOTO Drini
END

IF ~~ THEN BEGIN KebodiDeals3 SAY
  @10972
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Drini SAY
  @10973 
  IF ~~ THEN DO ~SetGlobal("G3SuleciActivated","GLOBAL",2)~ EXTERN G3SULECI MainQuestTypeStuff
END

IF ~~ THEN BEGIN G3ScamLaughing SAY @10974
  IF ~~ THEN EXTERN G3SULECI G3ScamLocation
END

IF ~~ THEN BEGIN G3ScamCrazy SAY @10975
  IF ~~ THEN EXTERN G3SULECI G3ScamLocation
END

IF ~~ THEN BEGIN G3ScamAttention SAY @10976
  IF ~~ THEN EXTERN G3SULECI G3ScamLocation
END

IF ~~ THEN BEGIN G3ScamLocationRedux SAY @10977
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN G3IDScam SAY @10978
  IF ~~ THEN EXTERN G3SULECI G3ScamLocation
END


/////                                                  \\\\\
///// Icelus                                           \\\\\
/////                                                  \\\\\

BEGIN G3SULECI

IF ~InParty("Keldorn")
    See("Keldorn")
    !Dead("Keldorn")
    !StateCheck("Keldorn",CD_STATE_NOTVALID)
    Global("G3SuleciKeldornExchange","GLOBAL",0)~ BEGIN KeldornBanter SAY @10979 
  IF ~~ THEN DO ~SetGlobal("G3SuleciKeldornExchange","GLOBAL",1)~ EXTERN KELDORJ KeldornBanterWrapup
END

IF ~Global("G3SuleciActivated","GLOBAL",2)~ THEN BEGIN QuestActive SAY @10980
  COPY_TRANS G3SULECI TheList
END  

IF ~~ THEN BEGIN TheListViaKeldorn2 SAY @10981
  COPY_TRANS G3SULECI TheList
END

IF ~~ THEN BEGIN TheListViaKeldorn SAY @10982
  COPY_TRANS G3SULECI TheList
END

IF ~True()~ THEN BEGIN KebodiDeals SAY
  @10983
  IF ~RandomNum(3,1)~ EXTERN G3KEBODI KebodiDeals1
  IF ~RandomNum(3,2)~ EXTERN G3KEBODI KebodiDeals2
  IF ~RandomNum(3,3)~ EXTERN G3KEBODI KebodiDeals2
  IF ~Global("G3SuleciActivated","GLOBAL",1)~ EXTERN G3KEBODI TheSir
END

IF ~~ THEN BEGIN MainQuestTypeStuff SAY @10984
  IF ~Global("G3SuleciKeldornExchange","GLOBAL",0)
      Global("G3DebtSchmebt","LOCALS",0)~ THEN REPLY @10985 DO ~SetGlobal("G3DebtSchmebt","LOCALS",1)~ GOTO DebtBuzzoff
  IF ~Global("G3SuleciKeldornExchange","GLOBAL",1)
      Global("G3DebtSchmebt","LOCALS",0)~ THEN REPLY @10985 DO ~SetGlobal("G3DebtSchmebt","LOCALS",1)~ GOTO DebtBuzzoffKeldorn
  IF ~~ THEN REPLY @10986 GOTO TheList
  IF ~~ THEN REPLY @10987 GOTO SummoningSpell
END

IF ~~ THEN BEGIN DebtBuzzoff SAY @10988
  IF ~~ THEN REPLY @10986 GOTO TheList
  IF ~~ THEN REPLY @10987 GOTO SummoningSpell
END

IF ~~ THEN BEGIN DebtBuzzoffKeldorn SAY @10989
  IF ~~ THEN REPLY @10986 GOTO TheList
  IF ~~ THEN REPLY @10987 GOTO SummoningSpell
END

IF ~~ THEN BEGIN TheList SAY @10990
  IF ~Global("G3LadyBevActivated","GLOBAL",0)~ REPLY @10991 DO ~SetGlobal("G3LadyBevActivated","GLOBAL",1)~ GOTO Vibrissa1
  IF ~!Global("G3LadyBevActivated","GLOBAL",0)
      !PartyHasItem("G3Java2")~ REPLY @10991 GOTO Vibrissa2
  IF ~Global("G3MoniqQuest","GLOBAL",0)~ REPLY @10992 DO ~SetGlobal("G3MoniqQuest","GLOBAL",1)~ UNSOLVED_JOURNAL @19996 GOTO Arabellan1
  IF ~!Global("G3MoniqQuest","GLOBAL",0)
      GlobalLT("G3MoniqQuest","GLOBAL",8)
      !PartyHasItem("G3DRINK3")~ REPLY @10992 GOTO Arabellan2
  IF ~PartyHasItem("G3DRINK3")~ REPLY @10013 DO ~SetGlobal("G3MoniqQuest","GLOBAL",8)~ UNSOLVED_JOURNAL @19988 GOTO Arabellan3
  IF ~Global("G3BigRobActivated","GLOBAL",0)~ REPLY @10993 DO ~SetGlobal("G3BigRobActivated","GLOBAL",1)~ GOTO DWhiskey1
  IF ~Global("G3BigRobActivated","GLOBAL",1)~ REPLY @10993 GOTO DWhiskey2
  IF ~Global("G3BigRobActivated","GLOBAL",3)~ REPLY @10994 GOTO DWhiskey3
  IF ~Global("G3Corradun","GLOBAL",0)~ REPLY @10995 DO ~SetGlobal("G3Corradun","GLOBAL",1)~ UNSOLVED_JOURNAL @19999 GOTO SAle1
  IF ~!Global("G3Corradun","GLOBAL",0)
      !PartyHasItem("G3Drink6")~ REPLY @10995 GOTO SAle1
  IF ~Global("G3GrimAndDancer","GLOBAL",0)~ REPLY @10996 DO ~SetGlobal("G3GrimAndDancer","GLOBAL",1)~ GOTO GFDrink1
  IF ~!Global("G3GrimAndDancer","GLOBAL",0)
      !PartyHasItem("G3Drink4")~ REPLY @10996 GOTO GFDrink2
  IF ~Global("G3DewnyQuest","GLOBAL",0)~ REPLY @10997 DO ~SetGlobal("G3DewnyQuest","GLOBAL",1)~ UNSOLVED_JOURNAL @19998 GOTO Dewny1
  IF ~!Global("G3DewnyQuest","GLOBAL",0)
      Global("G3Scam","GLOBAL",0)~ REPLY @10997 GOTO Dewny2
  IF ~Global("G3Scam","GLOBAL",1)~ THEN REPLY @10998 DO ~SetGlobal("G3Scam","GLOBAL",2)
                                                       SetGlobal("G3ToldScam","LOCALS",1)~ EXTERN G3KEBODI G3Scam
  IF ~Global("G3Scam","GLOBAL",2)
      !PartyHasItem("G3Drink1")
      Global("G3ToldScam","LOCALS",1)~ THEN REPLY @10999 EXTERN G3KEBODI G3ScamLocationRedux
  IF ~~ THEN REPLY @11000 GOTO G3SuleciSeeYa
END

IF ~~ THEN BEGIN G3SuleciSeeYa SAY @11130
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN SAle2 SAY @11052
  IF ~~ THEN GOTO TheListLoop
END

IF ~~ THEN BEGIN Dewny2 SAY @11048
  IF ~~ THEN GOTO TheListLoop
END

IF ~~ THEN BEGIN TheListLoop SAY @10007
  COPY_TRANS G3SULECI TheList
END

IF ~~ THEN BEGIN Vibrissa1 SAY @10006
  IF ~~ THEN UNSOLVED_JOURNAL @19997 GOTO TheListLoop
END

IF ~~ THEN BEGIN Vibrissa2 SAY @10008
  IF ~~ THEN GOTO TheListLoop
END

IF ~~ THEN BEGIN Arabellan2 SAY @10012
  IF ~~ THEN GOTO TheListLoop
END

IF ~~ THEN BEGIN DWhiskey1 SAY @10020
  IF ~~ THEN UNSOLVED_JOURNAL @19995 GOTO TheListLoop
END

IF ~~ THEN BEGIN DWhiskey2 SAY @10021
  IF ~~ THEN GOTO TheListLoop
END

IF ~~ THEN BEGIN DWhiskey3 SAY @11037
  IF ~~ THEN UNSOLVED_JOURNAL @19994 GOTO TheListLoop
END

IF ~~ THEN BEGIN GFDrink1 SAY @11038
  IF ~~ THEN UNSOLVED_JOURNAL @19993 GOTO TheListLoop
END

IF ~~ THEN BEGIN GFDrink2 SAY @11039
  IF ~~ THEN GOTO TheListLoop
END

IF ~~ THEN BEGIN G3ScamLocation SAY @11001
  IF ~~ THEN UNSOLVED_JOURNAL @19992 GOTO G3ScamLocationEnd
END

/////                                                  \\\\\
///// JPS                                              \\\\\
/////                                                  \\\\\

BEGIN ~G3JPS~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN FirstMeeting SAY @11053
  IF ~Global("G3MoniqQuest","GLOBAL",8)
      PartyHasItem("G3DRINK3")~ THEN REPLY @11054 GOTO Wine1
  IF ~~ THEN REPLY @11055 GOTO BadJoke1
  IF ~~ THEN REPLY @11056 GOTO BreakWall1
  IF ~~ THEN REPLY @11177 GOTO JPSExit
END

IF ~Global("G3MoniqQuest","GLOBAL",9)
    GlobalTimerNotExpired("G3JPSFirstShot","GLOBAL")~ THEN BEGIN NotReadyTimer1 SAY @11057
  IF ~~ THEN EXIT
END

IF ~Global("G3MoniqQuest","GLOBAL",10)
    GlobalTimerNotExpired("G3JPSSecondShot","GLOBAL")~ THEN BEGIN NotReadyTimer2 SAY @11058
  IF ~~ THEN EXIT
END

IF ~Global("G3MoniqQuest","GLOBAL",10)
    GlobalTimerExpired("G3JPSSecondShot","GLOBAL")~ THEN BEGIN ThirdMeeting SAY @11059
  IF ~~ THEN REPLY @11060 GOTO NotFinished
  IF ~~ THEN REPLY @11061 GOTO NotFinished
  IF ~~ THEN REPLY @11062 GOTO NotStarted
END

IF ~Global("G3MoniqQuest","GLOBAL",9)
    GlobalTimerExpired("G3JPSFirstShot","GLOBAL")~ THEN BEGIN SecondMeeting SAY @11063
  IF ~~ THEN REPLY @11064 GOTO HowLong2
  IF ~~ THEN REPLY @11065 GOTO OfferHelp
  IF ~~ THEN REPLY @11066 GOTO SomeoneElse
END

IF ~!NumTimesTalkedTo(0)~ THEN BEGIN ReturnTrip SAY @11068
  IF ~Global("G3MoniqQuest","GLOBAL",8)
      PartyHasItem("G3DRINK3")~ THEN REPLY @11054 GOTO Wine1
  IF ~~ THEN REPLY @11177 GOTO JPSExit
  IF ~~ THEN REPLY @11098 GOTO JPSExit
END

IF ~~ THEN BEGIN JPSExit SAY @11178
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Wine2 SAY @11099
  IF ~~ THEN REPLY @11100 EXTERN ~G3JPS~ BadJoke2a
  IF ~~ THEN REPLY @11101 EXTERN ~G3JPS~ HowLong
END

IF ~~ THEN BEGIN BadJoke1 SAY @11087
  IF ~~ THEN REPLY @11056 GOTO BreakWall1
  IF ~~ THEN REPLY @11177 GOTO JPSExit
  IF ~Global("G3MoniqQuest","GLOBAL",8)
      PartyHasItem("G3DRINK3")~ THEN REPLY @11088 GOTO Wine1
END

IF ~~ THEN BadJoke2b SAY @11107 = @11108 = @11109
  IF ~~ THEN GOTO HowLong
END

IF ~~ THEN BEGIN HowLong SAY @11067
  IF ~~ THEN DO ~SetGlobalTimer("G3JPSFirstShot","GLOBAL",300)
                 SetGlobal("G3MoniqQuest","GLOBAL",9)~ EXIT
END

IF ~~ THEN BEGIN HowLong2 SAY @11069
  IF ~~ THEN REPLY @11070 DO ~SetGlobalTimer("G3JPSSecondShot","GLOBAL",300)
                             SetGlobal("G3MoniqQuest","GLOBAL",10)~ EXIT
  IF ~~ THEN REPLY @11071 DO ~SetGlobalTimer("G3JPSSecondShot","GLOBAL",300)
                             SetGlobal("G3MoniqQuest","GLOBAL",10)~ EXIT
END

IF ~~ THEN  OfferHelp SAY @11111
  IF ~~ THEN GOTO HowLong2
END

IF ~~ THEN BEGIN SaidAlready SAY @11072
  IF ~~ THEN REPLY @11073 GOTO SaidAlready2
END

IF ~~ THEN BEGIN SaidAlready2 SAY @11074
  IF ~~ THEN REPLY @11075 GOTO SaidAlready3
END

IF ~~ THEN BEGIN SaidAlready3 SAY @11076
  IF ~~ THEN REPLY @11077 GOTO NotStarted
END

IF ~~ THEN BEGIN NotStarted SAY @11078
  IF ~~ THEN REPLY @11079 GOTO UnexpComp
  IF ~~ THEN REPLY @11080 GOTO StartNow
  IF ~~ THEN REPLY @11081 GOTO StartNow
END

IF ~~ THEN BEGIN UnexpComp SAY @11082
  IF ~~ THEN REPLY @11083 GOTO StartNow
  IF ~~ THEN REPLY @11084 GOTO StartNow
END

IF ~~ THEN BEGIN GoodBye SAY @11085 = @11086
  IF ~~ THEN DO ~DestroyItem("G3Drink3")
                 GiveItemCreate("G3Drink7",LastTalkedToBy,1,1,1)
                 SetGlobal("G3MoniqQuest","GLOBAL",11)
                 DialogInterrupt(FALSE)
                 SetInterrupt(FALSE)
                 EscapeArea()~ EXIT
END

/////                                                  \\\\\
///// BigRob                                           \\\\\
/////                                                  \\\\\

BEGIN G3BIGROB

IF ~!NumTimesTalkedTo(0)~ THEN BEGIN G3BRSECOND SAY @10460
  IF ~~ THEN REPLY @10461 GOTO G3BRU
  IF ~Global("G3BigRobActivated","GLOBAL",4)
      Global("G3GaveScroll","LOCALS",0)~ THEN DO ~SetGlobal("G3GaveScroll","LOCALS",1)~ REPLY @10462 GOTO G3BRT //(only if PCs have spoken to Cromwell)
  IF ~PartyHasItem("G3OIL")~ THEN REPLY @10463 GOTO G3BRS //(Only if PC has the concoction)
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN G3BRFIRST SAY @10464
  IF ~Global("G3BigRobActivated","GLOBAL",2)~ THEN REPLY @10465 GOTO G3BRZ
  IF ~Global("G3BigRobActivated","GLOBAL",2)
      Race(LastTalkedToBy,DWARF)~ THEN REPLY @10466 GOTO G3BRYDwarf
  IF ~Global("G3BigRobActivated","GLOBAL",2)
      !Race(LastTalkedToBy,DWARF)~ THEN REPLY @10466 GOTO G3BRYNoDwarf
  IF ~Global("G3BigRobActivated","GLOBAL",2)~ THEN REPLY @10467 GOTO G3BRX
  IF ~Global("G3BigRobActivated","GLOBAL",2)
      Global("GoAskBarKeep","LOCALS",0)~ THEN REPLY @10708 GOTO G3BRW //(only if PC has talked to Icelus and Idobek and not got quest before)
  IF ~Global("G3BigRobActivated","GLOBAL",2)
      Global("GoAskBarKeep","LOCALS",1)~ THEN REPLY @11230 GOTO G3BRW //(only if PC has talked to Icelus and Idobek and not got quest before)
  IF ~Global("G3BigRobActivated","GLOBAL",1)~ THEN DO ~SetGlobal("GoAskBarKeep","LOCALS",1)~ REPLY @11228 GOTO G3GoAskBarkeep
  IF ~~ THEN REPLY @10469 DO ~SetNumTimesTalkedTo(0)~ GOTO G3BRV
END

IF ~~ THEN BEGIN G3GoAskBarkeep SAY @11229
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN G3BRZ SAY @10470
  IF ~~ THEN REPLY @10471 GOTO G3BRZZ
  IF ~Race(LastTalkedToBy,DWARF)~ THEN REPLY @10472 GOTO G3BRYDwarf
  IF ~!Race(LastTalkedToBy,DWARF)~ THEN REPLY @10472 GOTO G3BRYNoDwarf
  IF ~Global("GoAskBarKeep","LOCALS",0)~ THEN REPLY @10708 GOTO G3BRW //(only if PC has talked to Icelus and Idobek and not got quest before)
  IF ~Global("GoAskBarKeep","LOCALS",1)~ THEN REPLY @11230 GOTO G3BRW //(only if PC has talked to Icelus and Idobek and not got quest before)
END

IF ~~ THEN BEGIN G3BRZZ SAY @10473
  IF ~~ THEN REPLY @10474 GOTO G3BRZZZ
  IF ~~ THEN REPLY @10475 GOTO G3BRV
  IF ~Race(LastTalkedToBy,DWARF)~ THEN REPLY @10472 GOTO G3BRYDwarf
  IF ~!Race(LastTalkedToBy,DWARF)~ THEN REPLY @10472 GOTO G3BRYNoDwarf
  IF ~Global("GoAskBarKeep","LOCALS",0)~ THEN REPLY @10708 GOTO G3BRW //(only if PC has talked to Icelus and Idobek and not got quest before)
  IF ~Global("GoAskBarKeep","LOCALS",1)~ THEN REPLY @11230 GOTO G3BRW
END

IF ~~ THEN BEGIN G3BRZZZ SAY @10476
  IF ~~ THEN REPLY @10477 GOTO G3BRZZZZ
  IF ~~ THEN REPLY @10475 GOTO G3BRV
  IF ~Race(LastTalkedToBy,DWARF)~ THEN REPLY @10472 GOTO G3BRYDwarf
  IF ~!Race(LastTalkedToBy,DWARF)~ THEN REPLY @10472 GOTO G3BRYNoDwarf
  IF ~Global("GoAskBarKeep","LOCALS",0)~ THEN REPLY @10708 GOTO G3BRW //(only if PC has talked to Icelus and Idobek and not got quest before)
  IF ~Global("GoAskBarKeep","LOCALS",1)~ THEN REPLY @11230 GOTO G3BRW
END

IF ~~ THEN BEGIN G3BRZZZZ SAY @10478
  IF ~~ THEN REPLY @10475 GOTO G3BRV
  IF ~~ THEN REPLY @10479 GOTO G3BRV
  IF ~Race(LastTalkedToBy,DWARF)~ THEN REPLY @10472 GOTO G3BRYDwarf
  IF ~!Race(LastTalkedToBy,DWARF)~ THEN REPLY @10472 GOTO G3BRYNoDwarf
  IF ~Global("GoAskBarKeep","LOCALS",0)~ THEN REPLY @10708 GOTO G3BRW //(only if PC has talked to Icelus and Idobek and not got quest before)
  IF ~Global("GoAskBarKeep","LOCALS",1)~ THEN REPLY @11230 GOTO G3BRW
END

IF ~~ THEN BEGIN G3BRYNoDwarf SAY @10480 // non-dwarf check
  IF ~~ THEN REPLY @10475 GOTO G3BRV
  IF ~~ THEN REPLY @10479 GOTO G3BRV
  IF ~~ THEN REPLY @10481 GOTO G3BRZZ
  IF ~Global("GoAskBarKeep","LOCALS",0)~ THEN REPLY @10708 GOTO G3BRW //(only if PC has talked to Icelus and Idobek and not got quest before)
  IF ~Global("GoAskBarKeep","LOCALS",1)~ THEN REPLY @11230 GOTO G3BRW
END

IF ~~ THEN BEGIN G3BRYDwarf SAY @10482 // dwarf check
  IF ~~ THEN REPLY @10475 GOTO G3BRV
  IF ~~ THEN REPLY @10479 GOTO G3BRV
  IF ~~ THEN REPLY @10481 GOTO G3BRZZ
  IF ~Global("GoAskBarKeep","LOCALS",0)~ THEN REPLY @10708 GOTO G3BRW //(only if PC has talked to Icelus and Idobek and not got quest before)
  IF ~Global("GoAskBarKeep","LOCALS",1)~ THEN REPLY @11230 GOTO G3BRW
END

IF ~~ THEN BEGIN G3BRX SAY @10483
  IF ~~ THEN REPLY @10484 GOTO G3BRXZ
  IF ~~ THEN REPLY @10485 GOTO G3BRV
END

IF ~~ THEN BEGIN G3BRXZ SAY @10486
  IF ~~ THEN REPLY @10487 GOTO G3BRV
  IF ~~ THEN REPLY @10488 GOTO G3BRFight //[Start Fight]
  IF ~Global("GoAskBarKeep","LOCALS",0)~ THEN REPLY @10708 GOTO G3BRW //(only if PC has talked to Icelus and Idobek and not got quest before)
  IF ~Global("GoAskBarKeep","LOCALS",1)~ THEN REPLY @11230 GOTO G3BRW
END

IF ~~ THEN BEGIN G3BRFight SAY @10468
  IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~~ THEN BEGIN G3BRW SAY @10709
  IF ~~ THEN REPLY @10710 GOTO G3BRWZ
  IF ~~ THEN REPLY @10711 GOTO G3BRWZ
END

IF ~~ THEN BEGIN G3BRWZ SAY @10492
  IF ~~ THEN REPLY @10493 GOTO G3BRWZZ
  IF ~~ THEN REPLY @10494 GOTO G3BRWZY
  IF ~~ THEN REPLY @10495 GOTO G3BRWZX
END

IF ~~ THEN BEGIN G3BRWZZ SAY @10496
  IF ~~ THEN REPLY @10497 GOTO G3BRWZZZ
  IF ~~ THEN REPLY @10498 GOTO G3BRWZZY
  IF ~~ THEN REPLY @10499 GOTO G3BRV
END

IF ~~ THEN BEGIN G3BRWZZZ SAY @10500
  IF ~~ THEN REPLY @10501 GOTO G3BRWZZY
  IF ~~ THEN REPLY @10502 GOTO G3BRV
END

IF ~~ THEN BEGIN G3BRWZZY SAY @10503
  IF ~~ THEN DO ~SetGlobal("G3BigRobActivated","GLOBAL",3)~ EXIT //[Quest Gotten]
END

IF ~~ THEN BEGIN G3BRWZY SAY @10504
  IF ~~ THEN REPLY @10501 GOTO G3BRWZZY
  IF ~~ THEN REPLY @10502 GOTO G3BRV
END

IF ~~ THEN BEGIN G3BRWZX SAY @10505
  IF ~~ THEN REPLY @10506 GOTO G3BRFight //[Start Fight]
  IF ~~ THEN REPLY @10501 GOTO G3BRWZZY
  IF ~~ THEN REPLY @10502 GOTO G3BRV
END

IF ~~ THEN BEGIN G3BRV SAY @10507
  IF ~~ THEN EXIT //(End Diaogue)
END

IF ~~ THEN BEGIN G3BRU SAY @10508
  IF ~Global("G3BigRobActivated","GLOBAL",2)~ THEN REPLY @10471 GOTO G3BRZZ
  IF ~Global("G3BigRobActivated","GLOBAL",2)
      Race(LastTalkedToBy,DWARF)~ THEN REPLY @10472 GOTO G3BRYDwarf
  IF ~Global("G3BigRobActivated","GLOBAL",2)
      !Race(LastTalkedToBy,DWARF)~ THEN REPLY @10472 GOTO G3BRYNoDwarf
  IF ~Global("G3BigRobActivated","GLOBAL",2)~ THEN REPLY @10708 GOTO G3BRW //(only if PC has talked to Icelus and Idobek and not got quest before)
  IF ~Global("G3BigRobActivated","GLOBAL",4)
      Global("G3GaveScroll","LOCALS",0)~ THEN DO ~SetGlobal("G3GaveScroll","LOCALS",1)~ REPLY @10462 GOTO G3BRT //(only if PCs have spoken to Cromwell)
  IF ~PartyHasItem("G3OIL")~ THEN REPLY @10463 GOTO G3BRS //(Only if PC has the concoction)
  IF ~~ THEN REPLY @10469 GOTO G3BRV
END

IF ~~ THEN BEGIN G3BRT SAY @10509
  IF ~~ THEN DO ~GiveItemCreate("G3BRSCRL",LastTalkedToBy,1,1,1)~ EXIT //[Give PC scroll item]
END

IF ~~ THEN BEGIN G3BRS SAY @10510
  IF ~~ THEN DO ~TakeItemReplace("G3DRINK5","G3OIL",LastTalkedToBy)
                 AddexperienceParty(1000)~ EXIT // [Take Oil, Give PC Whiskey]
END

/////                                                  \\\\\
///// CORRADUN                                         \\\\\
/////                                                  \\\\\

/* 
global G3CORRADUN
0 > 1 asked celuci
1 > 2 received drink

ar0314 g3corrstuff
0 > 1 spawn corradun, sailors
1 > 2 speaking to corradun
2 > 3 trip first cutscene, two sailors pass out
3 > 4 third sailor speaks
4 > 5 second cutscene, third sailor passes out
5 > 6 speaking to corradun againm get drink
6 > 7 trip third cutscene, laurlana and corradun leave
*/

BEGIN G3SAILR1
IF ~True()~ THEN BEGIN Sailr1Chat SAY @11153
  IF ~~ THEN EXIT
END

BEGIN G3SAILR2
IF ~~ THEN BEGIN CorrCut1 SAY @11160
  IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN Sailr2Chat SAY @11154
  IF ~~ THEN EXIT
END

BEGIN G3SAILR3
IF ~Global("G3CorrStuff","AR0314",3)~ THEN BEGIN CorrCut2 SAY @11161
  IF ~~ THEN DO ~SetGlobal("G3CorrStuff","AR0314",4)~ EXIT
END

IF ~True()~ THEN BEGIN Sailr3Chat SAY @11155
  IF ~~ THEN EXIT
END

BEGIN G3LAUR
BEGIN G3CORR

IF ~Global("G3CorrStuff","AR0314",1)~ THEN BEGIN CorrInitial1 SAY @10712
  IF ~~ THEN DO ~SetGlobal("G3CorrStuff","AR0314",2)~ EXTERN G3SAILR1 CorrInitial2
END

IF ~Global("G3CorrStuff","AR0314",5)~ THEN BEGIN CorrCut3 SAY @10717
  IF ~~ THEN REPLY @10718 DO ~GiveItemCreate("G3DRINK6",LastTalkedToBy,1,0,0) SetGlobal("G3CorrStuff","AR0314",6)~ EXTERN G3CORR CorrOpt1
  IF ~~ THEN REPLY @10719 DO ~GiveItemCreate("G3DRINK6",LastTalkedToBy,1,0,0) SetGlobal("G3CorrStuff","AR0314",6)~ EXTERN G3CORR CorrOpt2
  IF ~~ THEN REPLY @10720 DO ~GiveItemCreate("G3DRINK6",LastTalkedToBy,1,0,0) SetGlobal("G3CorrStuff","AR0314",6)~ EXTERN G3CORR CorrOpt3
  IF ~~ THEN REPLY @11137 EXTERN G3CORR CorrChwisgi
END

IF ~~ THEN BEGIN CorrOpt1 SAY @10721
  IF ~~ THEN REPLY @10722 EXIT
  IF ~~ THEN REPLY @10724 EXIT
END

IF ~~ THEN BEGIN CorrOpt2 SAY @10723
  IF ~~ THEN REPLY @10722 EXIT
  IF ~~ THEN REPLY @10724 EXIT
END

IF ~~ THEN BEGIN CorrOpt3 SAY @10725
  IF ~~ THEN REPLY @10726 EXIT
END

IF ~~ THEN BEGIN CorrChwisgi SAY @11138
  IF ~~ THEN REPLY @11139 DO ~GiveItemCreate("G3DRINK6",LastTalkedToBy,1,0,0) SetGlobal("G3CorrStuff","AR0314",6)~ GOTO CorrOpt1
  IF ~~ THEN REPLY @10719 DO ~GiveItemCreate("G3DRINK6",LastTalkedToBy,1,0,0) SetGlobal("G3CorrStuff","AR0314",6)~ GOTO CorrOpt2
  IF ~~ THEN REPLY @10720 DO ~GiveItemCreate("G3DRINK6",LastTalkedToBy,1,0,0) SetGlobal("G3CorrStuff","AR0314",6)~ GOTO CorrOpt3
END

/////                                                  \\\\\
///// G3SCAM                                           \\\\\
/////                                                  \\\\\

BEGIN G3SCAM
IF ~Global("G3Scam","GLOBAL",0)~ THEN BEGIN G3Initial SAY @10001 = @10002
  IF ~~ THEN UNSOLVED_JOURNAL @19986 DO ~SetInterrupt(FALSE)
                                         DialogueInterrupt(FALSE)
                                         SetGlobal("G3Scam","GLOBAL",1)
                                         TakePartyItem("G3DRINK1")~ EXIT
END

IF ~True()~ THEN BEGIN G3ScamConfronted SAY @10022
  IF ~~ THEN REPLY @10023 DO ~SetGlobal("G3Scam","GLOBAL",3)~ GOTO G3ScamLite
  IF ~~ THEN REPLY @10024 DO ~SetGlobal("G3Scam","GLOBAL",3)~ GOTO G3ScamLite
  IF ~~ THEN REPLY @10041 GOTO G3ScamThreatened
END

IF ~~ THEN BEGIN G3ScamLite SAY @10025
  IF ~~ THEN REPLY @10027 GOTO G3ScamThreatened
  IF ~InParty("Korgan")
      See("Korgan")
      !Dead("Korgan")
      !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN REPLY @10026 EXTERN KORGANJ G3KorganPissed
  IF ~OR(4)
        !InParty("Korgan")
        !See("Korgan")
        Dead("Korgan")
        StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN REPLY @10026 GOTO G3NameYourPrice
  IF ~PartyGoldGT(9)
      InParty("Korgan")
      See("Korgan")
      !Dead("Korgan")
      !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN REPLY @10028 EXTERN KORGANJ G3KorganPissed  
  IF ~PartyGoldGT(9)
      OR(4)
        !InParty("Korgan")
        !See("Korgan")
        Dead("Korgan")
        StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN REPLY @10028 GOTO G310Gold
  IF ~!HasItem("G3DRINK1","G3Scam")~ THEN GOTO G3ScamNoItem
END

IF ~~ THEN BEGIN G3ScamThreatened SAY @10029
  IF ~~ THEN DO ~SetGlobal("G3ScamSaga","AR0500",3)~ EXIT
END

IF ~~ THEN BEGIN G3NameYourPrice SAY @10031
  IF ~~ THEN REPLY @10032 GOTO G3ScamThreatened
  IF ~PartyGoldGT(99)~ THEN REPLY @10033 GOTO G3100Gold
  IF ~PartyGoldGT(9)~ THEN REPLY @10034 GOTO G310Gold
  IF ~PartyGoldGT(49)~ THEN REPLY @10035 GOTO G350Gold
END

IF ~~ THEN BEGIN G3100Gold SAY @10036 = @10037 = @10038
  IF ~~ THEN DO ~TakePartyGold(100)
                 GiveItem("G3DRINK1",PLAYER1)
                 SetGlobal("G3ScamSaga","AR0500",3)~ EXIT
END  

IF ~~ THEN BEGIN G310Gold SAY @10039 = @10037 = @10038
  IF ~~ THEN DO ~TakePartyGold(10)
                 GiveItem("G3DRINK1",PLAYER1)
                 SetGlobal("G3ScamSaga","AR0500",3)~ EXIT
END    

IF ~~ THEN BEGIN G350Gold SAY @10040 = @10037 = @10038
  IF ~~ THEN DO ~TakePartyGold(50)
                 GiveItem("G3DRINK1",PLAYER1)
                 SetGlobal("G3ScamSaga","AR0500",3)~ EXIT
END

IF ~~ THEN BEGIN G3ScamNoItem SAY @10042 = @10043
  IF ~~ THEN DO ~SetGlobal("G3ScamSaga","AR0500",3)~ EXIT
END

/////                                                  \\\\\
///// Bev                                              \\\\\
/////                                                  \\\\\

BEGIN G3BEV

IF ~Global("G3JavaMojo","GLOBAL",2)~ PartyDrink SAY @10511
  IF ~~ DO ~GiveItemCreate("G3JAVA2",LastTalkedToBy,1,0,0)
            SetInterrupt(FALSE)
            Wait(1)
            EscapeArea()~ EXIT
END

IF ~Global("G3HaludakActivated","GLOBAL",1)~ PartyBeans SAY @10512
  IF ~PartyHasItem("G3JAVA1")~ REPLY @10513 GOTO Mojo
  IF ~!PartyHasItem("G3JAVA1")~ REPLY @10514 GOTO Charm
  IF ~~ REPLY @10515 GOTO UpNorth
END

IF ~Global("G3LadyBevActivated","GLOBAL",1)~ BevThinksKelseyIsHot SAY @10516
  IF ~~ DO ~SetGlobal("G3LadyBevActivated","GLOBAL",2)~ GOTO KelseyNotAtFault
END

IF ~Global("G3LadyBevActivated","GLOBAL",2)~ ReEntry SAY @10517 = @10518
  IF ~Global("G3BaristerVibrissa","GLOBAL",0)
      Global("G3FredVibrissa","GLOBAL",0)~ REPLY @10519 GOTO WhyVibrissa
  IF ~OR(2)
        Global("G3BaristerVibrissa","GLOBAL",1)
        GlobalGT("G3FredVibrissa","GLOBAL",0)~ REPLY @10520 GOTO WhyVibrissa
  IF ~~ REPLY @10521 GOTO SuitYourself
END

IF ~True()~ KidsPrattle SAY @10522
  IF ~~ EXIT
END

IF ~~ SuitYourself SAY @10479
  IF ~~ EXIT
END

IF ~~ Mojo SAY @10524
  IF ~~ DO ~TakePartyItem("G3JAVA1")
            DestroyItem("G3JAVA1")
            SetGlobal("G3JavaMojo","GLOBAL",1)~ EXIT
END

IF ~~ Charm SAY @10525
  IF ~~ EXIT
END

IF ~~ UpNorth SAY @10526
  IF ~~ EXIT
END

IF ~~ KelseyNotAtFault SAY @10527 = @10528
  IF ~~ REPLY @10529 GOTO IAmABard
  IF ~OR(2)
        Global("G3BaristerVibrissa","GLOBAL",1)
        Global("G3FredVibrissa","GLOBAL",1)~ REPLY @10530 GOTO IAmABard
  IF ~Global("G3BaristerVibrissa","GLOBAL",0)
      Global("G3FredVibrissa","GLOBAL",0)~ REPLY @10531 GOTO WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",1)
      Global("G3FredVibrissa","GLOBAL",0)~ REPLY @10532 GOTO WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",1)
      Global("G3FredVibrissa","GLOBAL",1)~ REPLY @10533 GOTO WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",0)
      Global("G3FredVibrissa","GLOBAL",1)~ REPLY @10534 GOTO WhyVibrissa
  IF ~~ REPLY @10535 GOTO SuitYourself
END

IF ~~ THEN BEGIN IAmABard SAY @10536
  IF ~~ REPLY @10537 GOTO MinscStory
  IF ~Global("G3BaristerVibrissa","GLOBAL",0)
      Global("G3FredVibrissa","GLOBAL",0)~ REPLY @10538 GOTO WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",1)
      Global("G3FredVibrissa","GLOBAL",0)~ REPLY @10539 GOTO WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",1)
      Global("G3FredVibrissa","GLOBAL",1)~ REPLY @10540 GOTO WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",0)
      Global("G3FredVibrissa","GLOBAL",1)~ REPLY @10541 GOTO WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",0)
      Global("G3FredVibrissa","GLOBAL",0)~ REPLY @10542 GOTO WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",1)
      Global("G3FredVibrissa","GLOBAL",0)~ REPLY @10543 GOTO WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",1)
      Global("G3FredVibrissa","GLOBAL",1)~ REPLY @10544 GOTO WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",0)
      Global("G3FredVibrissa","GLOBAL",1)~ REPLY @10545 GOTO WhyVibrissa
  IF ~InParty("Minsc")
      See("Minsc")
      !Dead("Minsc")
      !StateCheck("Minsc",CD_STATE_NOTVALID)~ EXTERN MINSCJ LadyBevMinscExchange
END

IF ~~ MinscStory SAY @10546
  IF ~Global("G3BaristerVibrissa","GLOBAL",0)
      Global("G3FredVibrissa","GLOBAL",0)~ REPLY @10531 GOTO WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",1)
      Global("G3FredVibrissa","GLOBAL",0)~ REPLY @10532 GOTO WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",1)
      Global("G3FredVibrissa","GLOBAL",1)~ REPLY @10533 GOTO WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",0)
      Global("G3FredVibrissa","GLOBAL",1)~ REPLY @10534 GOTO WhyVibrissa
  IF ~~ REPLY @10535 GOTO SuitYourself
END

IF ~~ WhyVibrissa SAY @10547
  IF ~Global("G3FredVibrissa","GLOBAL",1)~ REPLY @10548 DO ~SetGlobal("G3FredVibrissa","GLOBAL",2)~ GOTO FredSays
  IF ~OR(2)
        Global("G3FredVibrissa","GLOBAL",2)
        Global("G3BevAvariel","GLOBAL",1)~ REPLY @10549 GOTO Rude
  IF ~~ REPLY @10550 GOTO SummonG3
  IF ~~ REPLY @10551 GOTO ErrandPro
  IF ~~ REPLY @10552 GOTO ErrandPro
END

IF ~~ NotAware SAY @10553
  IF ~~ REPLY @10554 GOTO WhyVibrissa
  IF ~~ REPLY @10555 GOTO SuitYourself
END

IF ~~ SummonG3 SAY @10556
  IF ~~ REPLY @10557 GOTO Primo
  IF ~~ REPLY @10558 GOTO Primo
  IF ~Global("G3FredVibrissa","GLOBAL",0)~ REPLY @10559 GOTO Vibrissa
END

IF ~~ ErrandPro SAY @10560
  IF ~Global("G3BevAvariel","GLOBAL",0)~ REPLY @10561 DO ~SetGlobal("G3BevAvariel","GLOBAL",1)~ GOTO Avariel
  IF ~~ REPLY @10562 GOTO Vibrissa
  IF ~Global("G3FredVibrissa","GLOBAL",0)~ REPLY @10563 GOTO Vibrissa
  IF ~Global("G3FredVibrissa","GLOBAL",1)~ REPLY @10564 GOTO Vibrissa
  IF ~~ REPLY @10565 GOTO SuitYourself
END

IF ~~ Avariel SAY @10566
  IF ~~ REPLY @10567 GOTO Poem
  IF ~Global("G3BaristerVibrissa","GLOBAL",0)
      Global("G3FredVibrissa","GLOBAL",0)~ REPLY @10538 GOTO WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",1)
      Global("G3FredVibrissa","GLOBAL",0)~ REPLY @10539 GOTO WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",1)
      Global("G3FredVibrissa","GLOBAL",1)~ REPLY @10540 GOTO WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",0)
      Global("G3FredVibrissa","GLOBAL",1)~ REPLY @10541 GOTO WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",0)
      Global("G3FredVibrissa","GLOBAL",0)~ REPLY @10542 GOTO WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",1)
      Global("G3FredVibrissa","GLOBAL",0)~ REPLY @10543 GOTO WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",1)
      Global("G3FredVibrissa","GLOBAL",1)~ REPLY @10544 GOTO WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",0)
      Global("G3FredVibrissa","GLOBAL",1)~ REPLY @10545 GOTO WhyVibrissa
END

IF ~~ Poem SAY @10568 = @10569 = @10570 = @10571 = @10572 = @10573
  IF ~Global("G3BaristerVibrissa","GLOBAL",0)
      Global("G3FredVibrissa","GLOBAL",0)~ REPLY @10519 GOTO WhyVibrissa
  IF ~OR(2)
        Global("G3BaristerVibrissa","GLOBAL",1)
        GlobalGT("G3FredVibrissa","GLOBAL",0)~ REPLY @10520 GOTO WhyVibrissa
  IF ~~ REPLY @10574 GOTO SuitYourself
END

IF ~~ Rude SAY @10575
  IF ~~ GOTO Vibrissa
END

IF ~~ Vibrissa SAY @10576
  IF ~~ REPLY @10577 GOTO NotApprove
  IF ~Global("G3FredVibrissa","GLOBAL",1)~ REPLY @10578 GOTO Primo
  IF ~~ REPLY @10579 GOTO Primo
  IF ~~ REPLY @10580 GOTO Primo
  IF ~~ REPLY @10581 GOTO Primo
END

IF ~~ NotApprove SAY @10582
  IF ~~ GOTO Primo
END

IF ~~ Primo SAY @10583
  IF ~~ EXTERN ~G3JAVA02~ HaludakBeans
END

/////                                                  \\\\\
///// Halulak                                          \\\\\
/////                                                  \\\\\

BEGIN ~G3JAVA01~

IF ~!HasItem("G3JAVA1",Myself)
    Global("G3PrimoJava","GLOBAL",0)~ Pickpocketed SAY @10594
  IF ~~ EXIT
END

IF ~True()~ Eh SAY @10595
  IF ~Global("G3HaludakActivated","GLOBAL",1)
      Global("G3PrimoJava","GLOBAL",0)~ REPLY @10596 DO ~SetGlobal("G3HaludakTalk","GLOBAL",1)~ GOTO What
  IF ~Global("G3HaludakActivated","GLOBAL",1)
      Global("G3PrimoJava","GLOBAL",0)~ REPLY @10597 DO ~SetGlobal("G3HaludakTalk","GLOBAL",1)~ GOTO G3HalulakHmmph
  IF ~OR(2)
        Global("G3HaludakActivated","GLOBAL",0)
        Global("G3PrimoJava","GLOBAL",1)~ DO ~SetGlobal("G3HaludakTalk","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN G3HalulakHmmph SAY @10750
  IF ~~ THEN EXIT
END

IF ~~ What SAY @10598
  IF ~~ REPLY @10596 GOTO No
  IF ~~ REPLY @10597 GOTO G3HalulakHmmph
END

IF ~~ No SAY @10599
  IF ~~ REPLY @10600 GOTO Purchase
  IF ~~ REPLY @10601 EXTERN ~G3BEV~ Blood
  IF ~~ REPLY @10602 GOTO Supplier
END

IF ~~ Protected SAY @10603
  IF ~~ REPLY @10604 EXTERN ~G3BEV~ Stop
  IF ~~ REPLY @10605 GOTO Purchase
  IF ~~ REPLY @10606 EXTERN ~G3JAVA02~ Help
  IF ~~ REPLY @10607 GOTO Supplier
END

IF ~~ Purchase SAY @10608
  IF ~Global("G3BribeBarister","GLOBAL",0)~ REPLY @10609 EXTERN ~G3JAVA02~ Bribe
  IF ~~ REPLY @10606 EXTERN ~G3JAVA02~ Help
  IF ~GlobalLT("G3JavaSupplier","GLOBAL",1)~ REPLY @10610 GOTO Supplier
  IF ~PartyGoldGT(9)~ REPLY @10611 GOTO 10Gold
  IF ~PartyGoldGT(49)
      CheckStatGT(LastTalkedToBy,16,CHR)
      Global("G3JavaSupplier","GLOBAL",0)~ REPLY @10612 GOTO 50GoldYes1
  IF ~PartyGoldGT(49)
      CheckStatGT(LastTalkedToBy,16,CHR)
      GlobalGT("G3JavaSupplier","GLOBAL",0)~ REPLY @10612 GOTO 50GoldYes2
  IF ~PartyGoldGT(49)
      CheckStatLT(LastTalkedToBy,17,CHR)~ REPLY @10612 GOTO 50GoldNo
  IF ~PartyGoldGT(99)~ REPLY @10613 GOTO 100Gold1
END

IF ~~ Supplier SAY @10614
    = @10615
   IF ~~ REPLY @10616 GOTO Mujai
   IF ~~ REPLY @10617 GOTO Purchase
   IF ~Global("G3LadyBevBloodSpeech","GLOBAL",0)~ REPLY @10618 EXTERN ~G3BEV~ Blood
   IF ~Global("G3LadyBevBloodSpeech","GLOBAL",1)~ REPLY @10618 EXTERN ~G3BEV~ Stop
END

IF ~~ Mujai SAY @10619
  IF ~~ REPLY @10617 GOTO Purchase
  IF ~Global("G3LadyBevBloodSpeech","GLOBAL",0)~ REPLY @10618 EXTERN ~G3BEV~ Blood
  IF ~Global("G3LadyBevBloodSpeech","GLOBAL",1)~ REPLY @10618 EXTERN ~G3BEV~ Stop
END

IF ~~ 10Gold SAY @10620
  IF ~Global("G3BribeBarister","GLOBAL",0)~ REPLY @10609 EXTERN ~G3JAVA02~ Bribe
  IF ~GlobalLT("G3JavaSupplier","GLOBAL",1)~ REPLY @10610 GOTO Supplier
  IF ~PartyGoldGT(49)
      CheckStatGT(LastTalkedToBy,16,CHR)
      Global("G3JavaSupplier","GLOBAL",0)
      Global("G3LadyBevBloodSpeech","GLOBAL",0)~ REPLY @10612 GOTO 50GoldYes1
  IF ~PartyGoldGT(49)
      CheckStatGT(LastTalkedToBy,16,CHR)
      GlobalGT("G3JavaSupplier","GLOBAL",0)
      Global("G3LadyBevBloodSpeech","GLOBAL",0)~ REPLY @10612 GOTO 50GoldYes2
  IF ~PartyGoldGT(49)
      CheckStatLT(LastTalkedToBy,17,CHR)~ REPLY @10612 GOTO 50GoldNo
  IF ~PartyGoldGT(99)~ REPLY @10613 GOTO 100Gold1
END

IF ~~ 50GoldYes1 SAY @10621
   IF ~~ DO ~TakePartyGold(50)
             GiveItem("G3JAVA1",LastTalkedToBy)
             SetGlobal("G3PrimoJava","GLOBAL",1)~ EXIT
END

IF ~~ 50GoldYes2 SAY @10622
   IF ~~ DO ~TakePartyGold(50)
             GiveItem("G3JAVA1",LastTalkedToBy)
             SetGlobal("G3PrimoJava","GLOBAL",1)~ EXIT
END

IF ~~ 50GoldNo SAY @10623
  IF ~Global("G3BribeBarister","GLOBAL",0)~ REPLY @10609 EXTERN ~G3JAVA02~ Bribe
  IF ~GlobalLT("G3JavaSupplier","GLOBAL",1)~ REPLY @10610 GOTO Supplier
  IF ~PartyGoldGT(99)~ REPLY @10613 GOTO 100Gold1
END

IF ~~ 100Gold1 SAY @10624
   IF ~~ DO ~TakePartyGold(100)
             GiveItem("G3JAVA1",LastTalkedToBy)
             SetGlobal("G3PrimoJava","GLOBAL",1)~ EXIT
END

IF ~~ 100Gold2 SAY @10625
   IF ~~ DO ~TakePartyGold(100)
             ActionOverride("G3Barister",GiveItem("G3JAVA1",LastTalkedToBy))
             SetGlobal("G3PrimoJava","GLOBAL",1)~ EXIT
END

/////                                                  \\\\\
///// Barister                                         \\\\\
/////                                                  \\\\\

BEGIN G3JAVA02

IF ~True()~ Welcome SAY @10652
  IF ~Global("G3MaheerShop","GLOBAL",1)~ REPLY @10653 DO ~SetGlobal("G3MaheerShop","GLOBAL",2)~ GOTO Maheer
  IF ~Global("G3HaludakTalk","GLOBAL",0)~ REPLY @10654 DO ~SetGlobal("G3HaludakTalk","GLOBAL",1)~ GOTO Haludak
  IF ~GlobalGT("G3LadyBevActivated","GLOBAL",0)
      GlobalLT("G3JavaMojo","GLOBAL",2)~ REPLY @10655 DO ~SetGlobal("G3BaristerVibrissa","GLOBAL",1)~ GOTO Vibrissa
  IF ~~ REPLY @10656 GOTO Store
  IF ~~ REPLY @10657 GOTO G3NoOrderExit
END

IF ~~ Maheer SAY @10658
  IF ~~ REPLY @10659 GOTO G3OtherExit
  IF ~~ REPLY @10660 GOTO Store
  IF ~Global("G3HaludakTalk","GLOBAL",0)~ REPLY @10661 GOTO Haludak
  IF ~GlobalGT("G3LadyBevActivated","GLOBAL",0)
      GlobalLT("G3JavaMojo","GLOBAL",2)~ REPLY @10662 DO ~SetGlobal("G3BaristerVibrissa","GLOBAL",1)~ GOTO Vibrissa
END

IF ~~ Haludak SAY @10663
  IF ~~ REPLY @10664 GOTO CaffineOverdose
  IF ~~ REPLY @10665 GOTO WiseChoice
  IF ~~ REPLY @10666 GOTO Store
END

IF ~~ CaffineOverdose SAY @10667
  IF ~~ REPLY @10668 GOTO G3NoOrderExit
  IF ~~ REPLY @10669 GOTO Store
END

IF ~~ WiseChoice SAY @10670
  IF ~~ REPLY @10671 GOTO G3NoOrderExit
  IF ~GlobalGT("G3LadyBevActivated","GLOBAL",0)
      GlobalLT("G3JavaMojo","GLOBAL",2)~ REPLY @10672 DO ~SetGlobal("G3BaristerVibrissa","GLOBAL",1)~ GOTO Vibrissa
  IF ~Global("G3MaheerShop","GLOBAL",1)~ REPLY @10673 DO ~SetGlobal("G3MaheerShop","GLOBAL",2)~ GOTO Maheer
  IF ~~ REPLY @10674 GOTO Store
END

IF ~~ Vibrissa SAY @10675 = @10676
  IF ~~ REPLY @10677 GOTO G3OtherExit
  IF ~Global("G3HaludakTalk","GLOBAL",0)~ REPLY @10678 DO ~SetGlobal("G3HaludakTalk","GLOBAL",2)~ GOTO Haludak
  IF ~Global("G3MaheerShop","GLOBAL",1)~ REPLY @10679 DO ~SetGlobal("G3MaheerShop","GLOBAL",2)~ GOTO Maheer
  IF ~~ REPLY @10680 GOTO Store
END

IF ~~ Store SAY @10681
  IF ~~ DO ~StartStore("G3JAVA",LastTalkedToBy)~ EXIT
END

IF ~~ Do50Gold SAY @10682
  IF ~~ DO ~TakePartyGold(50)
            DestroyGold(50)
            GiveItem("G3JAVA1",LastTalkedToBy)
            SetGlobal("G3PrimoJava","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN G3NoOrderExit SAY @10751
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN G3OtherExit SAY @10752
  IF ~~ THEN EXIT
END

/////                                                  \\\\\
///// Writer                                           \\\\\
/////                                                  \\\\\

BEGIN G3JAVA03

IF ~RandomNum(3,1)~ Writer1 SAY @10683
  IF ~~ EXIT
END

IF ~RandomNum(3,2)~ Writer2 SAY @10684
  IF ~~ EXIT
END

IF ~RandomNum(3,3)~ Writer3 SAY @10685
  IF ~~ EXIT
END

/////                                                  \\\\\
///// Fred                                             \\\\\
/////                                                  \\\\\

BEGIN ~G3JAVA04~

IF ~RandomNum(5,1)~ Java SAY @10686
  IF ~GlobalGT("G3LadyBevActivated","GLOBAL",0)
      GlobalLT("G3FredVibrissa","GLOBAL",2)~ GOTO WantSomething
  IF ~Global("G3LadyBevActivated","GLOBAL",0)~ EXIT
END

IF ~RandomNum(5,2)~ Caf SAY @10687
  IF ~GlobalGT("G3LadyBevActivated","GLOBAL",0)
      GlobalLT("G3FredVibrissa","GLOBAL",2)~ GOTO WantSomething
  IF ~Global("G3LadyBevActivated","GLOBAL",0)~ EXIT
END

IF ~RandomNum(5,3)~ Tisane SAY @10688
  IF ~GlobalGT("G3LadyBevActivated","GLOBAL",0)
      GlobalLT("G3FredVibrissa","GLOBAL",2)~ GOTO WantSomething
  IF ~Global("G3LadyBevActivated","GLOBAL",0)~ EXIT
END

IF ~RandomNum(5,4)~ Chai SAY @10689
  IF ~GlobalGT("G3LadyBevActivated","GLOBAL",0)
      GlobalLT("G3FredVibrissa","GLOBAL",2)~ GOTO WantSomething
  IF ~Global("G3LadyBevActivated","GLOBAL",0)~ EXIT
END

IF ~RandomNum(5,5)~ Coca SAY @10690
  IF ~GlobalGT("G3LadyBevActivated","GLOBAL",0)
      GlobalLT("G3FredVibrissa","GLOBAL",2)~ GOTO WantSomething
  IF ~Global("G3LadyBevActivated","GLOBAL",0)~ EXIT
END

IF ~~ WantSomething SAY @10691
  IF ~Global("G3FredVibrissa","GLOBAL",0)~ REPLY @10692 DO ~SetGlobal("FredVibrissa","GLOBAL",1)~ GOTO Vibrissa1
  IF ~Global("G3FredVibrissa","GLOBAL",1)~ REPLY @10692 GOTO Vibrissa2
  IF ~~ REPLY @10521 GOTO G3Java04Exit
END

IF ~~ THEN BEGIN G3Java04Exit SAY @10753
  IF ~~ THEN EXIT
END

IF ~~ Vibrissa1 SAY @10693 = @10694
  IF ~~ EXIT
END

IF ~~ Vibrissa2 SAY @10695
  IF ~~ GOTO Vibrissa1
END

/////                                                  \\\\\
///// G3DRINI                                          \\\\\
/////                                                  \\\\\

BEGIN G3DRINI

IF ~NumTimesTalkedToGT(0)
    AreaCheck("AR0406")~ THEN BEGIN ReturnToDrini SAY @10205
  IF ~PartyHasItem("G3DRINK3")
      OR(5)
        !PartyHasItem("G3DRINK1")
        !PartyHasItem("G3DRINK4")
        !PartyHasItem("G3DRINK5")
        !PartyHasItem("G3DRINK6")
        !PartyHasItem("G3JAVA2")~ THEN REPLY @11171 GOTO Poisoned
  IF ~PartyHasItem("G3DRINK1")
      PartyHasItem("G3DRINK4")
      PartyHasItem("G3DRINK5")
      PartyHasItem("G3DRINK6")
      PartyHasItem("G3DRINK3")
      PartyHasItem("G3JAVA2")~ THEN REPLY @11174 GOTO AlmostButPoisoned
  IF ~PartyHasItem("G3DRINK1")
      PartyHasItem("G3DRINK4")
      PartyHasItem("G3DRINK5")
      PartyHasItem("G3DRINK6")
      PartyHasItem("G3DRINK7")
      PartyHasItem("G3JAVA2")~ THEN REPLY @10206 DO ~TakePartyItem("G3Drink1")
                                                   TakePartyItem("G3Drink4")
                                                   TakePartyItem("G3Drink5")
                                                   TakePartyItem("G3Drink6")
                                                   TakePartyItem("G3Drink7")
                                                   TakePartyItem("G3JAVA2")
                                                   TakePartyItem("G3list")~ GOTO G3DriniPartyHasAll
  IF ~~ THEN REPLY @10207 GOTO NotGotAll
  IF ~PartyHasItem("G3DRINK1")
      PartyHasItem("G3DRINK4")
      PartyHasItem("G3DRINK5")
      PartyHasItem("G3DRINK6")
      PartyHasItem("G3DRINK7")
      PartyHasItem("G3JAVA2")~ THEN REPLY @10208 DO ~TakePartyItem("G3Drink1")
                                                   TakePartyItem("G3Drink4")
                                                   TakePartyItem("G3Drink5")
                                                   TakePartyItem("G3Drink6")
                                                   TakePartyItem("G3Drink7")
                                                   TakePartyItem("G3JAVA2")
                                                   TakePartyItem("G3list")~ GOTO G3DriniPartyHasAll
  IF ~~ THEN REPLY @10209 GOTO NotGotAll
END

IF ~~ THEN BEGIN Poisoned SAY @11172 = @11173
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN AlmostButPoisoned SAY @11174 = @11175
  IF ~~ THEN EXIT
END

IF ~AreaCheck("AR0406")
    NumTimesTalkedTo(0)
    OR(3)
      !See("Salvanas")
      Dead("Salvanas")
      StateCheck("Salvanas",CD_STATE_NOTVALID)~ THEN BEGIN FirstDriniChatNoSalvanas SAY @11134
  IF ~~ THEN EXTERN ~G3MAID~ BarTabNoSalvanas
END

IF ~NumTimesTalkedTo(0)
    AreaCheck("AR0406")~ THEN BEGIN FirstDriniChat SAY @10210
  IF ~~ THEN EXTERN G3MAID BarTab
END

IF ~~ THEN BEGIN PersuadeNoSalvanas SAY @10214
  IF ~~ THEN REPLY @10216 GOTO RunAwayNow
  IF ~~ THEN REPLY @10218 GOTO RunAwayNow
END

IF ~~ THEN BEGIN NotGotAll SAY @10211 = @10212 = @10213
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Persuade SAY @10214
  IF ~~ THEN REPLY @10215 GOTO InitialOffer
  IF ~~ THEN REPLY @10216 GOTO RunAwayNow
  IF ~~ THEN REPLY @10217 GOTO InitialOffer
  IF ~~ THEN REPLY @10218 GOTO RunAwayNow
  IF ~~ THEN REPLY @10219 GOTO InitialOffer
END

IF ~~ THEN BEGIN NameDescribe SAY @10220
  IF ~~ THEN GOTO Describe
END

IF ~~ THEN BEGIN NoNameDescribe SAY @10221
  IF ~~ THEN GOTO Describe
END

IF ~~ THEN BEGIN Describe SAY @10222 = @10223 = @10224
  IF ~~ THEN REPLY @10225 GOTO Scam
  IF ~~ THEN REPLY @10226 GOTO RunAwayNow
  IF ~~ THEN REPLY @10227 GOTO Cost
END

IF ~~ THEN BEGIN Scam SAY @10228
  IF ~~ THEN REPLY @10229 GOTO Cost
END

IF ~~ THEN BEGIN TheJob SAY @10230 
  IF ~~ THEN GOTO TheJob2
  IF ~InParty("Edwin")
      See("Edwin")
      !Dead("Edwin")
      !StateCheck("Edwin",CD_STATE_NOTVALID)~ EXTERN EDWINJ DriniIJ1
END

IF ~~ THEN BEGIN TheJob2 SAY @10231
  IF ~Global("G3DriniAppearances","LOCALS",0)~ THEN REPLY @10232 DO ~SetGlobal("G3DriniAppearances","LOCALS",1)~ GOTO Appearances
  IF ~Global("G3DriniFearsome","LOCALS",0)~ THEN REPLY @10233 DO ~SetGlobal("G3DriniFearsome","LOCALS",1)~ GOTO Fearsome
  IF ~Global("G3DriniTheList","LOCALS",0)~ THEN REPLY @10234 DO ~SetGlobal("G3DriniTheList","LOCALS",1)~ GOTO TheList
  IF ~Global("G3DriniHelpers","LOCALS",0)~ THEN REPLY @10235 DO ~SetGlobal("G3DriniHelpers","LOCALS",1)~ GOTO Helpers
  IF ~Global("G3DriniEmployer","LOCALS",0)~ THEN REPLY @10236 DO ~SetGlobal("G3DriniEmployer","LOCALS",1)~ GOTO Employer
  IF ~Global("G3DriniTheList2","LOCALS",0)~ THEN REPLY @10237 DO ~SetGlobal("G3DriniTheList2","LOCALS",1)~ GOTO TheList
END

IF ~~ THEN BEGIN Appearances SAY @10238
  IF ~Global("G3DriniFearsome","LOCALS",0)~ THEN REPLY @10233 DO ~SetGlobal("G3DriniFearsome","LOCALS",1)~ GOTO Fearsome
  IF ~Global("G3DriniTheList","LOCALS",0)~ THEN REPLY @10234 DO ~SetGlobal("G3DriniTheList","LOCALS",1)~ GOTO TheList
  IF ~Global("G3DriniHelpers","LOCALS",0)~ THEN REPLY @10235 DO ~SetGlobal("G3DriniHelpers","LOCALS",1)~ GOTO Helpers
  IF ~Global("G3DriniEmployer","LOCALS",0)~ THEN REPLY @10236 DO ~SetGlobal("G3DriniEmployer","LOCALS",1)~ GOTO Employer
  IF ~Global("G3DriniTheList2","LOCALS",0)~ THEN REPLY @10237 DO ~SetGlobal("G3DriniTheList2","LOCALS",1)~ GOTO TheList
END

IF ~~ THEN BEGIN Fearsome SAY @10239
  IF ~Global("G3DriniAppearances","LOCALS",0)~ THEN REPLY @10232 DO ~SetGlobal("G3DriniAppearances","LOCALS",1)~ GOTO Appearances
  IF ~Global("G3DriniTheList","LOCALS",0)~ THEN REPLY @10234 DO ~SetGlobal("G3DriniTheList","LOCALS",1)~ GOTO TheList
  IF ~Global("G3DriniHelpers","LOCALS",0)~ THEN REPLY @10235 DO ~SetGlobal("G3DriniHelpers","LOCALS",1)~ GOTO Helpers
  IF ~Global("G3DriniEmployer","LOCALS",0)~ THEN REPLY @10236 DO ~SetGlobal("G3DriniEmployer","LOCALS",1)~ GOTO Employer
  IF ~Global("G3DriniTheList2","LOCALS",0)~ THEN REPLY @10237 DO ~SetGlobal("G3DriniTheList2","LOCALS",1)~ GOTO TheList
END

IF ~~ THEN BEGIN Helpers SAY @10240
  IF ~Global("G3DriniAppearances","LOCALS",0)~ THEN REPLY @10232 DO ~SetGlobal("G3DriniAppearances","LOCALS",1)~ GOTO Appearances
  IF ~Global("G3DriniFearsome","LOCALS",0)~ THEN REPLY @10233 DO ~SetGlobal("G3DriniFearsome","LOCALS",1)~ GOTO Fearsome
  IF ~Global("G3DriniTheList","LOCALS",0)~ THEN REPLY @10234 DO ~SetGlobal("G3DriniTheList","LOCALS",1)~ GOTO TheList
  IF ~Global("G3DriniEmployer","LOCALS",0)~ THEN REPLY @10236 DO ~SetGlobal("G3DriniEmployer","LOCALS",1)~ GOTO Employer
  IF ~Global("G3DriniTheList2","LOCALS",0)~ THEN REPLY @10237 DO ~SetGlobal("G3DriniTheList2","LOCALS",1)~ GOTO TheList
END

IF ~~ THEN BEGIN Employer SAY @10241 = @10242
  IF ~Global("G3DriniAppearances","LOCALS",0)~ THEN REPLY @10232 DO ~SetGlobal("G3DriniAppearances","LOCALS",1)~ GOTO Appearances
  IF ~Global("G3DriniFearsome","LOCALS",0)~ THEN REPLY @10233 DO ~SetGlobal("G3DriniFearsome","LOCALS",1)~ GOTO Fearsome
  IF ~Global("G3DriniTheList","LOCALS",0)~ THEN REPLY @10234 DO ~SetGlobal("G3DriniTheList","LOCALS",1)~ GOTO TheList
  IF ~Global("G3DriniHelpers","LOCALS",0)~ THEN REPLY @10235 DO ~SetGlobal("G3DriniHelpers","LOCALS",1)~ GOTO Helpers
  IF ~Global("G3DriniTheList2","LOCALS",0)~ THEN REPLY @10237 DO ~SetGlobal("G3DriniTheList2","LOCALS",1)~ GOTO TheList
END

IF ~~ THEN BEGIN TheList SAY @10243 = @10244
  IF ~~ THEN DO ~GiveItemCreate("G3LIST",LastTalkedToBy,1,0,0)~ GOTO FindSuleci
  IF ~InParty("Keldorn")
      See("Keldorn")
      !Dead("Keldorn")
      !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN DO ~GiveItemCreate("G3LIST",LastTalkedToBy,1,0,0)~ EXTERN KELDORJ G3KelSuleci
END

IF ~~ THEN BEGIN FindSuleci SAY @10245
  IF ~~ THEN REPLY @10246 GOTO StayingPut
  IF ~~ THEN REPLY @10247 GOTO OffOnTheQuest
END

IF ~~ THEN BEGIN StayingPut SAY @10248 = @10249 = @10250 = @10251 = @10252
  IF ~~ THEN REPLY @10247 GOTO OffOnTheQuest
END

IF ~~ THEN BEGIN OffOnTheQuest SAY @10253 = @10254
  IF ~~ THEN DO ~SetGlobal("G3SuleciActivated","GLOBAL",1)~ UNSOLVED_JOURNAL @19989 EXIT
END

IF ~~ THEN BEGIN G3DriniPartyHasAll SAY @10045 = @10046
  IF ~~ THEN REPLY @10047 GOTO G3DriniImpatient
  IF ~~ THEN REPLY @10048 DO ~SetGlobal("G3DriniMyWine","LOCALS",1)~ GOTO G3DriniMyWine
  IF ~~ THEN REPLY @10049 GOTO G3DriniImpatient
  IF ~~ THEN REPLY @10050 DO ~SetGlobal("G3DriniInTheMood","LOCALS",1)~ GOTO G3DriniInTheMood
  IF ~InParty("Jaheira")
      See("Jaheira")
      !Dead("Jaheira")
      !StateCheck("Jaheira",CD_STATE_NOTVALID)~ EXTERN JAHEIRAJ G3DriniJaheiraIJ
  IF ~InParty("Anomen")
      See("Anomen")
      !Dead("Anomen")
      !StateCheck("Anomen",CD_STATE_NOTVALID)~ EXTERN ANOMENJ G3DriniAnomenIJ
END

IF ~~ THEN BEGIN G3DriniImpatient SAY @10054
  IF ~~ THEN DO ~ClearAllActions()
                 StartCutSceneMode()
                 StartCutScene("G3Cut001")~ EXIT
END

IF ~~ THEN BEGIN G3DriniMyWine SAY @10055
  IF ~~ THEN REPLY @10047 GOTO G3DriniImpatient
  IF ~~ THEN REPLY @10049 GOTO G3DriniImpatient
  IF ~Global("G3DriniInTheMood","LOCALS",0)~ THEN REPLY @10050 DO ~SetGlobal("G3DriniInTheMood","LOCALS",1)~ GOTO G3DriniInTheMood
END

IF ~~ THEN BEGIN G3DriniInTheMood SAY @10056
  IF ~~ THEN REPLY @10047 GOTO G3DriniImpatient
  IF ~Global("G3DriniMyWine","LOCALS",0)~ THEN REPLY @10048 DO ~SetGlobal("G3DriniMyWine","LOCALS",1)~ GOTO G3DriniMyWine
  IF ~~ THEN REPLY @10049 GOTO G3DriniImpatient
END

IF ~~ THEN BEGIN RandomState SAY @10276
  IF ~~ THEN REPLY @10277 EXTERN G3DRINI NameDescribe
  IF ~~ THEN REPLY @10278 EXTERN G3DRINI RunAwayNow
  IF ~~ THEN REPLY @10279 EXTERN G3DRINI NoNameDescribe
END

IF ~~ THEN BEGIN RunAwayNow SAY @10255
  IF ~~ THEN JOURNAL @19990 GOTO RunAwayNow2
END

/////                                                  \\\\\
///// Mrs. The Unmanned                                \\\\\
/////                                                  \\\\\

BEGIN G3MRSGTU

IF ~~ THEN BEGIN G3SummonAlready SAY @10068 = @10069
  IF ~~ THEN GOTO G3SummonAlreadyCont // broken here to give Delainy a clean interject location
END

IF ~~ THEN BEGIN G3SummonAlreadyCont SAY @10070
  IF ~GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~ THEN REPLY @10071 DO ~SetGlobal("G3NoClueDradeel","LOCALS",1)~ GOTO G3NoClueDradeel
  IF ~GlobalGT("Chapter","GLOBAL",%bg2_chapter_3%)~ THEN REPLY @10072 DO ~SetGlobal("G3MetDradeel","LOCALS",1)~ GOTO G3MetDradeelSH
  IF ~~ THEN REPLY @10073 DO ~SetGlobal("G3MetDradeel","LOCALS",1)~ GOTO G3MetDradeelTotSC
  IF ~~ THEN REPLY @10074 GOTO G3HowToHelp
  IF ~~ THEN REPLY @10075 DO ~SetGlobal("G3RewardPlzKThxBye","LOCALS",1)~ GOTO G3RewardPlzKThxBye
  IF ~~ THEN REPLY @10076 DO ~SetGlobal("G3WhoAreG12","LOCALS",1)~ GOTO G3WhoAreG12
END

IF ~~ THEN BEGIN G3NoClueDradeel SAY @10077 = @10078
  IF ~GlobalGT("Chapter","GLOBAL",%bg2_chapter_3%)
      Global("G3MetDradeel","LOCALS",0)~ THEN REPLY @10072 DO ~SetGlobal("G3MetDradeel","LOCALS",1)~ GOTO G3MetDradeelSH
  IF ~Global("G3MetDradeel","LOCALS",0)~ THEN REPLY @10073 DO ~SetGlobal("G3MetDradeel","LOCALS",1)~ GOTO G3MetDradeelTotSC
  IF ~~ THEN REPLY @10074 GOTO G3HowToHelp
  IF ~Global("G3RewardPlzKThxBye","LOCALS",0)~ THEN REPLY @10075 DO ~SetGlobal("G3RewardPlzKThxBye","LOCALS",1)~ GOTO G3RewardPlzKThxBye
  IF ~Global("G3WhoAreG12","LOCALS",0)~ THEN REPLY @10076 DO ~SetGlobal("G3WhoAreG12","LOCALS",1)~ GOTO G3WhoAreG12
  IF ~~ THEN REPLY @10079 GOTO G3GiveRewardAndEndQuest
END

IF ~~ THEN BEGIN G3MetDradeelSH SAY @10080
  IF ~~ THEN REPLY @10074 GOTO G3HowToHelp
  IF ~Global("G3RewardPlzKThxBye","LOCALS",0)~ THEN REPLY @10075 DO ~SetGlobal("G3RewardPlzKThxBye","LOCALS",1)~ GOTO G3RewardPlzKThxBye
  IF ~Global("G3WhoAreG12","LOCALS",0)~ THEN REPLY @10076 DO ~SetGlobal("G3WhoAreG12","LOCALS",1)~ GOTO G3WhoAreG12
  IF ~~ THEN REPLY @10079 GOTO G3GiveRewardAndEndQuest
END

IF ~~ THEN BEGIN G3MetDradeelTotSC SAY @10081
  IF ~~ THEN REPLY @10074 GOTO G3HowToHelp
  IF ~Global("G3RewardPlzKThxBye","LOCALS",0)~ THEN REPLY @10075 DO ~SetGlobal("G3RewardPlzKThxBye","LOCALS",1)~ GOTO G3RewardPlzKThxBye
  IF ~Global("G3WhoAreG12","LOCALS",0)~ THEN REPLY @10076 DO ~SetGlobal("G3WhoAreG12","LOCALS",1)~ GOTO G3WhoAreG12
  IF ~~ THEN REPLY @10079 GOTO G3GiveRewardAndEndQuest
END

IF ~~ THEN BEGIN G3RewardPlzKThxBye SAY @10088
  IF ~~ THEN REPLY @10089 GOTO G3HowToHelp
  IF ~~ THEN REPLY @10087 GOTO G3GiveRewardAndEndQuest
END

IF ~~ THEN BEGIN G3WhoAreG12 SAY @10090 = @10091
  IF ~GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)
      Global("G3NoClueDradeel","LOCALS",0)~ THEN REPLY @10071 DO ~SetGlobal("G3NoClueDradeel","LOCALS",1)~ GOTO G3NoClueDradeel
  IF ~GlobalGT("Chapter","GLOBAL",%bg2_chapter_3%)
      Global("G3MetDradeel","LOCALS",0)~ THEN REPLY @10072 DO ~SetGlobal("G3MetDradeel","LOCALS",1)~ GOTO G3MetDradeelSH
  IF ~Global("G3MetDradeel","LOCALS",0)~ THEN REPLY @10073 DO ~SetGlobal("G3MetDradeel","LOCALS",1)~ GOTO G3MetDradeelTotSC
  IF ~~ THEN REPLY @10074 GOTO G3HowToHelp
  IF ~Global("G3RewardPlzKThxBye","LOCALS",0)~ THEN REPLY @10075 DO ~SetGlobal("G3RewardPlzKThxBye","LOCALS",1)~ GOTO G3RewardPlzKThxBye
END

IF ~~ THEN BEGIN G3GiveRewardAndEndQuest SAY @10092 = @10093
  IF ~~ THEN DO ~GiveGoldForce(800)
                 AddJournalEntry(@19985,QUEST_DONE)
                 EraseJournalEntry(@19986)
                 EraseJournalEntry(@19987)
                 EraseJournalEntry(@19988)
                 EraseJournalEntry(@19989)
                 EraseJournalEntry(@19990)
                 EraseJournalEntry(@19991)
                 EraseJournalEntry(@19992)
                 EraseJournalEntry(@19993)
                 EraseJournalEntry(@19994)
                 EraseJournalEntry(@19995)
                 EraseJournalEntry(@19996)
                 EraseJournalEntry(@19997)
                 EraseJournalEntry(@19998)
                 EraseJournalEntry(@19999)
                 SetInterrupt(FALSE)
                 EscapeArea()
                 ActionOverride("G3Drini",SetInterrupt(FALSE))
                 ActionOverride("G3Drini",EscapeArea())~ EXIT
END

/////                                                  \\\\\
///// Ari                                              \\\\\
/////                                                  \\\\\

BEGIN G3ARI

IF ~NumTimesTalkedTo(0)~ THEN BEGIN G3AriIntro SAY @10140
  IF ~~ THEN REPLY @10141 GOTO G3Ari_a
  IF ~PartyGoldGT(0)~ THEN DO ~TakePartyGold(1)~ REPLY @10142 GOTO G3Ari_b
  IF ~~ THEN REPLY @10143 DO ~SetGlobal("G3AriQuestGiven","LOCALS",1)~ GOTO G3Ari_c
  IF ~~ THEN REPLY @10144 GOTO G3Ari_d
//  IF ~~ THEN REPLY @10145 GOTO G3Ari_c
END

IF ~~ THEN BEGIN G3Ari_a SAY @10146
  IF ~~ THEN REPLY @10147 GOTO G3Ari_e
  IF ~~ THEN REPLY @10148 DO ~SetGlobal("G3AriQuestGiven","LOCALS",1)~ GOTO G3Ari_c
  IF ~~ THEN REPLY @10149 GOTO G3Ari_d
END

IF ~~ THEN BEGIN G3Ari_b SAY @10150
  IF ~~ THEN REPLY @10151 GOTO G3Ari_f
  IF ~~ THEN REPLY @10152 DO ~SetGlobal("G3AriQuestGiven","LOCALS",1)~ GOTO G3Ari_c
  IF ~~ THEN REPLY @10153 GOTO G3Ari_g
  IF ~~ THEN REPLY @10154 GOTO G3Ari_h
END

IF ~~ THEN BEGIN G3Ari_c SAY @10155 = @10156 = @10157 = @10158 = @10159 = @10160 = @10161 = @10162
  IF ~~ THEN REPLY @10163 GOTO G3Ari_i
  IF ~~ THEN REPLY @10164 GOTO G3Ari_j
  IF ~~ THEN REPLY @10165 GOTO G3Ari_k
  IF ~~ THEN REPLY @10166 GOTO G3Ari_h
  IF ~PartyHasItem("G3DRINK2")~ THEN REPLY @10201 GOTO G3AriHooray
END

IF ~~ THEN BEGIN G3Ari_d SAY @10167
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN G3Ari_e SAY @10168
  IF ~~ THEN REPLY @10169 DO ~SetGlobal("G3AriQuestGiven","LOCALS",1)~ GOTO G3Ari_c
  IF ~~ THEN REPLY @10170 DO ~SetGlobal("G3AriQuestGiven","LOCALS",1)~ GOTO G3Ari_c
  IF ~~ THEN REPLY @10171 GOTO G3Ari_k
END

IF ~~ THEN BEGIN G3Ari_f SAY @10172 = @10173
  IF ~~ THEN REPLY @10174 DO ~SetGlobal("G3AriQuestGiven","LOCALS",1)~ GOTO G3Ari_c
  IF ~~ THEN REPLY @10175 GOTO G3Ari_h
END

IF ~~ THEN BEGIN G3Ari_g SAY @10176
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN G3Ari_h SAY @10177
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN G3Ari_i SAY @10178
  IF ~~ THEN REPLY @10179 GOTO G3Ari_j
  IF ~~ THEN REPLY @10180 GOTO G3Ari_k
END

IF ~~ THEN BEGIN G3Ari_j SAY @10181
  IF ~~ THEN DO ~SetGlobal("G3AriQuest","AR0300",2)~ EXIT
END

IF ~~ THEN BEGIN G3Ari_k SAY @10182
  IF ~~ THEN EXIT
END

IF ~Global("G3AriQuest","AR0300",2)~ THEN BEGIN G3Ari2 SAY @10183
  IF ~PartyHasItem("G3DRINK2")~ THEN REPLY @10198 GOTO G3AriHooray
  IF ~~ THEN REPLY @10184 GOTO G3Ari2_a
  IF ~~ THEN REPLY @10185 GOTO G3Ari2_b
  IF ~~ THEN REPLY @10186 GOTO G3Ari2_c
  IF ~~ THEN REPLY @10187 GOTO G3Ari2_d
END

IF ~~ THEN BEGIN G3Ari2_a SAY @10188
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN G3Ari2_b SAY @10189
  IF ~PartyHasItem("G3DRINK2")~ THEN REPLY @10198 GOTO G3AriHooray
  IF ~~ THEN REPLY @10190 GOTO G3Ari2_a
  IF ~~ THEN REPLY @10191 GOTO G3Ari2_c
  IF ~~ THEN REPLY @10192 GOTO G3Ari2_e
END

IF ~~ THEN BEGIN G3Ari2_c SAY @10193
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN G3Ari2_d SAY @10195
  IF ~PartyHasItem("G3DRINK2")~ THEN REPLY @10198 GOTO G3AriHooray
  IF ~~ THEN REPLY @10196 GOTO G3Ari2_a
  IF ~~ THEN REPLY @10197 GOTO G3Ari2_c
END

IF ~~ THEN BEGIN G3Ari2_e SAY @10194
  IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~~ THEN BEGIN G3AriHooray SAY @10199 = @10200
  IF ~~ THEN DO ~SetInterrupt(FALSE)
                 TakePartyItem("g3drink2")
                 ReputationInc(1)
                 AddexperienceParty(1000)
                 EscapeArea()~ EXIT
END

IF ~True()~ THEN BEGIN G3NotAccepted SAY @10202
  IF ~PartyHasItem("G3DRINK2")~ THEN REPLY @10198 GOTO G3AriHooray
  IF ~Global("G3AriQuestGiven","LOCALS",1)~ THEN REPLY @10203 GOTO G3Ari_i
  IF ~!Global("G3AriQuestGiven","LOCALS",1)~ THEN REPLY @10203 GOTO G3Ari_c
  IF ~~ THEN REPLY @10204 GOTO G3Ari2_c
END

/////                                                  \\\\\
///// Monique                                          \\\\\
/////                                                  \\\\\

BEGIN G3MONIQ

IF ~NumTimesTalkedTo(0)~ THEN BEGIN G3MoniqInitial SAY @10305
  ++ @10306 DO ~SetGlobal("G3MoniqQuest","GLOBAL",4)~ + G3MoniqueBuggeroff
  ++ @10307 DO ~SetGlobal("G3MoniqQuest","GLOBAL",4)~ + DOSO1.1
  ++ @10308 DO ~SetGlobal("G3MoniqQuest","GLOBAL",4)~ + DOSO1.2
  ++ @10309 DO ~SetGlobal("G3MoniqQuest","GLOBAL",4)~ + DOSO1.3
  ++ @10310 DO ~SetGlobal("G3MoniqQuest","GLOBAL",4)~ + DOSO1.4
END

IF ~~ G3MoniqueBuggeroff SAY @10346
  IF ~~ THEN EXIT
END

IF ~~ DOSO1.1 SAY @10311
  ++ @10308 + DOSO1.2
  ++ @10309 + DOSO1.3
  ++ @10310 + DOSO1.4
END

IF ~~ DOSO1.2 SAY @10312 = @10044
  ++ @10313 + DOSO1.3
  ++ @10310 + DOSO1.4
  ++ @10314 + G3MoniqueBuggeroff
END

IF ~~ DOSO1.3 SAY @10315
  ++ @10316 + DOSO1.5
//  ++ @10317 + DOSO1.6
  ++ @10318 + G3MoniqueBuggeroff
  ++ @10319 + DOSO1.7
END

IF ~~ DOSO1.4 SAY @10320
  IF ~!NumInParty(1)~ THEN REPLY @10321 + DOSO1.8
  IF ~NumInParty(1)~ THEN REPLY @10347 + DOSO1.8
  ++ @10313 + DOSO1.3
  ++ @10322 + G3MoniqueBuggeroff
END

IF ~~ DOSO1.5 SAY @10323
  ++ @10324 + DOSO1.4
  ++ @10318 + G3MoniqueBuggeroff
  ++ @10319 + DOSO1.7
END
/*
IF ~~ DOSO1.6 SAY @10325
  ++ @10326 EXIT
  ++ @10324 + DOSO1.4
END
*/
IF ~~ DOSO1.7 SAY @10327 = @10328
  IF ~~ THEN EXIT
END

IF ~~ DOSO1.8 SAY @10329
  IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~Global("G3MoniqQuest","GLOBAL",5)
    RandomNum(5,1)~ Random1 SAY @10330 = @10331
  IF ~~ THEN EXIT
END

IF ~Global("G3MoniqQuest","GLOBAL",5)
    RandomNum(5,2)~ Random2 SAY @10332
  IF ~~ THEN EXIT
END

IF ~Global("G3MoniqQuest","GLOBAL",5)
    RandomNum(5,3)~ Random3 SAY @10333
  IF ~~ THEN EXIT
END

IF ~Global("G3MoniqQuest","GLOBAL",5)
    RandomNum(5,4)~ Random4 SAY @10334
  IF ~~ THEN EXIT
END

IF ~Global("G3MoniqQuest","GLOBAL",5)
    RandomNum(5,5)~ Random5 SAY @10335 = @10336 = @10337
  IF ~~ THEN EXIT
END

IF ~Global("G3MoniqQuest","GLOBAL",6)
    HasItem("G3DRINK3",Myself)~ G3DeathtoMonique SAY @10338 = @10339
  IF ~~ THEN DO ~SetGlobal("G3MoniqQuest","GLOBAL",7)
                 Kill("G3MONIQ")~ EXIT
END

IF ~Global("G3MoniqQuest","GLOBAL",6)
    !HasItem("G3DRINK3",Myself)~ G3MoniqueLives SAY @10340
  IF ~~ THEN DO ~SetGlobal("G3MoniqQuest","GLOBAL",7)
                 AddexperienceParty(1000)
                 SetInterrupt(FALSE)
                 EscapeArea()~ EXIT
END

/////                                                  \\\\\
///// Fitz                                             \\\\\
/////                                                  \\\\\

BEGIN G3FITZ

IF ~NumTimesTalkedTo(0)
!Global("G3FitzAgreesTalk","GLOBAL",1)
!Global("G3GrimAgreesTalk","GLOBAL",1)~ THEN BEGIN Fitz#1.1
SAY @10837
++ @10838 GOTO Fitz#1.2
++ @10839 GOTO Fitz#1.3
++ @10840 GOTO Fitz#1.4
++ @10841 GOTO Fitz#1.5
+ ~OR(2)
Global("G3ReturnLaterToGrim","GLOBAL",1)
Global("G3AgreedToKillFitz","GLOBAL",1)~ + @10842 GOTO Fitz#1.15
+ ~OR(2)
Global("G3ReturnLaterToGrim","GLOBAL",1)
Global("G3AgreedToKillFitz","GLOBAL",1)~ + @10843 GOTO Fitz#1.12
END

IF ~~ THEN BEGIN Fitz#1.2
SAY @10844
IF ~~ THEN GOTO Fitz#1.6
END

IF ~~ THEN BEGIN Fitz#1.3
SAY @10845
IF ~~ THEN GOTO Fitz#1.6
END

IF ~~ THEN BEGIN Fitz#1.4
SAY @10846
IF ~~ THEN GOTO Fitz#1.6
END

IF ~~ THEN BEGIN Fitz#1.5
SAY @10847
IF ~~ THEN GOTO Fitz#1.6
END

IF ~~ THEN BEGIN Fitz#1.6
SAY @10848
= @10849
++ @10850 GOTO Fitz#1.7
++ @10851 GOTO Fitz#1.8
++ @10852 GOTO Fitz#1.8
++ @10853 GOTO Fitz#1.8
++ @10854 GOTO Fitz#1.16
END

IF ~~ THEN BEGIN Fitz#1.7
SAY @10855
IF ~~ THEN GOTO Fitz#1.8
END

IF ~~ THEN BEGIN Fitz#1.8
SAY @10856
++ @10857 GOTO Fitz#1.10
++ @10858 GOTO Fitz#1.15
++ @10859 GOTO Fitz#1.10
++ @10860 GOTO Fitz#1.10
++ @10861 GOTO Fitz#1.9
END

IF ~~ THEN BEGIN Fitz#1.9
SAY @10862
= @10863
= @10864
= @10865
IF ~~ THEN DO ~SetGlobal("G3AgreedToKillGrim","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Fitz#1.10
SAY @10866
= @10867
= @10868
= @10869
= @10870
= @10871
= @10872
= @10873
++ @10874 GOTO Fitz#1.11
++ @10875 GOTO Fitz#1.11
++ @10876 GOTO Fitz#1.16
++ @10877 GOTO Fitz#1.13
++ @10878 GOTO Fitz#1.11
++ @10879 GOTO Fitz#1.16
++ @10880 GOTO Fitz#1.12
++ @10797 DO ~SetGlobal("G3ReturnLaterToFitz","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Fitz#1.11
SAY @10881
IF ~~ THEN DO ~SetGlobal("G3AgreedToKillGrim","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Fitz#1.12
SAY @10882
IF ~~ THEN DO ~SetGlobal("G3FoughtFitz","GLOBAL",1) Enemy()~ EXIT
END

IF ~~ THEN BEGIN Fitz#1.13
SAY @10883
++ @10884 GOTO Fitz#1.14
++ @10885 GOTO Fitz#1.14
++ @10886 GOTO Fitz#1.14
++ @10887 GOTO Fitz#1.14
++ @10888 GOTO Fitz#1.11
END

IF ~~ THEN BEGIN Fitz#1.14
SAY @10889
IF ~~ THEN DO ~SetGlobal("G3FitzAgreesTalk","GLOBAL",1)
StartCutScene("G3FtoG")~ EXIT
END

IF ~~ THEN BEGIN Fitz#1.15
SAY @10890
= @10891
++ @10874 GOTO Fitz#1.11
++ @10875 GOTO Fitz#1.11
++ @10877 GOTO Fitz#1.13
++ @10878 GOTO Fitz#1.11
++ @10879 GOTO Fitz#1.16
++ @10880 GOTO Fitz#1.12
++ @10797 DO ~SetGlobal("G3ReturnLaterToFitz","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Fitz#1.16
SAY @10892
IF ~~ THEN EXIT
END

IF ~Dead("G3Grim")
!Global("G3FitzAgreesTalk","GLOBAL",1)
!Global("G3GrimAgreesTalk","GLOBAL",1)~ THEN BEGIN Fitz#4.1
SAY @10893
= @10894
++ @10895 GOTO Fitz#4.2
++ @10896 GOTO Fitz#4.2
END

IF ~~ THEN BEGIN Fitz#4.2
SAY @10897
= @10898
IF ~~ THEN DO ~GiveItemCreate("G3DRINK4",Player1,1,1,0)
EscapeArea()~ EXIT
END

IF ~Global("G3AgreedToKillGrim","GLOBAL",1)
!Global("G3ReturnLaterToFitz","GLOBAL",1)
!Global("G3FitzAgreesTalk","GLOBAL",1)
!Global("G3GrimAgreesTalk","GLOBAL",1)~ THEN BEGIN Fitz#2.1
SAY @10899
++ @10900 EXIT
++ @10901 DO ~SetGlobal("G3AgreedToKillGrim","GLOBAL",0) SetGlobal("G3ReturnLaterToFitz","GLOBAL",1)~ EXIT
++ @10902 GOTO Fitz#1.13
++ @10903 GOTO Fitz#1.12
END

IF ~Global("G3ReturnLaterToFitz","GLOBAL",1)
!Global("G3FitzAgreesTalk","GLOBAL",1)
!Global("G3GrimAgreesTalk","GLOBAL",1)~ THEN BEGIN Fitz#3.1
SAY @10904
++ @10905 GOTO Fitz#1.11
++ @10906 GOTO Fitz#1.12
++ @10907 GOTO Fitz#1.13
++ @10901 EXIT
END

/////                                                  \\\\\
///// Grim                                             \\\\\
/////                                                  \\\\\

BEGIN G3GRIM

IF ~NumTimesTalkedTo(0)~ THEN BEGIN Grim#1.1
SAY @10754
= @10755
++ @10756 GOTO Grim#1.2
++ @10757 GOTO Grim#1.3
+ ~!Dead("G3Fitz")
OR(2)
Global("G3ReturnLaterToFitz","GLOBAL",1)
Global("G3AgreedToKillGrim","GLOBAL",1)~ + @10758 GOTO Grim#1.4
+ ~!Dead("G3Fitz")
OR(2)
Global("G3ReturnLaterToFitz","GLOBAL",1)
Global("G3AgreedToKillGrim","GLOBAL",1)~ + @10759 GOTO Grim#1.12
+ ~Dead("G3Fitz")~ + @10760 GOTO Grim#1.5
END

IF ~~ THEN BEGIN Grim#1.2
SAY @10761
++ @10762 GOTO Grim#1.11
++ @10763 GOTO Grim#1.13
END

IF ~~ THEN BEGIN Grim#1.3
SAY @10764
IF ~~ THEN DO ~SetGlobal("G3PissOffGrim","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Grim#1.4
SAY @10765
= @10766
IF ~~ THEN DO ~SetGlobal("G3FoughtGrim","GLOBAL",1) Enemy()~ EXIT
END

IF ~~ THEN BEGIN Grim#1.5
SAY @10767
+ ~PartyHasItem("G3KEY1")~ + @10768 GOTO Grim#1.6
++ @10769 GOTO Grim#1.7
END

IF ~~ THEN BEGIN Grim#1.6
SAY @10770
= @10771
++ @10772 GOTO Grim#1.8
++ @10773 GOTO Grim#1.8
END

IF ~~ THEN BEGIN Grim#1.7
SAY @10774
= @10771
++ @10772 GOTO Grim#1.8
++ @10773 GOTO Grim#1.8
END

IF ~~ THEN BEGIN Grim#1.8
SAY @10775
= @10771
+ ~PartyHasItem("G3KEY1")~ + @10776 GOTO Grim#1.9
+ ~PartyHasItem("G3KEY1")~ + @10777 GOTO Grim#1.9
+ ~!PartyHasItem("G3KEY1")~ + @10778 GOTO Grim#1.10
+ ~!PartyHasItem("G3KEY1")~ + @10779 GOTO Grim#1.10
END

IF ~~ THEN BEGIN Grim#1.9
SAY @10780
= @10781
IF ~~ THEN DO ~SetGlobal("G3GrimFetchesDrink","GLOBAL",1)
StartCutScene("G3GrGet")~ EXIT
END

IF ~~ THEN BEGIN Grim#1.10
SAY @10782
= @10783
IF ~~ THEN DO ~SetGlobal("G3GrimSendsToFetchKey","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Grim#1.11
SAY @10784
= @10785
= @10786
= @10787
= @10788
= @10789
= @10790
= @10791
= @10792
++ @10793 GOTO Grim#1.14
++ @10794 GOTO Grim#1.16
++ @10795 GOTO Grim#1.12
++ @10796 GOTO Grim#1.15
++ @10797 DO ~SetGlobal("G3ReturnLaterToGrim","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Grim#1.12
SAY @10798
= @10799
++ @10800 GOTO Grim#1.18
++ @10801 GOTO Grim#1.18
++ @10802 GOTO Grim#1.14
END

IF ~~ THEN BEGIN Grim#1.13
SAY @10803
++ @10804 GOTO Grim#1.11
++ @10805 DO ~SetGlobal("G3PissOffGrim","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Grim#1.14
SAY @10806
= @10807
IF ~~ THEN DO ~SetGlobal("G3AgreedToKillFitz","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Grim#1.15
SAY @10808
= @10809
IF ~~ THEN DO ~SetGlobal("G3ReturnLaterToGrim","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Grim#1.16
SAY @10810
= @10811
++ @10812 GOTO Grim#1.17
++ @10796 GOTO Grim#1.15
++ @10797 DO ~SetGlobal("G3ReturnLaterToGrim","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Grim#1.17
SAY @10813
IF ~~ THEN DO ~SetGlobal("G3AgreedToKillFitz","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Grim#1.18
SAY @10814
= @10815
= @10816
IF ~~ THEN DO ~SetGlobal("G3GrimAgreesTalk","GLOBAL",1)
StartCutScene("G3GtoF")~ EXIT
END

IF ~Global("G3GrimFetchesDrink","GLOBAL",1)~ THEN BEGIN Grim#6.1
SAY @10817
IF ~~ THEN DO ~GiveItemCreate("G3DRINK4",Player1,1,1,0)
EscapeArea()~ EXIT
END

IF ~Global("G3GrimSendsToFetchKey","GLOBAL",1)~ THEN BEGIN Grim#5.1
SAY @10818
+ ~PartyHasItem("G3KEY1")~ + @10819 GOTO Grim#5.2
++ @10820 EXIT
END

IF ~~ THEN BEGIN Grim#5.2
SAY @10821
IF ~~ THEN DO ~SetGlobal("G3GrimFetchesDrink","GLOBAL",1)~ EXIT
END

IF ~Dead("G3Fitz")
PartyHasItem("G3KEY1")~ THEN BEGIN Grim#7.1
SAY @10822
= @10771
= @10823
= @10824
IF ~~ THEN DO ~SetGlobal("G3GrimFetchesDrink","GLOBAL",1)
StartCutScene("G3GrGet")~ EXIT
END

IF ~Dead("G3Fitz")
PartyHasItem("G3KEY1")~ THEN BEGIN Grim#7.2
SAY @10822
= @10771
= @10823
= @10825
++ @10826 GOTO Grim#7.3
END

IF ~~ THEN BEGIN Grim#7.3
SAY @10827
IF ~~ THEN DO ~SetGlobal("G3GrimSendsToFetchKey","GLOBAL",1)~ EXIT
END

IF ~Global("G3AgreedToKillFitz","GLOBAL",1)
!Global("G3ReturnLaterToGrim","GLOBAL",1)~ THEN BEGIN Grim#2.1
SAY @10828
++ @10829 EXIT
++ @10830 DO ~SetGlobal("G3AgreedToKillFitz","GLOBAL",0)~ GOTO Grim#1.15
++ @10831 GOTO Grim#1.12
END

IF ~Global("G3ReturnLaterToGrim","GLOBAL",1)~ THEN BEGIN Grim#3.1
SAY @10832
++ @10833 GOTO Grim#1.14
++ @10794 GOTO Grim#1.16
++ @10831 GOTO Grim#1.12
++ @10796 GOTO Grim#1.15
++ @10834 DO ~SetGlobal("G3ReturnLaterToGrim","GLOBAL",1)~ EXIT
END

IF ~Global("G3PissOffGrim","GLOBAL",1)~ THEN BEGIN Grim#4.1
SAY @10835
++ @10836 GOTO Grim#1.2
+ ~!Dead("G3Fitz")
OR(2)
Global("G3ReturnLaterToFitz","GLOBAL",1)
Global("G3AgreedToKillGrim","GLOBAL",1)~ + @10758 GOTO Grim#1.4
+ ~!Dead("G3Fitz")
OR(2)
Global("G3ReturnLaterToFitz","GLOBAL",1)
Global("G3AgreedToKillGrim","GLOBAL",1)~ + @10759 GOTO Grim#1.12
+ ~Dead("G3Fitz")~ + @10760 GOTO Grim#1.5
END

/////                                                  \\\\\
///// Dewny et al                                      \\\\\
/////                                                  \\\\\

BEGIN ~G3FFCUS1~

IF ~RandomNum(2,1)~ THEN Drinkin SAY @10348
  IF ~~ THEN EXIT
END

IF ~RandomNum(2,2)~ THEN Seat SAY @10349
  IF ~~ THEN EXIT
END

BEGIN ~G3FFCUS2~
IF ~RandomNum(2,1)~ THEN Poncy SAY @10350
  IF ~~ THEN EXIT
END

IF ~RandomNum(2,2)~ THEN Seat2 SAY @10351
  IF ~~ THEN EXIT
END

BEGIN ~G3DEWN~

IF ~Global("DewnyBeginsContest","LOCALS",3)~ Drink1 SAY @10352 = @10402 = @10354
  ++ @10355 DO ~SetGlobal("DewnyBeginsContest","LOCALS",4)~ + Drink2
  ++ @10356 DO ~SetGlobal("DewnyBeginsContest","LOCALS",4)~ + Drink2
  ++ @10357 DO ~SetGlobal("DewnyBeginsContest","LOCALS",4)~ + Drink2
END


IF ~Global("G3DewnyQuest","GLOBAL",0)~ THEN BeforeQuest SAY @10358
//  IF ~~ THEN DO ~SwingOnce()~ EXIT
  IF ~~ THEN DO ~Swing()~ EXIT
END

IF ~Global("G3DewnyQuest","GLOBAL",2)
    Global("G3DewnyWantsCake","GLOBAL",1)~ THEN CakeStare SAY @10359
  IF ~~ THEN EXIT
END

IF ~Global("G3DewnyQuest","GLOBAL",2)
	Global("G3DewnPassOut","GLOBAL",1)~ THEN PassedOut SAY @10360
  IF ~~ THEN EXIT
END

IF ~Global("G3DewnyQuest","GLOBAL",2)
    Global("G3Booted","LOCALS",1)~ THEN BootedSpeech SAY @10361
  IF ~~ THEN DO ~GiveItem("g3drink1",Player1)
                 ApplyDamage(Player1,4,CRUSHING)
                 SetInterrupt(FALSE)
		 EscapeArea()~ EXIT
END

IF ~Global("G3DewnyIntro","GLOBAL",7)~ THEN DewnyTalk SAY @10362
  ++ @10363 + cake
  ++ @10364 + evilbrew
  ++ @10365 + maloc
  ++ @10366 + heavy
  ++ @10367 + weather
  ++ @10368 + feet
  + ~Global("Qspippin","LOCALS",0)~ + @10369 + pippin
END

IF ~~ cake SAY @10370
  IF ~~ THEN DO ~SetGlobal("QsCake","LOCALS",1)~ GOTO Qs
END

IF ~~ Qs SAY @10371
  + ~Global("QsCake","LOCALS",0)~ + @10363 + cake
  + ~Global("QsEvilbrew","LOCALS",0)~ + @10364 + evilbrew
  + ~Global("QsEvilbrew","LOCALS",1)~ + @10372 + bouncer
  + ~Global("QsMaloc","LOCALS",0)~ + @10365 + maloc
  ++ @10366 + heavy
  + ~Global("QsWeather","LOCALS",0)~ + @10367 + weather
  + ~Global("QsFeet","LOCALS",0)~ + @10368 + feet
  + ~Global("Qspippin","LOCALS",0)~ + @10369 + pippin
END

IF ~~ evilbrew SAY @10373 = @10374
  IF ~~ THEN DO ~SetGlobal("QsEvilbrew","LOCALS",1)~ GOTO Qs
END

IF ~~ bouncer SAY @10375
  ++ @10376 + mum
  ++ @10377 + mum
END

IF ~~ mum SAY @10378
  IF ~~ THEN DO ~SetGlobal("QsEvilbrew","LOCALS",2)~ GOTO Qs
END

IF ~~ maloc SAY @10379 // this one leads to the actual drinking game
  ++ @10380 + Contest1
  ++ @10381 + Contest1
  ++ @10382 + heavy
  ++ @10383 + heavy
  + ~CheckStatGT(Player1,13,INT)~ + @10384 + dropCask
END

IF ~~ heavy SAY @10385
  ++ @10380 + Contest1
  ++ @10381 + Contest1
  ++ @10386 + bootMaztica
END

IF ~~ Contest1 SAY @10387
  ++ @10388 + Challenge
  ++ @10389 + Challenge
END

IF ~~ bootMaztica SAY @10390
  IF ~~ THEN DO ~SetGlobal("G3Booted","LOCALS",1)
                 CreateVisualEffectObject("DUST",Player1)
                 CreateVisualEffectObject("DUST",Player2)
                 CreateVisualEffectObject("DUST",Player3)
                 CreateVisualEffectObject("DUST",Player4)
                 CreateVisualEffectObject("DUST",Player5)
                 CreateVisualEffectObject("DUST",Player6)
                 Wait(2)
                 FadeToColor([30.0],0)
                 Wait(2)
                 ActionOverride(Player1,LeaveAreaLUA("AR0500","",[3326.2079],6))
                 ActionOverride(Player2,LeaveAreaLUA("AR0500","",[3365.2107],6))
                 ActionOverride(Player3,LeaveAreaLUA("AR0500","",[3289.2111],6))
                 ActionOverride(Player4,LeaveAreaLUA("AR0500","",[3324.2141],6))
                 ActionOverride(Player5,LeaveAreaLUA("AR0500","",[3243.2141],6))
                 ActionOverride(Player6,LeaveAreaLUA("AR0500","",[3269.2170],6))
                 MoveBetweenAreas("AR0500",[3242.2070],13)
                 FaceObject(Player1)
                 FadeFromColor([30.0],0)
                 Wait(2)
                 StartDialogueNoSet(Player1)~ EXIT
END

IF ~~ Challenge SAY @10391
  ++ @10392 + Untruth
  ++ @10393 + Grr
  ++ @10394 + Grr
  ++ @10395 + Grr
  ++ @10396 + Grr
END

IF ~~ Untruth SAY @10397
  IF ~~ THEN GOTO Grr
END

IF ~~ Grr SAY @10398 = @10399 = @10400
IF ~~ THEN DO ~DisplayStringHead("FFWENCH",27882)
               ActionOverride("FFWENCH",MoveToObjectNoInterrupt("G3DEWN"))
               SetGlobal("DewnyBeginsContest","LOCALS",1)~ EXIT
END

IF ~~ Drink2 SAY @10401 = @10402 = @10403
  ++ @10404 + Drink3
  ++ @10405 + Drink3
  ++ @10406 + Drink3
END

IF ~~ Drink3 SAY @10407 = @10408 = @10402 = @10410
IF ~~ THEN DO ~SetGlobal("G3DewnPassOut","GLOBAL",1)
               MoveToPointNoInterrupt([727.203])
               Wait(1)
               DisplayStringHead(Myself,@10003)
               MoveToPointNoInterrupt([776.244])
               Wait(1)
               DisplayStringHead(Myself,@10004)
	       DropItem("G3DRINK1",[-1.-1])
               MoveToPointNoInterrupt([708.217])
               Wait(1)
               DisplayStringHead(Myself,@10005)
               Wait(1)
               MoveToPointNoInterrupt([670.197])~ EXIT
END

IF ~~ dropCask SAY @10411
IF ~~ THEN DO ~GiveItem("G3DRINK1",Player1)
               SetGlobal("G3DewnyWantsCake","GLOBAL",1)
               MoveToObject("ffcook")~ EXIT
END

IF ~~ weather SAY @10412
  IF ~~ THEN DO ~SetGlobal("QsWeather","LOCALS",1)~ GOTO Qs
END

IF ~~ feet SAY @10413
  IF ~~ THEN DO ~SetGlobal("QsFeet","LOCALS",1)~ GOTO Qs
END

IF ~~ pippin SAY @10414
  IF ~~ THEN DO ~SetGlobal("Qspippin","LOCALS",1)~ GOTO Qs
END

/////                                                  \\\\\
///// The Gibbering Twelve                             \\\\\
/////                                                  \\\\\

BEGIN G3G1201

IF ~~ THEN BEGIN G3G12StandDown SAY @10130
  IF ~~ THEN EXTERN G3MRSGTU G3G12Fight
END

IF ~~ THEN BEGIN G3G12NoName SAY @10133 = @10134
  IF ~~ THEN EXTERN G3MRSGTU G3G12Fight
END

IF ~~ THEN BEGIN G3G12WhatchaDoing SAY @10138 = @10139
  IF ~~ THEN EXTERN G3MRSGTU G3G12Fight
END

BEGIN G3G1203
BEGIN G3G1207
BEGIN G3G1208
BEGIN G3G1211

/////                                                  \\\\\
///// Chains                                           \\\\\
/////                                                  \\\\\

CHAIN IF ~AreaCheck("G3G12A")~ THEN G3DRINI G3QuestIsOver @11206
== G3MRSGTU @11207
== BJAHEIR IF ~InParty("Jaheira")
               See("Jaheira")
               !Dead("Jaheira")
               !StateCheck("Jaheira",CD_STATE_NOTVALID)~ @11208
== G3DRINI @11209
== G3MRSGTU @11210
== G3DRINI @11211
== BHAERDA IF ~InParty("HaerDalis")
               See("HaerDalis")
               !Dead("HaerDalis")
               !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ @11212
== G3DRINI @11213
== G3MRSGTU @11214
== G3DRINI @11215
== BEDWIN IF ~InParty("Edwin")
              See("Edwin")
              !Dead("Edwin")
              !StateCheck("Edwin",CD_STATE_NOTVALID)~ @11216
== G3MRSGTU @11217 = @11218
== G3DRINI @11219
== BYOSHIM IF ~InParty("Yoshimo")
               See("Yoshimo")
               !Dead("Yoshimo")
               !StateCheck("Yoshimo",CD_STATE_NOTVALID)~ @11220
== G3MRSGTU @11221 
DO ~GiveItemCreate("g3wrtom1",Player1,1,0,0)~
END G3MRSGTU G3QuestIsOver2

CHAIN G3MRSGTU G3QuestIsOver2 @11222
== G3DRINI @11223
== G3MRSGTU @11224
== BJAN IF ~InParty("Jan")
            See("Jan")
            !Dead("Jan")
            !StateCheck("Jan",CD_STATE_NOTVALID)~ @11225 = @11226
== G3DRINI @11227
DO ~SetGlobal("G3DriniFlees","G3G12A",1)~
EXIT

CHAIN IF ~OR(2)
Global("G3FitzAgreesTalk","GLOBAL",1)
Global("G3GrimAgreesTalk","GLOBAL",1)~ THEN G3FITZ Fitz#5.1
@10908
== G3GRIM @10909
== G3FITZ @10910
== G3GRIM @10911
== G3FITZ @10912
== G3GRIM @10913
== G3FITZ @10914
== G3GRIM @10915
== G3FITZ @10916
== G3GRIM @10917
== G3FITZ @10918
= @10919
== G3GRIM @10920
== G3FITZ @10921
== G3GRIM @10922
== G3FITZ @10923
== G3GRIM @10924
== G3FITZ @10925
= @10926
== G3GRIM @10927
== G3FITZ @10928
== G3GRIM @10929
== G3FITZ @10930
== G3GRIM @10931
== G3FITZ @10932
== G3GRIM @10933
== G3FITZ @10934
== G3GRIM @10935
== G3FITZ @10936
== G3GRIM @10937
== G3FITZ @10938
== G3GRIM @10939
END
+ ~Global("G3FitzAgreesTalk","GLOBAL",1)~ + @10940 GOTO Fitz#5.2
+ ~Global("G3GrimAgreesTalk","GLOBAL",1)~ + @10940 EXTERN G3GRIM Fitz#5.3
+ ~Global("G3FitzAgreesTalk","GLOBAL",1)~ + @10941 GOTO Fitz#5.2
+ ~Global("G3GrimAgreesTalk","GLOBAL",1)~ + @10941 EXTERN G3GRIM Fitz#5.3

CHAIN G3FITZ Fitz#5.2
@10942
== G3GRIM @10943
== G3FITZ @10944
== G3GRIM @10945
END
IF ~~ THEN DO ~GiveItemCreate("G3DRINK4",Player1,1,1,0)
ActionOverride("G3Fitz",EscapeArea())
ActionOverride("G3Grim",EscapeArea())~ EXIT

CHAIN G3GRIM Fitz#5.3
@10946
== G3FITZ @10947
== G3GRIM @10948
END
IF ~~ THEN DO ~GiveItemCreate("G3DRINK4",Player1,1,1,0)
ActionOverride("G3Fitz",EscapeArea())
ActionOverride("G3Grim",EscapeArea())~ EXIT

CHAIN EDWINJ DriniIJ1 @10732
== G3DRINI @10733
== EDWINJ @10734
== G3DRINI @10735
END G3DRINI TheJob2

CHAIN IF ~True()~ THEN G3G1201 G3SecretUndergroundLair @10107
== G3G1203 @10108
== G3MRSGTU @10109
== G3G1201 @10110
== G3MRSGTU @10111
== G3G1201 @10123
== G3G1203 @10124 = @10125
== G3G1208 @10112
== G3MRSGTU @10113
== G3G1207 @10114
== G3G1201 @10115
== G3G1211 @10116
== G3MRSGTU @10117 = @10118
== G3G1208 @10119
== G3MRSGTU @10120 = @10121
== G3G1201 @10122
END
  IF ~~ THEN REPLY @10126 GOTO G3G12StandDown
  IF ~~ THEN REPLY @10127 GOTO G3G12NoName
  IF ~~ THEN REPLY @10128 GOTO G3G12PlayDumb
  IF ~~ THEN REPLY @10129 GOTO G3G12WhatchaDoing

CHAIN IF ~~ THEN G3G1201 G3G12PlayDumb @10135
== G3MRSGTU @10136
== G3G1201 @10137
END G3MRSGTU G3G12Fight

CHAIN IF ~~ THEN G3MRSGTU G3G12Fight @10131
== G3G1201 @10132 
== G3G1208 @11181 DO ~SetGlobal("G3StartTimers","GLOBAL",1)
                     ActionOverride("G3G1203",Enemy())
                     ActionOverride("G3G1207",Enemy())
                     ActionOverride("G3G1201",Enemy())
                     ActionOverride("G3G1211",Enemy())
                     ActionOverride("G3MRSGTU",EscapeAreaMove("G3G12A",444,679,12))
                     EraseJournalEntry(@19985)
                     EraseJournalEntry(@19986)
                     EraseJournalEntry(@19987)
                     EraseJournalEntry(@19988)
                     EraseJournalEntry(@19989)
                     EraseJournalEntry(@19990)
                     AddJournalEntry(@19991,QUEST_DONE)
                     EraseJournalEntry(@19992)
                     EraseJournalEntry(@19993)
                     EraseJournalEntry(@19994)
                     EraseJournalEntry(@19995)
                     EraseJournalEntry(@19996)
                     EraseJournalEntry(@19997)
                     EraseJournalEntry(@19998)
                     EraseJournalEntry(@19999)~
EXIT



CHAIN IF ~~ THEN ANOMENJ G3DriniAnomenIJ @10051
== G3DRINI @10052
END
  IF ~~ THEN REPLY @10047 EXTERN G3DRINI G3DriniImpatient
  IF ~~ THEN REPLY @10048 DO ~SetGlobal("G3DriniMyWine","LOCALS",1)~ EXTERN G3DRINI G3DriniMyWine
  IF ~~ THEN REPLY @10049 EXTERN G3DRINI G3DriniImpatient
  IF ~~ THEN REPLY @10050 DO ~SetGlobal("G3DriniInTheMood","LOCALS",1)~ EXTERN G3DRINI G3DriniInTheMood
  IF ~InParty("Jaheira")
      See("Jaheira")
      !Dead("Jaheira")
      !StateCheck("Jaheira",CD_STATE_NOTVALID)~ EXTERN JAHEIRAJ G3DriniJaheiraIJ

CHAIN IF WEIGHT #-1 ~AreaCheck("AR0400")~ THEN G3MRSGTU G3StartSummoning @10057 = @10058
== G3DRINI @10059 = @10060 = @10061
END
  IF ~InParty("Jan")
     See("Jan")
     !Dead("Jan")
     !StateCheck("Jan",CD_STATE_NOTVALID)~ GOTO G3JanPresent
  IF ~OR(4)
        !InParty("Jan")
        !See("Jan")
        Dead("Jan")
        StateCheck("Jan",CD_STATE_NOTVALID)~ GOTO G3NoJan

CHAIN IF ~~ THEN G3MRSGTU G3HowToHelp @10082
== G3DRINI @10083
== G3MRSGTU @10084 = @10085
END
  IF ~~ THEN REPLY @10086 GOTO G3ProceedtoFinale
  IF ~~ THEN REPLY @10087 GOTO G3GiveRewardAndEndQuest

CHAIN IF ~~ THEN G3MRSGTU G3JanPresent @10062 = @10063
== JANJ @10064
== G3MRSGTU @10065
END G3MRSGTU G3SummonAlready

CHAIN IF ~~ THEN G3MRSGTU G3NoJan @10062
== G3DRINI @10066
== G3MRSGTU @10067
END G3MRSGTU G3SummonAlready

CHAIN IF ~~ THEN G3MRSGTU G3ProceedtoFinale @10094 DO ~GiveGoldForce(1800) GiveItemCreate("misc45",Player1,1,0,0)~
== G3DRINI @10095
== G3MRSGTU @10096
== G3DRINI @10097 DO ~ClearAllActions()
                   StartCutSceneMode()
                   StartCutScene("G3Cut002")~
EXIT

CHAIN IF ~AreaCheck("AR0400")~ THEN G3DRINI G3WTFGibberlings @10098 = @10099
== G3MRSGTU @10100 = @10101
== EDWINJ IF ~InParty("Edwin")
      See("Edwin")
      !Dead("Edwin")
      !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @10736
== G3DRINI @10102
== G3MRSGTU @10103
== G3DRINI @10104
== G3MRSGTU @10106
== G3DRINI @10105 DO ~ClearAllActions()
                    StartCutSceneMode()
                    StartCutScene("G3Cut003")~
EXIT

CHAIN IF ~~ THEN G3DRINI RunAwayNow2 @10256 DO ~ActionOverride("G3DRINI",EscapeArea())~
== G3MAID @10257
EXIT

CHAIN IF ~~ THEN G3DRINI Cost @10258
== G3MAID @10259
== SALVANAS IF ~See("Salvanas")
                !Dead("Salvanas")
                !StateCheck("Salvanas",CD_STATE_NOTVALID)~ @10260
== G3MAID @10261
== G3DRINI @10262
== G3MAID @10263
== G3DRINI @10264
END
  IF ~!PartyGoldGT(42)~ THEN REPLY @10265 EXTERN G3DRINI RunAwayNow
  IF ~PartyGoldGT(41)~ THEN REPLY @10266 EXTERN G3MAID TakeMoney
  IF ~PartyGoldGT(41)~ THEN REPLY @10267 EXTERN G3MAID TakeMoney
  IF ~PartyGoldGT(41)~ THEN REPLY @10268 EXTERN G3DRINI RunAwayNow

CHAIN IF ~~ THEN G3MAID TakeMoney @10269 DO ~TakePartyGold(42) 
                                           ActionOverride("G3MAID",EscapeArea())~
== SALVANAS IF ~See("Salvanas")
                !Dead("Salvanas")
                !StateCheck("Salvanas",CD_STATE_NOTVALID)~ @10270
== G3DRINI @10271
END
  IF ~~ THEN REPLY @10272 EXTERN G3DRINI TheJob

CHAIN IF ~~ THEN G3DRINI InitialOffer @10273
== HAERDAJ IF ~InParty("HaerDalis")
               See("HaerDalis")
               !Dead("HaerDalis")
               !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN @10731
== SALVANAS IF ~See("Salvanas")
                !Dead("Salvanas")
                !StateCheck("Salvanas",CD_STATE_NOTVALID)~ THEN @10274
== G3MAID @10275
END 
  IF ~~ THEN EXTERN G3DRINI RandomState
  IF ~InParty("Yoshimo")
      See("Yoshimo")
      !Dead("Yoshimo")
      !StateCheck("Yoshimo",CD_STATE_NOTVALID)~ THEN EXTERN G3DRINI G3YoshiDrini

CHAIN IF ~~ THEN G3DRINI G3YoshiDrini @10742
== YOSHJ @10743
== G3DRINI @10744 = @10745
== YOSHJ @10746
== G3MAID @10747
== YOSHJ @10748
END G3DRINI RandomState

CHAIN IF ~~ THEN G3MAID BarTabNoSalvanas @11135
== ~G3DRINI~ @10283
== ~G3MAID~ @10288
== ~G3DRINI~ @10289
== ~G3MAID~ @11136
== ~G3DRINI~ @10294 = @10295
== ~G3MAID~ @10296
== ~G3DRINI~ @10297
== ~G3MAID~ @10298
== ~G3DRINI~ @10299
== ~G3DRINI~ @10300
END
  IF ~~ THEN REPLY @10301 EXTERN ~G3DRINI~ Persuade
  IF ~~ THEN REPLY @10302 EXTERN ~G3DRINI~ InitialOffer
  IF ~~ THEN REPLY @10303 EXTERN ~G3DRINI~ Persuade
  IF ~~ THEN REPLY @10304 EXTERN ~G3DRINI~ InitialOffer

CHAIN IF ~~ THEN G3MAID BarTab @10280
== SALVANAS IF ~See("Salvanas")
                !Dead("Salvanas")
                !StateCheck("Salvanas",CD_STATE_NOTVALID)~ @10281
== NALIAJ IF ~InParty("Nalia")
              See("Nalia")
             !Dead("Nalia")
             !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @10737
== G3MAID @10282
== SALVANAS IF ~See("Salvanas")
                !Dead("Salvanas")
                !StateCheck("Salvanas",CD_STATE_NOTVALID)~ @10283
== G3DRINI @10284
== G3MAID @10285
== G3DRINI @10286
== SALVANAS IF ~See("Salvanas")
                !Dead("Salvanas")
                !StateCheck("Salvanas",CD_STATE_NOTVALID)~ @10287
== G3MAID @10288
== G3DRINI @10289
END
  IF ~~ THEN EXTERN G3MAID BarTab2
  IF ~InParty("Viconia")
     See("Viconia")
     !Dead("Viconia")
     !StateCheck("Viconia",CD_STATE_NOTVALID)~ EXTERN G3DRINI BarTabViccyAside

CHAIN IF ~~ THEN G3DRINI BarTabViccyAside @10738
== VICONIJ @10739
== SALVANAS IF ~See("Salvanas")
                !Dead("Salvanas")
                !StateCheck("Salvanas",CD_STATE_NOTVALID)~ @10740
== G3DRINI @10741
END G3MAID BarTab2

CHAIN IF ~~ THEN G3MAID BarTab2 @10290
== SALVANAS IF ~See("Salvanas")
                !Dead("Salvanas")
                !StateCheck("Salvanas",CD_STATE_NOTVALID)~ @10291
== G3DRINI @10292
== SALVANAS IF ~See("Salvanas")
                !Dead("Salvanas")
                !StateCheck("Salvanas",CD_STATE_NOTVALID)~ @10293
== G3DRINI @10294
== G3DRINI @10295
== G3MAID @10296
== SALVANAS IF ~See("Salvanas")
                !Dead("Salvanas")
                !StateCheck("Salvanas",CD_STATE_NOTVALID)~ @10297
== G3MAID @10298
== G3DRINI @10299
== G3DRINI @10300
END
  IF ~~ THEN REPLY @10301 EXTERN G3DRINI Persuade
  IF ~~ THEN REPLY @10302 EXTERN G3DRINI InitialOffer
  IF ~~ THEN REPLY @10303 EXTERN G3DRINI Persuade
  IF ~~ THEN REPLY @10304 EXTERN G3DRINI InitialOffer

CHAIN IF WEIGHT #-5 ~Global("G3DewnyQuest","GLOBAL",2)
                     Global("G3DewnyIntro","GLOBAL",1)~ THEN G3DEWN G3DewnyCut1 @10419
DO ~SetGlobal("G3DewnyIntro","GLOBAL",2)~
== FFBART @10420
== G3DEWN @10421
== FFBART @10422 = @10423
== G3DEWN @10424
== FFBART @10425
== G3DEWN @10426 = @10427 // it could start here..
== FFBART @10428 = @10429
== FFCUST03 @10430
== FFBART @10431
== FFCUST03 @10432
== G3DEWN @10433
END
  IF ~~ THEN EXIT

CHAIN IF WEIGHT #-4 ~Global("G3DewnyIntro","GLOBAL",2)
                     Global("Customer3","LOCALS",1)~ THEN G3DEWN Half @10434
DO ~SetGlobal("G3DewnyIntro","GLOBAL",3)~
== G3FFCUS1 @10435
== G3DEWN @10436
== G3FFCUS1 @10437
END
  IF ~~ THEN EXIT

CHAIN IF WEIGHT #-3 ~Global("G3DewnyIntro","GLOBAL",3)
                     Global("Customer9","LOCALS",1)~ THEN G3DEWN Quality @10438
DO ~SetGlobal("G3DewnyIntro","GLOBAL",4)~
== G3FFCUS2 @10439
END
  IF ~~ THEN EXIT

CHAIN IF WEIGHT #-2 ~Global("G3DewnyIntro","GLOBAL",4)
                     Global("Customer6","LOCALS",1)~ THEN G3DEWN Overindulge @10440
DO ~SetGlobal("G3DewnyIntro","GLOBAL",5)~
== FFCUST06 @10441
END
  IF ~~ THEN EXIT

CHAIN IF WEIGHT #-1 ~Global("G3DewnyIntro","GLOBAL",5)
                     Global("Customer8","LOCALS",1)~ THEN G3DEWN Taking @10442
DO ~SetGlobal("G3DewnyIntro","GLOBAL",6)~
== FFCUST08 @10443
== FFCUST07 @10444 = @10445
== G3DEWN @10446 = @10447
== FFCUST07 @10448 = @10449 = @10450 = @10451
END
  IF ~~ THEN DO ~ApplySpellRES("G3DRUNK",Myself)
//                 SetSequence(SEQ_SLEEP)
                 SetGlobalTimer("G3DrunkDwarfWakeUp","GLOBAL",ONE_DAY)
                 SetGlobal("G3FFCUST08Comment","GLOBAL",1)~ EXIT

CHAIN IF WEIGHT #-1 ~Global("G3DewnyIntro","GLOBAL",6)
                     Global("G3FFCUST08Comment","GLOBAL",2)~ THEN FFCUST08 Dward @10452 = @10453 = @10454
DO ~SetGlobal("G3DewnyIntro","GLOBAL",7)~
== FFBART @10455
== G3DEWN @10456
== FFWENCH IF ~!Dead("FFWench")
               !StateCheck("FFWench",STATE_SLEEPING)~ THEN @10457
== FFBART @10458
== G3DEWN @10459
DO ~ActionOverride("G3DEWN",MoveToPointNoInterrupt([796.261]))~
EXIT

CHAIN ~MINSCJ~ LadyBevMinscExchange @10584
== ~G3BEV~ @10585
END
  IF ~~ REPLY @10586 EXTERN ~G3BEV~ MinscStory
  IF ~Global("G3BaristerVibrissa","GLOBAL",0)
      Global("G3FredVibrissa","GLOBAL",0)~ REPLY @10538 EXTERN ~G3BEV~ WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",1)
      Global("G3FredVibrissa","GLOBAL",0)~ REPLY @10539 EXTERN ~G3BEV~ WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",1)
      Global("G3FredVibrissa","GLOBAL",1)~ REPLY @10540 EXTERN ~G3BEV~ WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",0)
      Global("G3FredVibrissa","GLOBAL",1)~ REPLY @10541 EXTERN ~G3BEV~ WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",0)
      Global("G3FredVibrissa","GLOBAL",0)~ REPLY @10542 EXTERN ~G3BEV~ WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",1)
      Global("G3FredVibrissa","GLOBAL",0)~ REPLY @10543 EXTERN ~G3BEV~ WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",1)
      Global("G3FredVibrissa","GLOBAL",1)~ REPLY @10544 EXTERN ~G3BEV~ WhyVibrissa
  IF ~Global("G3BaristerVibrissa","GLOBAL",0)
      Global("G3FredVibrissa","GLOBAL",1)~ REPLY @10545 EXTERN ~G3BEV~ WhyVibrissa

CHAIN ~G3BEV~ FredSays @10587
== ~G3JAVA04~ @10588
== ~G3BEV~ @10589 = @10590
END
  IF ~~ REPLY @10591 EXTERN ~G3BEV~ NotAware
  IF ~~ REPLY @10554 EXTERN ~G3BEV~ WhyVibrissa
  IF ~~ REPLY @10555 EXTERN ~G3BEV~ SuitYourself

CHAIN ~G3JAVA02~ HaludakBeans @10592
DO ~SetGlobal("G3HaludakActivated","GLOBAL",1)~
== ~G3BEV~ @10593
EXIT

CHAIN ~G3BEV~ Blood @10626
DO ~SetGlobal("G3LadyBevBloodSpeech","GLOBAL",1)~
END
  IF ~~ EXTERN ~G3JAVA01~ Protected

CHAIN ~G3BEV~ Stop @10627
DO ~SetGlobal("G3JavaMojo","GLOBAL",1)~
== ~G3JAVA01~ @10628
== ~G3BEV~ @10629
== ~G3JAVA01~ @10630
== ~G3JAVA02~ @10631
== ~G3JAVA01~ @10632
== ~G3BEV~ @10633
== ~G3JAVA01~ @10634
== ~G3BEV~ @10635
EXIT

CHAIN ~G3JAVA02~ Help @10636
== ~G3JAVA01~ @10637
END
  IF ~Global("G3LadyBevBloodSpeech","GLOBAL",0)~ REPLY @10638 EXTERN ~G3BEV~ Blood
  IF ~Global("G3LadyBevBloodSpeech","GLOBAL",1)~ REPLY @10639 EXTERN ~G3BEV~ Stop
  IF ~~ REPLY @10640 EXTERN ~G3JAVA01~ Purchase
  IF ~~ REPLY @10641 EXTERN ~G3JAVA01~ Supplier

CHAIN ~G3JAVA02~ Bribe @10642
DO ~SetGlobal("G3BribeBarister","GLOBAL",1)~
END
  IF ~PartyGoldGT(9)~ REPLY @10611 EXTERN ~G3JAVA02~ 10Gold
  IF ~PartyGoldGT(49)~ REPLY @10612 EXTERN ~G3JAVA02~ 50Gold
  IF ~PartyGoldGT(99)~ REPLY @10613 EXTERN ~G3JAVA01~ 100Gold2
  IF ~~ REPLY @10643 EXTERN ~G3JAVA01~ Purchase

CHAIN ~G3JAVA02~ 10Gold @10644
END
  IF ~PartyGoldGT(49)~ REPLY @10612 EXTERN ~G3JAVA02~ 50Gold
  IF ~PartyGoldGT(99)~ REPLY @10613 EXTERN ~G3JAVA01~ 100Gold2
  IF ~~ REPLY @10643 EXTERN ~G3JAVA01~ Purchase

CHAIN ~G3JAVA02~ 50Gold @10645
== ~G3JAVA01~ @10646
== ~G3JAVA02~ @10647
== ~G3JAVA01~ @10648
== ~G3JAVA02~ @10649
== ~G3JAVA01~ @10650
== ~G3JAVA02~ @10651
END
  IF ~~ EXTERN ~G3JAVA02~ Do50Gold

CHAIN G3SAILR1 CorrInitial2 @10729
== G3CORR  @10713
== G3SAILR2 @11156
== G3CORR @10714
== G3SAILR3 @10730
== G3CORR @10715
== G3SAILR2 @11157
== G3SAILR1 @11158
== G3CORR @10716
== G3SAILR1 @11159
END G3SAILR2 CorrCut1

CHAIN IF ~True()~ THEN G3LAUR CorrFinale @10728
DO ~SetGlobal("G3Corradun","GLOBAL",2)~
== G3CORR @10727
DO ~ActionOverride("G3Corr",SetInterrupt(FALSE))
    ActionOverride("G3Corr",EscapeArea())
    ActionOverride("G3Laur",SetInterrupt(FALSE))
    ActionOverride("G3Laur",EscapeArea())~
EXIT

CHAIN G3KEBODI G3Scam @11002
== KELDORJ IF ~InParty("Keldorn")
See("Keldorn")
!Dead("Keldorn")
!StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @11003
== G3SULECI @11004
END
  IF ~~ THEN REPLY @11005 EXTERN G3KEBODI G3ScamLaughing
  IF ~~ THEN REPLY @11006 EXTERN G3KEBODI G3IDScam
  IF ~~ THEN REPLY @11007 EXTERN G3KEBODI G3ScamCrazy
  IF ~~ THEN REPLY @11008 EXTERN G3KEBODI G3ScamLaughing
  IF ~~ THEN REPLY @11009 EXTERN G3KEBODI G3ScamAttention
  IF ~InParty("Yoshimo")
      See("Yoshimo")
      !Dead("Yoshimo")
      !StateCheck("Yoshimo",CD_STATE_NOTVALID)~ THEN EXTERN YOSHJ G3YoshiJealous

CHAIN IF ~~ THEN G3SULECI G3ScamLocationEnd @11010 DO ~SetGlobal("G3Scam","GLOBAL",2)~
== G3KEBODI @11011
END G3SULECI TheListLoop


CHAIN G3SULECI SummoningSpell @11012
== G3KEBODI @11013
== G3SULECI @11014
END G3SULECI TheList

CHAIN KELDORJ KeldornBanterWrapup @11015
== G3SULECI @11016
== KELDORJ @11017
   = @11018
== G3KEBODI @11019
== G3SULECI @11020
== KELDORJ @11021
END
  IF ~Global("G3SuleciActivated","GLOBAL",0)~ EXTERN G3SULECI IAmSure
  IF ~Global("G3SuleciActivated","GLOBAL",1)~ EXTERN KELDORJ NoMatter
  IF ~Global("G3SuleciActivated","GLOBAL",2)~ EXTERN G3SULECI TheListViaKeldorn2

CHAIN G3KEBODI KebodiDeals1
  @11022
== G3SULECI @11023
EXIT

CHAIN G3KEBODI KebodiDeals2
  @11024
== G3SULECI @11025
EXIT

CHAIN KELDORJ NoMatter
  @11026
  DO ~SetGlobal("G3SuleciActivated","GLOBAL",2)~
== G3SULECI @11027
== KELDORJ @11028
== G3KEBODI @11029
== KELDORJ @11030
END G3SULECI TheListViaKeldorn

CHAIN G3SULECI IAmSure
  @11031
== KELDORJ @11032
EXIT

CHAIN G3SULECI Arabellan1 @10009
== G3KEBODI @10010
== G3SULECI @10011
END G3SULECI TheListLoop

CHAIN G3SULECI Arabellan3 @10014
== G3KEBODI @10015
== G3SULECI @10016 = @10019
== G3KEBODI @10017
== G3SULECI @10018
END G3SULECI TheListLoop

CHAIN G3SULECI Dewny1 @11040
== G3KEBODI @11041
== G3SULECI @11042
END
  IF ~~ THEN REPLY @11043 GOTO G3MaybeFF
  IF ~~ THEN REPLY @11044 GOTO G3MaybeFF
  IF ~~ THEN REPLY @11045 GOTO TheListLoop

CHAIN G3SULECI G3MaybeFF @11046
== G3KEBODI @11047
== G3SULECI @11049
END G3SULECI TheListLoop

CHAIN G3SULECI SAle1 @11050
== G3KEBODI @11051
END G3SULECI TheListLoop

CHAIN G3JPS BreakWall1 @11089
== ~HAERDAJ~ IF ~InParty("HaerDalis")
See("HaerDalis")
!Dead("HaerDalis")
!StateCheck("HaerDalis",CD_STATE_NOTVALID)~ THEN @11090
== G3JPS @11091
END
  IF ~~ THEN REPLY @11179 EXTERN G3JPS JPSExit
  IF ~~ THEN REPLY @11180 EXTERN G3JPS JPSExit
  IF ~Global("G3MoniqQuest","GLOBAL",8)
      PartyHasItem("G3DRINK3")~ THEN REPLY @11092 EXTERN ~G3JPS~ Wine1

CHAIN G3JPS Wine1 @11093
== ~AERIEJ~ IF ~InParty("Aerie")
See("Aerie")
!Dead("Aerie")
!StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @11094
== ~G3JPS~ @11095
== ~EDWINJ~ IF ~InParty("Edwin")
See("Edwin")
!Dead("Edwin")
!StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @11096
== G3JPS @11097 DO ~TakePartyItem("G3DRINK3")~
END G3JPS Wine2

CHAIN G3JPS BadJoke2a @11102
== ~MINSCJ~ IF ~InParty("Minsc")
See("Minsc")
!Dead("Minsc")
!StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @11103
== G3JPS @11104
END
IF ~~ THEN REPLY @11105 EXTERN ~G3JPS~ BadJoke2b
IF ~~ THEN REPLY @11106 EXTERN ~G3JPS~ HowLong

CHAIN G3JPS SomeoneElse @11113
== ~VALYGARJ~ IF ~InParty("Valygar")
See("Valygar")
!Dead("Valygar")
!StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @11114
== ~KORGANJ~ IF ~InParty("Korgan")
See("Korgan")
!Dead("Korgan")
!StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @11115
== ~G3JPS~ IF ~InParty("Korgan")
See("Korgan")
!Dead("Korgan")
!StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @11116
END G3JPS HowLong2

CHAIN G3JPS StartNow @11118
== ~NALIAJ~ IF ~InParty("Nalia")
See("Nalia")
!Dead("Nalia")
!StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @11119
== G3JPS @11120 = @11121
END
  IF ~~ THEN REPLY @11122 GOTO GoodBye
  IF ~~ THEN REPLY @11123 GOTO GoodBye
  IF ~~ THEN REPLY @11124 GOTO GoodBye

CHAIN G3JPS NotFinished @11125
== ~VALYGARJ~ IF ~InParty("Valygar")
See("Valygar")
!Dead("Valygar")
!StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @11126
== ~G3JPS~ @11127
END
  IF ~~ THEN REPLY @11128 EXTERN ~G3JPS~ SaidAlready
  IF ~~ THEN REPLY @11129 EXTERN ~G3JPS~ NotStarted

/////                                                  \\\\\
///// EXTENDs                                          \\\\\
/////                                                  \\\\\

EXTEND_BOTTOM MURDGIRL 0 1 18 26 27
IF ~Global("G3Scam","GLOBAL",1)~ THEN REPLY @11182 GOTO G3RoseScam
IF ~Global("G3Scam","GLOBAL",2)
    Global("G3ToldScam","LOCALS",1)~ THEN REPLY @10999 GOTO G3RoseTellsAgain
IF ~~ THEN REPLY @11231 GOTO G3RoseGoAway
END

ADD_TRANS_TRIGGER MURDGIRL 26
~False()~
27 DO 0

EXTEND_BOTTOM MERCHANT 0 2
IF ~Global("G3Scam","GLOBAL",1)~ THEN REPLY @11192 GOTO G3BelScam
IF ~Global("G3Scam","GLOBAL",2)
    Global("G3ToldScam","LOCALS",1)~ THEN REPLY @11204 GOTO G3BelTellsAgain
END

EXTEND_BOTTOM BINNKEEP 0
IF ~Global("G3BigRobActivated","GLOBAL",1)~ THEN DO ~SetGlobal("G3BigRobActivated","GLOBAL",2)~ REPLY @10703 GOTO G3CalborZ
END


EXTEND_BOTTOM CROBAR01 1
IF ~Global("G3MoniqQuest","GLOBAL",1)~ THEN REPLY @10341 GOTO G3MoniqueSpawn
END

EXTEND_BOTTOM FFBART 0 3
IF ~Global("G3DewnyQuest","GLOBAL",2)~ THEN REPLY @10418 GOTO Bubbly
END

EXTEND_BOTTOM FFBART 0 8 14 15
IF ~Global("G3MoniqQuest","GLOBAL",1)~ THEN REPLY @10341 GOTO G3CheckSBCC
END

EXTEND_BOTTOM THUMB 0 6
IF ~Global("G3MoniqQuest","GLOBAL",1)~ THEN REPLY @10341 GOTO G3CheckFFCC
IF ~Global("G3Corradun","GLOBAL",1)
    Global("G3Chwisgi","LOCALS",0)~ THEN DO ~SetGlobal("G3Chwisgi","LOCALS",1)~ REPLY @11137 GOTO G3Thumb1
IF ~Global("G3Corradun","GLOBAL",1)
    Global("G3Chwisgi","LOCALS",1)~ THEN REPLY @11137 GOTO G3Thumb2
IF ~Global("G3Corradun","GLOBAL",2)
    Global("G3Chwisgi","LOCALS",0)~ THEN REPLY @11137 GOTO G3Thumb3
IF ~Global("G3Corradun","GLOBAL",2)
    Global("G3Chwisgi","LOCALS",1)~ THEN REPLY @11143 GOTO G3Thumb4
END

EXTEND_BOTTOM WINNKEEP 0 3
IF ~Global("G3SuleciActivated","GLOBAL",1)
    Global("G3DirectedToSuleci","LOCALS",0)~ REPLY @11033 DO ~SetGlobal("G3DirectedToSuleci","LOCALS",0)~ GOTO SirSuleci
END

EXTEND_BOTTOM WSMITH01 0 1 2 3 5 6 7 9 11 58
IF ~Global("G3BigRobActivated","GLOBAL",3)~ THEN REPLY @10489 DO ~SetGlobal("G3BigRobActivated","GLOBAL",4)~ GOTO G3CromZ
IF ~PartyHasItem("G3BRSCRL")~ THEN REPLY @10701 GOTO G3CromY
END

/////                                                  \\\\\
///// appends for existing bioware dialogues           \\\\\
/////                                                  \\\\\

APPEND BINNKEEP
IF ~~ THEN BEGIN G3CalborZ SAY @10704
  IF ~~ THEN REPLY @10705 GOTO G3CalborZZ
  IF ~~ THEN REPLY @10706 GOTO G3CalborZZ
END

IF ~~ THEN BEGIN G3CalborZZ SAY @10707
  IF ~~ THEN EXIT
END
END

APPEND CROBAR01
IF ~~ THEN BEGIN G3MoniqueSpawn SAY @10342
  IF ~~ THEN DO ~SetGlobal("G3MoniqQuest","GLOBAL",2)~ EXIT
END
END

APPEND FFBART
IF ~~ THEN BEGIN G3CheckSBCC SAY @10345 = @10346
  IF ~~ THEN EXIT
END

IF WEIGHT #-1 ~Global("G3DewnyGotCake","GLOBAL",1)~ THEN Works SAY @10415
  IF ~~ THEN DO ~SetGlobal("G3DewnyGotCake","GLOBAL",2)
                 ActionOverride("FFWENCH",MoveToPointNoInterrupt([655.313]))
                 ActionOverride("FFWENCH",ChangeAIScript("WTASIGHT",GENERAL))~ EXIT
END

IF ~~ Bubbly SAY @10416
  IF ~~ THEN REPLY @11131 GOTO Bubbly2
END

IF ~~ Bubbly2 SAY @11132 = @11133
  IF ~!Global("playhouse","GLOBAL",1)~ THEN REPLY #25629 /* ~Alright, you've piqued my interest.  Let me look at what you have.~ */ GOTO 1
  IF ~Global("playhouse","GLOBAL",1)~ THEN REPLY #61152 /* ~Let me see what you have, then.~ */ GOTO 25
  IF ~Global("KnowMurders","GLOBAL",1)
      Global("MurdersSolved","GLOBAL",0)~ THEN REPLY #25630 /* ~What do you know about the murders in the area?~ */ GOTO 2
  IF ~~ THEN REPLY #25631 /* ~I'll be going, now.~ */ GOTO 4
  IF ~InPartySlot(LastTalkedToBy,0)
      GlobalLT("chapter","GLOBAL",%bg2_chapter_4%)~ THEN REPLY #45792 /* ~You must hear things... a friend of mine has been taken captive by the Cowled Wizards.  Do you know where they keep their prisoners?~ */ GOTO 11
END
END

APPEND ~FFCUST07~
IF WEIGHT #-1 ~!GlobalTimerExpired("G3DrunkDwarfWakeUp","GLOBAL")~ THEN Sleeping SAY @10417
  IF ~~ THEN EXIT
END
END

APPEND JAHEIRAJ
IF ~~ THEN BEGIN G3DriniJaheiraIJ SAY @10053
  IF ~~ THEN EXTERN G3DRINI G3DriniImpatient
END
END

APPEND KELDORJ
IF ~~ THEN BEGIN G3KelSuleci SAY @10749
  IF ~~ THEN EXTERN G3DRINI FindSuleci
END
END

APPEND KORGANJ
IF ~~ THEN BEGIN G3KorganPissed SAY @10030
  IF ~~ THEN EXTERN G3SCAM G3ScamThreatened
END
END

APPEND MERCHANT
IF ~~ THEN BEGIN G3BelScam SAY @11193 = @11194
  IF ~~ THEN REPLY @11195 GOTO G3BelKnowsScam1
  IF ~~ THEN REPLY @11196 GOTO G3BelKnowsScam2
  IF ~~ THEN REPLY @11197 GOTO G3BelKnowsScam2
  IF ~~ THEN REPLY @11198 GOTO G3BelBuzzOff
END

IF ~~ THEN BEGIN G3BelBuzzOff SAY @11203
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN G3BelKnowsScam1 SAY @11199 = @11200
  IF ~~ THEN DO ~SetGlobal("G3Scam","GLOBAL",2)
                 SetGlobal("G3ToldScam","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN G3BelKnowsScam2 SAY @11201 = @11202
  IF ~~ THEN DO ~SetGlobal("G3Scam","GLOBAL",2)
                 SetGlobal("G3ToldScam","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN G3BelTellsAgain SAY @11205
  IF ~~ THEN EXIT
END
END

APPEND MURDGIRL
IF ~~ THEN BEGIN G3RoseScam SAY @11183
  IF ~~ THEN REPLY @11184 GOTO G3RoseKnows
  IF ~~ THEN REPLY @11185 GOTO G3RoseGoAway
  IF ~~ THEN REPLY @11186 GOTO G3RoseKnows
END

IF ~~ THEN BEGIN G3RoseGoAway SAY @11187
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN G3RoseKnows SAY @11188 = @11189
  IF ~~ THEN DO ~SetGlobal("G3Scam","GLOBAL",2)
                 SetGlobal("G3ToldScam","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN G3RoseTellsAgain SAY @11191
  IF ~~ THEN EXIT
END
END

APPEND SEVBAR01
IF WEIGHT #-1 ~Gender(LastTalkedToBy,MALE)
Global("G3GrimAndDancer","GLOBAL",1)
Global("G3PatriciaChat","GLOBAL",0)~ THEN BEGIN G3QuestMale
SAY @11162
IF ~~ THEN REPLY @11163 DO ~SetGlobal("G3PatriciaChat","GLOBAL",1)~ GOTO MaleThisBar
IF ~~ THEN REPLY @11164 DO ~SetGlobal("G3PatriciaChat","GLOBAL",1)~ GOTO MaleGrappa
END

IF WEIGHT #-1 ~Gender(LastTalkedToBy,FEMALE)
Global("G3GrimAndDancer","GLOBAL",1)
Global("G3PatriciaChat","GLOBAL",0)~ THEN BEGIN G3QuestFemale
SAY @11165
IF ~~ THEN REPLY @11163 DO ~SetGlobal("G3PatriciaChat","GLOBAL",1)~ GOTO Female
IF ~~ THEN REPLY @11164 DO ~SetGlobal("G3PatriciaChat","GLOBAL",1)~ GOTO Female
END

IF ~~ THEN BEGIN Female
SAY @11166
= @11167
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN MaleThisBar
SAY @11168
= @11169
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN MaleGrappa
SAY @11170
= @11169
IF ~~ THEN EXIT
END
END

APPEND THUMB
IF ~~ THEN BEGIN G3CheckFFCC SAY @10343
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN G3Thumb1 SAY @11141 = @11142
  COPY_TRANS THUMB 6
END

IF ~~ THEN BEGIN G3Thumb2 SAY @11146
  COPY_TRANS THUMB 6
END

IF ~~ THEN BEGIN G3Thumb3 SAY @11145
  IF ~CheckStatGT(LastTalkedToBy,16,CHR)~ THEN REPLY @11147 GOTO Discount
  IF ~!CheckStatGT(LastTalkedToBy,16,CHR)~ THEN REPLY @11147 GOTO NoDiscount
  IF ~PartyGoldGT(49)~ THEN REPLY @11148 DO ~TakePartyGold(50)
                                            GiveItemCreate("G3Drink2",LastTalkedToBy,1,0,0)
                                            SetGlobal("G3Chwisgi","LOCALS",2)~ GOTO Sold
  IF ~~ THEN REPLY @11149 GOTO NoDice
END

IF ~~ THEN BEGIN G3Thumb4 SAY @11144
  IF ~CheckStatGT(LastTalkedToBy,16,CHR)~ THEN REPLY @11147 GOTO Discount
  IF ~!CheckStatGT(LastTalkedToBy,16,CHR)~ THEN REPLY @11147 GOTO NoDiscount
  IF ~PartyGoldGT(49)~ THEN REPLY @11148 DO ~TakePartyGold(50)
                                            GiveItemCreate("G3Drink2",LastTalkedToBy,1,0,0)
                                            SetGlobal("G3Chwisgi","LOCALS",2)~ GOTO Sold
  IF ~~ THEN REPLY @11149 GOTO NoDice
END

IF ~~ THEN BEGIN Discount SAY @11176
  IF ~PartyGoldGT(39)~ THEN REPLY @11148 DO ~TakePartyGold(40)
                                            GiveItemCreate("G3Drink2",LastTalkedToBy,1,0,0)
                                            SetGlobal("G3Chwisgi","LOCALS",2)~ GOTO Sold
  IF ~~ THEN REPLY @11149 GOTO NoDice
END

IF ~~ THEN BEGIN NoDiscount SAY @11150
  IF ~PartyGoldGT(49)~ THEN REPLY @11148 DO ~TakePartyGold(50)
                                            GiveItemCreate("G3Drink2",LastTalkedToBy,1,0,0)
                                            SetGlobal("G3Chwisgi","LOCALS",2)~ GOTO Sold
  IF ~~ THEN REPLY @11149 GOTO NoDice
END

IF ~~ THEN BEGIN Sold SAY @11151
  COPY_TRANS THUMB 6
END

IF ~~ THEN BEGIN NoDice SAY @11152
  IF ~~ THEN EXIT
END
END

APPEND WINNKEEP
IF ~~ THEN SirSuleci SAY @11034
= @11035
  COPY_TRANS WINNKEEP 0
END
END

APPEND WSMITH01
IF ~~ THEN BEGIN G3CromZ SAY @10490
  IF ~~ THEN REPLY @10491 GOTO G3CromZZ
  IF ~~ THEN REPLY @10696 GOTO G3CromZY
END

IF ~~ THEN BEGIN G3CromZZ SAY @10697
  IF ~~ THEN GOTO G3CromZZZ
END

IF ~~ THEN BEGIN G3CromZY SAY @10698
  IF ~~ THEN GOTO G3CromZZZ
END

IF ~~ THEN BEGIN G3CromZZZ SAY @10699 = @10700
  COPY_TRANS WSMITH01 7
END

IF ~~ THEN BEGIN G3CromY SAY @10702
  IF ~~ THEN DO ~TakeItemReplace("G3OIL","G3BRSCRL",LastTalkedToBy)
                 DestroyItem("G3BRSCRL")~ EXIT
END
END

APPEND YOSHJ
IF ~~ THEN BEGIN G3YoshiJealous SAY @11036
  IF ~~ THEN EXTERN G3KEBODI G3IDScam
END
END


