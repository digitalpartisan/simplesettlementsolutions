Scriptname SimpleSettlementSolutions:Workshop:Handler:Player extends SimpleSettlementSolutions:Workshop:Handler Conditional

WorkshopParentScript Property WorkshopParent Auto Const Mandatory

Function refreshWorkshop()
	setWorkshop(WorkshopParent.getWorkshopFromLocation(Game.GetPlayer().GetCurrentLocation()))
EndFunction
