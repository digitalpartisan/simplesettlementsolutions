Scriptname SimpleSettlementSolutions:AddKeywordToWorkshop extends ObjectReference

Keyword Property KeywordToAdd Auto Const Mandatory
Bool Property RequiresPower = false Auto Const

WorkshopScript myWorkshop = None ; so that we don't need to extend WorkshopObjectScript and possibly interfere with that script or one of its children that is also attached to the object using this script

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
	hasWorkshop() && getWorkshop().AddKeyword(KeywordToAdd)
EndFunction

Function removeMyKeyword()
	hasWorkshop() && getWorkshop().RemoveKeyword(KeywordToAdd)
EndFunction

Bool Function conditionsMet()
	return !RequiresPower || IsPowered()
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
