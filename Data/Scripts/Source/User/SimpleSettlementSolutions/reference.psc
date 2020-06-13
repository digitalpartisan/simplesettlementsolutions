Scriptname SimpleSettlementSolutions:Reference Hidden Const

WorkshopScript Function getWorkshopReference(ObjectReference akTargetRef) Global
	return getLinkedRef(akTargetRef, SimpleSettlementSolutions:Utility:Keyword.getWorkshopItem()) as WorkshopScript
EndFunction

Bool Function isWorkshopItem(ObjectReference akTargetRef) Global
	return getLinkedRef(akTargetRef, SimpleSettlementSolutions:Utility:Keyword.getWorkshopItem()) as Bool
EndFunction

Function linkToWorkshop(ObjectReference akTargetRef, ObjectReference linkTarget) Global
	akTargetRef && linkTarget && akTargetRef.SetLinkedRef(linkTarget, SimpleSettlementSolutions:Utility:Keyword.getWorkshopItem())
EndFunction

Function unlinkFromWorkshop(ObjectReference akTargetRef) Global
	akTargetRef && akTargetRef.SetLinkedRef(None, SimpleSettlementSolutions:Utility:Keyword.getWorkshopItem())
EndFunction

Function linkToContainer(ObjectReference akTargetRef, ObjectReference containerRef) Global
	akTargetRef && containerRef && akTargetRef.SetLinkedRef(containerRef, SimpleSettlementSolutions:Utility:Keyword.getContainerLink())
EndFunction

Function unlinkFromContainer(ObjectReference akTargetRef) Global
	akTargetRef && akTargetRef.SetLinkedRef(None, SimpleSettlementSolutions:Utility:Keyword.getContainerLink())
EndFunction

Bool Function isWorkshop(ObjectReference akTargetRef) Global
	return akTargetRef && akTargetRef.HasKeyword(SimpleSettlementSolutions:Utility:Keyword.getWorkshop()) && akTargetRef as WorkshopScript
EndFunction

Bool Function isWorkbench(ObjectReference akTargetRef) Global
	return akTargetRef && akTargetRef.HasKeyword(SimpleSettlementSolutions:Utility:Keyword.getWorkbenchGeneral()) && !akTargetRef.HasKeyword(SimpleSettlementSolutions:Utility:Keyword.getWorkshop())
EndFunction

Bool Function isPowerArmorWorkbench(ObjectReference akTargetRef) Global
	return isWorkbench(akTargetRef) && akTargetRef.HasKeyword(SimpleSettlementSolutions:Utility:Keyword.getPowerArmorWorkbench()) && (aktargetRef as PowerArmorWorkbench)
EndFunction

ObjectReference Function getLinkedRef(ObjectReference akTargetRef, Keyword linkType) Global
	if (akTargetRef && linkType)
		return akTargetRef.GetLinkedRef(linkType)
	endif

	return None
EndFunction

ObjectReference Function getWorkshopLink(ObjectReference akTargetRef) Global
	return getLinkedRef(akTargetRef, SimpleSettlementSolutions:Utility:Keyword.getWorkbenchGeneral())
EndFunction

ObjectReference Function getContainerLink(ObjectReference akTargetRef) Global
	return getLinkedRef(akTargetRef, SimpleSettlementSolutions:Utility:Keyword.getContainerLink())
EndFunction
