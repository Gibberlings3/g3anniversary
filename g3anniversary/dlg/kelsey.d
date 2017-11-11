EXTEND_BOTTOM G3BEV BevThinksKelseyIsHot
IF ~InParty("J#Kelsey")
    See("J#Kelsey")
    !Dead("J#Kelsey")
    !StateCheck("J#Kelsey",CD_STATE_NOTVALID)~ DO ~SG("G3LadyBevActivated",2)~ GOTO LadyBevKelseyExchange
END

CHAIN ~G3BEV~ LadyBevKelseyExchange @11117 = @11232
== ~J#KLSYJ~ @11233
== ~G3BEV~ @11112
  COPY_TRANS G3BEV KelseyNotAtFault
