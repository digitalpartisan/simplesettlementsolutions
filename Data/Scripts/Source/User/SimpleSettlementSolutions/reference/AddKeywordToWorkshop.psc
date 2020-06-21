Scriptname SimpleSettlementSolutions:Reference:AddKeywordToWorkshop extends ObjectReference

Keyword Property MyKeyword Auto Const Mandatory
Bool Property OnlyIfPowered = false Auto Const

WorkshopScript myWorkshop = None ; so that we don't need to extend WorkshopObjectScript and possibly interfere with that script or one of its children that is also attached to the object using this script

Keyword Function getKeyword()
	return MyKeyword
EndFunction

Bool Function requiresPower()
	return OnlyIfPowered
EndFunction

WorkshopScript Function getWorkshop()
	return myWorkshop
EndFunction

Bool Function hasWorkshop()
	return getWorkshop() as Bool
EndFunction

Function setWorkshop(ObjectReference akWorkshopRef)
	myWorkshop = akWorkshopRef as WorkshopScript
EndFunction

Function addMyKeyword()
	hasWorkshop() && getWorkshop().AddKeyword(getKeyword())
EndFunction

Function removeMyKeyword()
	hasWorkshop() && getWorkshop().RemoveKeyword(getKeyword())
EndFunction

Bool Function conditionsMet()
	return !requiresPower() || IsPowered()
EndFunction

Function checkState()
	if (conditionsMet())
		addMyKeyword()
	else
		removeMyKeyword()
	endif
EndFunction

Event OnWorkshopObjectPlaced(ObjectReference akReference)
	setWorkshop(akReference)
	checkState()
EndEvent

Event OnWorkshopObjectDestroyed(ObjectReference akReference)
	removeMyKeyword()
EndEvent

Event OnPowerOn(ObjectReference akPowerGenerator)
	checkState()
EndEvent

Event OnPowerOff()
	checkState()
EndEvent
