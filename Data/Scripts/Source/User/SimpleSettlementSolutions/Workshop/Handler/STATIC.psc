Scriptname SimpleSettlementSolutions:Workshop:Handler:STATIC extends SimpleSettlementSolutions:Workshop:Handler Conditional

WorkshopScript Property MyWorkshop Auto Const Mandatory

WorkshopScript Function getWorkshop()
	return MyWorkshop
EndFunction

Function setWorkshop(WorkshopScript newValue)
	; do nothing - the engine is already set
EndFunction
