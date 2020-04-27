Scriptname SimpleSettlementSolutions:Utility Hidden Const

WorkshopParentScript Function getWorkshopParent() Global
	return Game.GetForm(0x0002058E) as WorkshopParentScript
EndFunction

WorkshopScript Function getWorkshopFromObject(WorkshopObjectScript akTargetObject) Global
	if (!akTargetObject)
		return None
	endif
	
	return getWorkshopParent().getWorkshop(akTargetObject.workshopID)
EndFunction
