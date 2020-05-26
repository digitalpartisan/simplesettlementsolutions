Scriptname SimpleSettlementSolutions:Reference Hidden Const

WorkshopScript Function getWorkshopReference(ObjectReference akTargetRef) Global
	if (!akTargetRef)
		return None
	endif
	
	return akTargetRef.getLinkedRef(SimpleSettlementSolutions:Utility:Keyword.getWorkshopItem()) as WorkshopScript
EndFunction

Bool Function isWorkshopItem(ObjectReference akTargetRef) Global
	return getWorkshopReference(akTargetRef) as Bool
EndFunction
