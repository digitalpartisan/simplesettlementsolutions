Scriptname SimpleSettlementSolutions:Reference:GlobalCounter extends ObjectReference

GlobalVariable Property MyGlobal Auto Const Mandatory
Float Property Scale = 1.0 Auto Const

Function adjust(Float adjustment)
	if (!MyGlobal)
		return
	endif
	
	MyGlobal.mod(adjustment)
	SimpleSettlementSolutions:Reference:Logger.logGlobalAdjustment(self, MyGlobal, adjustment)
EndFunction

Function increment()
	adjust(Scale)
EndFunction

Function decrement()
	adjust(-1.0 * Scale)
EndFunction

Event OnWorkshopObjectDestroyed(ObjectReference akReference)
	decrement()
EndEvent

Event OnWorkshopObjectPlaced(ObjectReference akReference)
	increment()
EndEvent

Event OnWorkshopObjectMoved(ObjectReference akReference)
	increment()
EndEvent

Event OnWorkshopObjectGrabbed(ObjectReference akReference)
	decrement()
EndEvent
