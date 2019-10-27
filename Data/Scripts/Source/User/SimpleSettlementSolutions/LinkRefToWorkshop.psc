Scriptname SimpleSettlementSolutions:LinkRefToWorkshop extends ObjectReference Const

Keyword Property MyKeyword Auto Const Mandatory

Function setLink(ObjectReference akTarget, ObjectReference linkedRef = None)
	if (!MyKeyword)
		return
	endif
	
	WorkshopScript workshopRef = akTarget as WorkshopScript
	if (!workshopRef)
		return
	endif
	
	SimpleSettlementSolutions:Logger.logWorkshopLink(self, workshopRef, MyKeyword, linkedRef)
	workshopRef.SetLinkedRef(linkedRef, MyKeyword)
EndFunction

Function link(ObjectReference akReference)
	setLink(akReference, self)
EndFunction

Function unlink(ObjectReference akReference)
	setLink(akReference)
EndFunction

Event OnWorkshopObjectPlaced(ObjectReference akReference)
	link(akReference)
EndEvent

Event OnWorkshopObjectDestroyed(ObjectReference akReference)
	unlink(akReference)
EndEvent

Event OnWorkshopObjectMoved(ObjectReference akReference)
	link(akReference)
EndEvent

Event OnWorkshopObjectGrabbed(ObjectReference akReference)
	unlink(akReference)
EndEvent
