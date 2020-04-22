Scriptname SimpleSettlementSolutions:AddKeywordToWorkshop extends ObjectReference

Keyword Property KeywordToAdd Auto Const Mandatory

Event OnWorkshopObjectPlaced(ObjectReference akReference)
	WorkshopScript workshopRef = akReference as WorkshopScript
	workshopRef && workshopRef.AddKeyword(KeywordToAdd)
EndEvent

Event OnWorkshopObjectDestroyed(ObjectReference akReference)
	WorkshopScript workshopRef = akReference as WorkshopScript
	workshopRef && workshopRef.RemoveKeyword(KeywordToAdd)
EndEvent
