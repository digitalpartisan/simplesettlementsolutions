Scriptname SimpleSettlementSolutions:Workshop:Picker:Logger Hidden Const DebugOnly

String[] Function getTags() Global
	String[] tags = new String[0]
	tags.Add("Workshop Picker")
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

Bool Function logOpeningMenu(SimpleSettlementSolutions:Workshop:Picker pickerRef) Global
	return log("Location picker " + pickerRef + " is opening settlement menu")
EndFunction

Bool Function logLocationSettlementMatch(SimpleSettlementSolutions:Workshop:Picker pickerRef, Location locationValue, WorkshopScript workshopRef) Global
	return log("Location picker " + pickerRef + " has matched location " + locationValue + " to workshop " + workshopRef)
EndFunction

Bool Function logPickerResult(SimpleSettlementSolutions:Workshop:Picker picker, Location result) Global
	return log(picker + " has selected location " + result)
EndFunction
