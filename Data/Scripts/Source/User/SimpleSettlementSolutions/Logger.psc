Scriptname SimpleSettlementSolutions:Logger Hidden Const DebugOnly

String Function getName() Global
	return "SimpleSettlementSolutions"
EndFunction

Bool Function log(String sMessage, String[] tags = None) Global
	return Jiffy:Loggout.log(getName(), sMessage, tags)
EndFunction

Bool Function warn(String sMessage, String[] tags = None) Global
	return Jiffy:Loggout.warn(getName(), sMessage, tags)
EndFunction

Bool Function error(String sMessage, String[] tags = None) Global
	return Jiffy:Loggout.error(getName(), sMessage, tags)
EndFunction

Bool Function logGlobalAdjustment(SimpleSettlementSolutions:GlobalCounter counter, GlobalVariable variable, Float adjustment) Global
	return log(counter + " adjusted " + variable + " by " + adjustment + " to " + variable.GetValue())
EndFunction

Bool Function logWorkshopLink(SimpleSettlementSolutions:LinkRefToWorkshop linker, WorkshopScript workshopRef, Keyword linkKeyword, ObjectReference linkedRef) Global
	return log(linker + " is linking to workshop " + workshopRef + " " + linkKeyword + " to " + linkedRef)
EndFunction
