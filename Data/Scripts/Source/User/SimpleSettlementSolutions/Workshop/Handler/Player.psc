Scriptname SimpleSettlementSolutions:Workshop:Handler:Player extends SimpleSettlementSolutions:Workshop:Handler Conditional

WorkshopParentScript Property WorkshopParent Auto Const Mandatory

Function refreshStatus()
	setWorkshop(WorkshopParent.getWorkshopFromLocation(Game.GetPlayer().GetCurrentLocation()))
	parent.refreshStatus()
EndFunction
