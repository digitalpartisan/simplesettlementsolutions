Scriptname SimpleSettlementSolutionsTesting:PickerTrigger extends ObjectReference

ReferenceAlias Property PickerAlias Auto Const Mandatory
ObjectReference Property SanctuaryWorkshopReference Auto Const Mandatory
Location Property RedRocketTruckStopLocation Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
	SimpleSettlementSolutions:Workshop:Picker:Logger.log("Chosen workshop is " + (PickerAlias.GetReference() as SimpleSettlementSolutions:Workshop:Picker).pick(RedRocketTruckStopLocation, SanctuaryWorkshopReference as WorkshopScript))
EndEvent
