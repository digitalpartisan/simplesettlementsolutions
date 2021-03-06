Scriptname SimpleSettlementSolutions:Reference:LinkToWorkshop extends ObjectReference
{This script's name is a misnomer because in its original state, it linked the Workshop to itself rather than the other way around as the name would imply.
To preverse functionality on already-released mods, the WrongWayAround boolean property was added and defaulted to true and must be set to false in order to achieve the expected functionality.}

Keyword Property MyKeyword Auto Const Mandatory
Bool Property WrongWayAround = true Auto Const

Keyword Function getKeyword()
	return MyKeyword
EndFunction

Function setLink(ObjectReference akTarget, ObjectReference linkedRef = None)
	Keyword linkType = getKeyword()

	if (!linkType)
		return
	endif
	
	WorkshopScript workshopRef = akTarget as WorkshopScript
	if (!workshopRef)
		return
	endif
	
	if (WrongWayAround)
		SimpleSettlementSolutions:Reference:Logger.logLinkWorkshopTo(self, workshopRef, linkType, linkedRef)
		workshopRef.SetLinkedRef(linkedRef, linkType)
	else
		SimpleSettlementSolutions:Reference:Logger.logLinkToWorkshop(self, workshopRef, linkType, linkedRef)
		linkedRef.SetLinkedRef(workshopRef, linkType)
	endif
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
