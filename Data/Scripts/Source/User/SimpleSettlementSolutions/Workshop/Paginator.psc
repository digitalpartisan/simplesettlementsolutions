Scriptname SimpleSettlementSolutions:Workshop:Paginator extends DynamicTerminal:Paginator

Form Function getItemReplacementValue(Form rawItem)
	WorkshopScript workshopRef = rawItem as WorkshopScript
	if (workshopRef)
		return workshopRef.myLocation
	else
		return None
	endif
EndFunction
