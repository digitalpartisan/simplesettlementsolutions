Scriptname SimpleSettlementSolutions:Workshop:List extends DynamicTerminal:ListWrapper:FormArray

Form[] Function getRawData()
	return SimpleSettlementSolutions:Utility.getWorkshopParent().Workshops as Form[]
EndFunction
