Scriptname SimpleSettlementSolutions:Scrapper extends ObjectReference
{Autofill everyting.}

CustomEvent Processing
CustomEvent Processed
CustomEvent Pulling
CustomEvent Pulled

Struct ScrapConversion
	Component componentForm = None
	MiscObject scrapForm = None
	Int count = 0
EndStruct

Group Components
	Component Property c_Acid Auto Const Mandatory
	Component Property c_Adhesive Auto Const Mandatory
	Component Property c_Aluminum Auto Const Mandatory
	Component Property c_AntiBallisticFiber Auto Const Mandatory
	Component Property c_Antiseptic Auto Const Mandatory
	Component Property c_Asbestos Auto Const Mandatory
	Component Property c_Bone Auto Const Mandatory
	Component Property c_Ceramic Auto Const Mandatory
	Component Property c_Circuitry Auto Const Mandatory
	Component Property c_Cloth Auto Const Mandatory
	Component Property c_Concrete Auto Const Mandatory
	Component Property c_Copper Auto Const Mandatory
	Component Property c_Cork Auto Const Mandatory
	Component Property c_Crystal Auto Const Mandatory
	Component Property c_Fertilizer Auto Const Mandatory
	Component Property c_Fiberglass Auto Const Mandatory
	Component Property c_FiberOptics Auto Const Mandatory
	Component Property c_Gears Auto Const Mandatory
	Component Property c_Glass Auto Const Mandatory
	Component Property c_Gold Auto Const Mandatory
	Component Property c_Lead Auto Const Mandatory
	Component Property c_Leather Auto Const Mandatory
	Component Property c_NuclearMaterial Auto Const Mandatory
	Component Property c_Oil Auto Const Mandatory
	Component Property c_Plastic Auto Const Mandatory
	Component Property c_Rubber Auto Const Mandatory
	Component Property c_Screws Auto Const Mandatory
	Component Property c_Silver Auto Const Mandatory
	Component Property c_Springs Auto Const Mandatory
	Component Property c_Steel Auto Const Mandatory
	Component Property c_Wood Auto Const Mandatory
EndGroup

Group Scrap
	MiscObject Property c_Acid_scrap Auto Const Mandatory
	MiscObject Property c_Adhesive_scrap Auto Const Mandatory
	MiscObject Property c_Aluminum_scrap Auto Const Mandatory
	MiscObject Property c_AntiBallisticFiber_scrap Auto Const Mandatory
	MiscObject Property c_Antiseptic_scrap Auto Const Mandatory
	MiscObject Property c_Asbestos_scrap Auto Const Mandatory
	MiscObject Property c_Bone_scrap Auto Const Mandatory
	MiscObject Property c_Ceramic_scrap Auto Const Mandatory
	MiscObject Property c_Circuitry_scrap Auto Const Mandatory
	MiscObject Property c_Cloth_scrap Auto Const Mandatory
	MiscObject Property c_Concrete_scrap Auto Const Mandatory
	MiscObject Property c_Copper_scrap Auto Const Mandatory
	MiscObject Property c_Cork_scrap Auto Const Mandatory
	MiscObject Property c_Crystal_scrap Auto Const Mandatory
	MiscObject Property c_Fertilizer_scrap Auto Const Mandatory
	MiscObject Property c_Fiberglass_scrap Auto Const Mandatory
	MiscObject Property c_FiberOptics_scrap Auto Const Mandatory
	MiscObject Property c_Gears_scrap Auto Const Mandatory
	MiscObject Property c_Glass_scrap Auto Const Mandatory
	MiscObject Property c_Gold_scrap Auto Const Mandatory
	MiscObject Property c_Lead_scrap Auto Const Mandatory
	MiscObject Property c_Leather_scrap Auto Const Mandatory
	MiscObject Property c_NuclearMaterial_scrap Auto Const Mandatory
	MiscObject Property c_Oil_scrap Auto Const Mandatory
	MiscObject Property c_Plastic_scrap Auto Const Mandatory
	MiscObject Property c_Rubber_scrap Auto Const Mandatory
	MiscObject Property c_Screws_scrap Auto Const Mandatory
	MiscObject Property c_Silver_scrap Auto Const Mandatory
	MiscObject Property c_Springs_scrap Auto Const Mandatory
	MiscObject Property c_Steel_scrap Auto Const Mandatory
	MiscObject Property c_Wood_scrap Auto Const Mandatory
EndGroup

FormList Property WorkshopConsumeScavenge Auto Const Mandatory

ScrapConversion[] conversions = None
ObjectReference containerRef = None

Bool Function validateConversion(ScrapConversion data)
	return data.componentForm && data.scrapForm
EndFunction

ScrapConversion Function makeConversion(Component componentForm, MiscObject scrapForm)
	if (!componentForm || !scrapForm)
		return None
	endif
	
	ScrapConversion result = new ScrapConversion
	result.componentForm = componentForm
	result.scrapForm = scrapForm
	
	return result
EndFunction

ScrapConversion[] Function makeConversions()
	ScrapConversion[] result = new ScrapConversion[0]
	result.Add(makeConversion(c_Acid, c_Acid_scrap))
	result.Add(makeConversion(c_Adhesive, c_Adhesive_scrap))
	result.Add(makeConversion(c_Aluminum, c_Aluminum_scrap))
	result.Add(makeConversion(c_AntiBallisticFiber, c_AntiBallisticFiber_scrap))
	result.Add(makeConversion(c_Antiseptic, c_Antiseptic_scrap))
	result.Add(makeConversion(c_Asbestos, c_Asbestos_scrap))
	result.Add(makeConversion(c_Bone, c_Bone_scrap))
	result.Add(makeConversion(c_Ceramic, c_Ceramic_scrap))
	result.Add(makeConversion(c_Circuitry, c_Circuitry_scrap))
	result.Add(makeConversion(c_Cloth, c_Cloth_scrap))
	result.Add(makeConversion(c_Concrete, c_Concrete_scrap))
	result.Add(makeConversion(c_Copper, c_Copper_scrap))
	result.Add(makeConversion(c_Cork, c_Cork_scrap))
	result.Add(makeConversion(c_Crystal, c_Crystal_scrap))
	result.Add(makeConversion(c_Fertilizer, c_Fertilizer_scrap))
	result.Add(makeConversion(c_Fiberglass, c_Fiberglass_scrap))
	result.Add(makeConversion(c_FiberOptics, c_FiberOptics_scrap))
	result.Add(makeConversion(c_Gears, c_Gears_scrap))
	result.Add(makeConversion(c_Glass, c_Glass_scrap))
	result.Add(makeConversion(c_Gold, c_Gold_scrap))
	result.Add(makeConversion(c_Lead, c_Lead_scrap))
	result.Add(makeConversion(c_Leather, c_Leather_scrap))
	result.Add(makeConversion(c_NuclearMaterial, c_NuclearMaterial_scrap))
	result.Add(makeConversion(c_Oil, c_Oil_scrap))
	result.Add(makeConversion(c_Plastic, c_Plastic_scrap))
	result.Add(makeConversion(c_Rubber, c_Rubber_scrap))
	result.Add(makeConversion(c_Screws, c_Screws_scrap))
	result.Add(makeConversion(c_Silver, c_Silver_scrap))
	result.Add(makeConversion(c_Springs, c_Springs_scrap))
	result.Add(makeConversion(c_Steel, c_Steel_scrap))
	result.Add(makeConversion(c_Wood, c_Wood_scrap))
EndFunction

Function scrapData(ObjectReference destinationContainer, ScrapConversion data)
	if (!validateConversion(data) || !destinationContainer)
		return
	endif
	
	data.count = GetComponentCount(data.componentForm)
	if (!data.count)
		return
	endif
	
	RemoveComponents(data.componentForm, data.count, false)
	destinationContainer.AddItem(data.scrapForm, data.count, false)
	data.count = 0 ; not necessary, but cleanup is always a good idea
EndFunction

Function process(ObjectReference destinationContainer)
	
EndFunction

Function pull(ObjectReference sourceContainer)
	
EndFunction

Event ObjectReference.OnItemRemoved(ObjectReference akSender, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	
EndEvent

Auto State Dormant
	Event OnInit()
		conversions = makeConversions()
		GoToState("Waiting")
	EndEvent
EndState

State Waiting
	Function process(ObjectReference destinationContainer)
		if (!destinationContainer || !conversions || !conversions.Length)
			SendCustomEvent("Processed")
			return
		endif
		
		GoToState("Processing")
		AddInventoryEventFilter(None)
		
		Int iCounter = 0
		while (iCounter < conversions.Length)
			scrapData(destinationContainer, conversions[iCounter])
			iCounter += 1
		endWhile
	EndFunction
	
	Function pull(ObjectReference sourceContainer)
		if (!sourceContainer)
			SendCustomEvent("Pulled")
			return
		endif
		
		GoToState("Pulling")
		containerRef = sourceContainer
		containerRef.AddInventoryEventFilter(None)
		RegisterForRemoteEvent(containerRef, "OnItemRemoved")
		
		containerRef.RemoveItem(WorkshopConsumeScavenge, -1, true, self)
	EndFunction
EndState

State Processing
	Event OnBeginState(String asOldState)
		SimpleSettlementSolutions:Logger.log(self + " is processing")
		SendCustomEvent("Processing")
	EndEvent
	
	Event OnEndState(String asOldState)
		RemoveInventoryEventFilter(None)
		SimpleSettlementSolutions:Logger.log(self + " is done processing")
		SendCustomEvent("Processed")
	EndEvent
	
	Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
		!GetComponentCount(None) && GoToState("Waiting")
	EndEvent
EndState

State Pulling
	Event OnBeginState(String asOldState)
		SimpleSettlementSolutions:Logger.log(self + "is pulling")
		SendCustomEvent("Pulling")
	EndEvent
	
	Event OnEndState(String asOldState)
		containerRef.RemoveInventoryEventFilter(None)
		UnregisterForRemoteEvent(containerRef, "OnItemRemoved")
		containerRef = None
		SimpleSettlementSolutions:Logger.log(self + " is done pulling")
		SendCustomEvent("Pulled")
	EndEvent
	
	Event ObjectReference.OnItemRemoved(ObjectReference akSender, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
		akSender == containerRef && !containerRef.GetItemCount(WorkshopConsumeScavenge) && GoToState("Waiting")
	EndEvent
EndState
