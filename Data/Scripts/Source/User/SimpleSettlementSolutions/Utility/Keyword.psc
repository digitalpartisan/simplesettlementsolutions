Scriptname SimpleSettlementSolutions:Utility:Keyword Hidden Const

Keyword Function get(Int formID, String sPluginName = "") Global
	return SimpleSettlementSolutions:Utility.getForm(formID, sPluginName) as Keyword
EndFunction

Keyword Function getWorkshopItem() Global
	return get(0x00054BA6)
EndFunction
