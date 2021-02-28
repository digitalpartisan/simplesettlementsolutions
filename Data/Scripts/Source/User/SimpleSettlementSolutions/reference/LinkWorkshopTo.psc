Scriptname SimpleSettlementSolutions:reference:LinkWorkshopTo extends ObjectReference
{This script's name is a misnomer as this script originally links the workshop to this reference and not the other way around as the name would imply.
For legacy reasons, this script must stay the way it is.}

Keyword Property MyKeyword Auto Const Mandatory
Bool Property 

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
	
	SimpleSettlementSolutions:Reference:Logger.logWorkshopLink(self, workshopRef, linkType, linkedRef)
	workshopRef.SetLinkedRef(linkedRef, linkType)
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
