Scriptname SimpleSettlementSolutions:Reference:Logger Hidden Const DebugOnly

String[] Function getTags() Global
	String[] tags = new String[0]
	tags.Add("Reference")
	return tags
EndFunction

Bool Function log(String sMessage) Global
	return SimpleSettlementSolutions:Logger.log(sMessage, getTags())
EndFunction

Bool Function warn(String sMessage) Global
	return SimpleSettlementSolutions:Logger.warn(sMessage, getTags())
EndFunction

Bool Function error(String sMessage) Global
	return SimpleSettlementSolutions:Logger.error(sMessage, getTags())
EndFunction

Bool Function logGlobalAdjustment(SimpleSettlementSolutions:Reference:GlobalCounter counter, GlobalVariable variable, Float adjustment) Global
	return log(counter + " adjusted " + variable + " by " + adjustment + " to " + variable.GetValue())
EndFunction

Bool Function logLinkToWorkshop(SimpleSettlementSolutions:Reference:LinkToWorkshop linker, WorkshopScript workshopRef, Keyword linkKeyword, ObjectReference linkedRef) Global
	return log(linker + " is linking " + linkedRef + " to workshop " + workshopRef + " with keyword " + linkKeyword)
EndFunction

Bool Function logLinkWorkshopTo(SimpleSettlementSolutions:Reference:LinkToWorkshop linker, WorkshopScript workshopRef, Keyword linkKeyword, ObjectReference linkedRef) Global
	return log(linker + " is linking workshop " + workshopRef + " to " + linkedRef + " with keyword " + linkKeyword)
EndFunction
