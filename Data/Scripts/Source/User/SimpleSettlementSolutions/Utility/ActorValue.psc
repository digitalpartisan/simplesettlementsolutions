Scriptname SimpleSettlementSolutions:Utility:ActorValue Hidden Const

ActorValue Function get(Int formID, String sPluginName = "") Global
	return SimpleSettlementSolutions:Utility.getForm(formID, sPluginName) as ActorValue
EndFunction

ActorValue Function getPowerRequired() Global
	return get(0x00000330)
EndFunction
