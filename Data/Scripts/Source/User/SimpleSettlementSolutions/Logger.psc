Scriptname SimpleSettlementSolutions:Logger Hidden Const DebugOnly

String Function getName() Global
	return "SimpleSettlementSolutions"
EndFunction

Bool Function log(String sMessage) Global
	return Jiffy:Loggout.log(getName(), sMessage)
EndFunction

Bool Function warn(String sMessage) Global
	return Jiffy:Loggout.warn(getName(), sMessage)
EndFunction

Bool Function error(String sMessage) Global
	return Jiffy:Loggout.error(getName(), sMessage)
EndFunction

Bool Function logGlobalAdjustment(SimpleSettlementSolutions:GlobalCounter counter, GlobalVariable variable, Float adjustment) Global
	return log(counter + " adjusted " + variable + " by " + adjustment + " to " + variable.GetValue())
EndFunction

Bool Function logWorkshopLink(SimpleSettlementSolutions:LinkRefToWorkshop linker, WorkshopScript workshopRef, Keyword linkKeyword, ObjectReference linkedRef) Global
	return log(linker + " is linking to workshop " + workshopRef + " " + linkKeyword + " to " + linkedRef)
EndFunction
