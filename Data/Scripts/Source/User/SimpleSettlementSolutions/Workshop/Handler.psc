Scriptname SimpleSettlementSolutions:Workshop:Handler extends DynamicTerminal:Basic Conditional

Message Property InvalidWorkshopMessage Auto Const Mandatory
{The message to display in the terminal if an invalid engine is specified.}

Bool bValid = false Conditional ; whether or not there's a valid Engine to handle
Bool bOwnedByPlayer = false Conditional ; whether or not the player owns this workshop

WorkshopScript workshopRef = None

Bool Function isValid()
	return bValid
EndFunction

Bool Function isOwnedByPlayer()
	return bOwnedByPlayer
EndFunction

WorkshopScript Function getWorkshop()
	return workshopRef
EndFunction

Function setWorkshop(WorkshopScript newValue)
	workshopRef = newValue
	refreshStatus()
EndFunction

Function clearStatus()
	bValid = false
	bOwnedByPlayer = false
EndFunction

Function setStatus()
	WorkshopScript myWorkshop = getWorkshop()
	bOwnedByPlayer = myWorkshop.OwnedByPlayer
EndFunction

Function refreshStatus()
	clearStatus()
	
	WorkshopScript myWorkshop = getWorkshop()
	bValid = myWorkshop as Bool
	isValid() && setStatus()
EndFunction

Function takeOwnership(ObjectReference akTerminalRef)
	getWorkshop().SetOwnedByPlayer(true)
	refreshStatus()
	draw(akTerminalRef)
EndFunction

Function tokenReplacementLogic()
	if (isValid())
		replace("SelectedWorkshop", getWorkshop().myLocation)
	else
		replace("SelectedWorkshop", InvalidWorkshopMessage) ; The terminal shouldn't show a replacement field in this case, but caution never hurt
	endif
EndFunction
