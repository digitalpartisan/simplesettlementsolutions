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

Bool Function logWorkshopLink(SimpleSettlementSolutions:Reference:LinkToWorkshop linker, WorkshopScript workshopRef, Keyword linkKeyword, ObjectReference linkedRef) Global
	return log(linker + " is linking to workshop " + workshopRef + " " + linkKeyword + " to " + linkedRef)
EndFunction
