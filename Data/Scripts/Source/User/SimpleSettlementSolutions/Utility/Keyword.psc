Scriptname SimpleSettlementSolutions:Utility:Keyword Hidden Const

Keyword Function get(Int formID, String sPluginName = "") Global
	return SimpleSettlementSolutions:Utility.getForm(formID, sPluginName) as Keyword
EndFunction

Keyword Function getWorkshopItem() Global
	return get(0x00054BA6)
EndFunction

Keyword Function getContainerLink() Global
	return get(0x0002682F)
EndFunction

Keyword Function getWorkbenchGeneral() Global
	return get(0x00091FD4)
EndFunction

Keyword Function getWorkshop() Global
	return get(0x00054BA7)
EndFunction

Keyword Function getPowerArmorWorkbench() Global
	return get(0x001F6600)
EndFunction
