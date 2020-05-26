Scriptname SimpleSettlementSolutions:Utility Hidden Const

Form Function getForm(Int iFormID, String sPlugin = "") Global
	String sPluginName = sPlugin
	if ("" == sPluginName)
		sPluginName = "Fallout4.esm"
	endif
	
	return Game.GetFormFromFile(iFormID, sPluginName)
EndFunction

WorkshopParentScript Function getWorkshopParent() Global
	return getForm(0x0002058E) as WorkshopParentScript
EndFunction

WorkshopScript Function getWorkshopFromObject(WorkshopObjectScript akTargetObject) Global
	if (!akTargetObject)
		return None
	endif
	
	return getWorkshopParent().getWorkshop(akTargetObject.workshopID)
EndFunction
