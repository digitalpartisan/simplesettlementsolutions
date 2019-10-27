Scriptname SimpleSettlementSolutionsTesting:PickerTrigger extends ObjectReference

SimpleSettlementSolutions:Picker:Handler Property SimpleSettlementSolutions_Picker_Handler Auto Const Mandatory
ObjectReference Property SanctuaryWorkshopReference Auto Const Mandatory
Location Property RedRocketTruckStopLocation Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
	if (Game.GetPlayer() == akActionRef)
		SimpleSettlementSolutions:Logger.log("Chosen workshop is " + SimpleSettlementSolutions_Picker_Handler.pickWithDefault(RedRocketTruckStopLocation, SanctuaryWorkshopReference as WorkshopScript))
	endif
EndEvent
