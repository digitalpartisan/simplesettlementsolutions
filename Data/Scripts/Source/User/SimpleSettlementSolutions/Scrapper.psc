Scriptname SimpleSettlementSolutions:Scrapper extends ObjectReference
{Autofill everyting.}

CustomEvent Processing
CustomEvent Processed
CustomEvent Pulling
CustomEvent Pulled

Struct ScrapConversion
	Component componentForm = None
	MiscObject scrapForm = None
EndStruct

Struct ScrapRecipe
	FormList forms = None
	Component result = None
	Int amount = 0
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

Group ScrapLists
	FormList Property modScrapRecipe_NullMelee_Bone Auto Const Mandatory
	FormList Property modScrapRecipe_NullMelee_Cloth Auto Const Mandatory
	FormList Property modScrapRecipe_NullMelee_ClothMinor Auto Const Mandatory
	FormList Property modScrapRecipe_NullMelee_Glass Auto Const Mandatory
	FormList Property modScrapRecipe_NullMelee_Leather Auto Const Mandatory
	FormList Property modScrapRecipe_NullMelee_LeatherMinor Auto Const Mandatory
	FormList Property modScrapRecipe_NullMelee_Plastic Auto Const Mandatory
	FormList Property modScrapRecipe_NullMelee_Steel Auto Const Mandatory
	FormList Property modScrapRecipe_NullMelee_SteelHuge Auto Const Mandatory
	FormList Property modScrapRecipe_NullMelee_SteelLarge Auto Const Mandatory
	FormList Property modScrapRecipe_NullMelee_SteelMinor Auto Const Mandatory
	FormList Property modScrapRecipe_NullMelee_Wood Auto Const Mandatory
EndGroup

Group ScrapListResult
	Int Property ScrapResultBone = 2 Auto Const
	Int Property ScrapResultCloth = 2 Auto Const
	Int Property ScrapResultClothMinor = 2 Auto Const
	Int Property ScrapResultGlass = 2 Auto Const
	Int Property ScrapResultLeather = 2 Auto Const
	Int Property ScrapResultLeatherMinor = 2 Auto Const
	Int Property ScrapResultPlastic = 2 Auto Const
	Int Property ScrapResultSteel = 2 Auto Const
	Int Property ScrapResultSteelHuge = 6 Auto Const
	Int Property ScrapResultSteelLarge = 4 Auto Const
	Int Property ScrapResultSteelMinor = 2 Auto Const
	Int Property ScrapResultWood = 2 Auto Const
EndGroup

FormList Property WorkshopConsumeScavenge Auto Const Mandatory

ScrapConversion[] conversions = None
ScrapRecipe[] recipes = None

Bool Function validateConversion(ScrapConversion data)
	return data && data.componentForm && data.scrapForm
EndFunction

Bool Function validateScrapRecipe(ScrapRecipe data)
	return data && data.forms && data.result && data.amount
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

ScrapRecipe Function makeRecipe(FormList forms, Component componentForm, Int iAmount)
	if (!forms || !componentForm || !iAmount)
		return None
	endif
	
	ScrapRecipe result = new ScrapRecipe
	result.forms = forms
	result.result = componentForm
	result.amount = iAmount
	
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
	
	return result
EndFunction

ScrapRecipe[] Function makeRecipes()
	ScrapRecipe[] result = new ScrapRecipe[0]
	
	result.Add(makeRecipe(modScrapRecipe_NullMelee_Bone, c_Bone, ScrapResultBone))
	result.Add(makeRecipe(modScrapRecipe_NullMelee_Cloth, c_Cloth, ScrapResultCloth))
	result.Add(makeRecipe(modScrapRecipe_NullMelee_ClothMinor, c_Cloth, ScrapResultClothMinor))
	result.Add(makeRecipe(modScrapRecipe_NullMelee_Glass, c_Glass, ScrapResultGlass))
	result.Add(makeRecipe(modScrapRecipe_NullMelee_Leather, c_Leather, ScrapResultLeather))
	result.Add(makeRecipe(modScrapRecipe_NullMelee_LeatherMinor, c_Leather, ScrapResultLeatherMinor))
	result.Add(makeRecipe(modScrapRecipe_NullMelee_Plastic, c_Plastic, ScrapResultPlastic))
	result.Add(makeRecipe(modScrapRecipe_NullMelee_Steel, c_Steel, ScrapResultSteel))
	result.Add(makeRecipe(modScrapRecipe_NullMelee_SteelHuge, c_Steel, ScrapResultSteelHuge))
	result.Add(makeRecipe(modScrapRecipe_NullMelee_SteelLarge, c_Steel, ScrapResultSteelLarge))
	result.Add(makeRecipe(modScrapRecipe_NullMelee_SteelMinor, c_Steel, ScrapResultSteelMinor))
	result.Add(makeRecipe(modScrapRecipe_NullMelee_Wood, c_Wood, ScrapResultWood))
	
	return result
EndFunction

Function scrapConversion(ObjectReference destinationContainer, ScrapConversion data)
	if (!validateConversion(data) || !destinationContainer)
		return
	endif
	
	Int iCount = GetComponentCount(data.componentForm)
	if (!iCount)
		return
	endif
	
	RemoveComponents(data.componentForm, iCount, true)
	destinationContainer.AddItem(data.scrapForm, iCount, false)
EndFunction

Function scrapRecipe(ObjectReference destinationContainer, ScrapRecipe data)
	if (!validateScrapRecipe(data) || !destinationContainer)
		return
	endIf
	
	Int iCount = GetItemCount(data.forms)
	if (!iCount)
		return
	endif
	
	RemoveItem(data.forms, -1, true)
	destinationContainer.AddItem(data.result, iCount * data.amount)
EndFunction

Function process(ObjectReference destinationContainer)
	
EndFunction

Function pull(ObjectReference sourceContainer)
	
EndFunction

Event ObjectReference.OnItemRemoved(ObjectReference akSender, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	
EndEvent

Bool Function isEmpty()
	if (GetItemCount(WorkshopConsumeScavenge))
		return false
	endif
	
	if (!recipes)
		return true
	endif
	
	Int iCounter = 0
	while (iCounter < recipes.Length)
		if (validateScrapRecipe(recipes[iCounter]) && GetItemCount(recipes[iCounter].forms))
			return false
		endif
		iCounter += 1
	endWhile
	
	return true
EndFunction

Auto State Dormant
	Event OnInit()
		SetActorRefOwner(Game.GetPlayer())
		AddInventoryEventFilter(None)
		conversions = makeConversions()
		recipes = makeRecipes()
		GoToState("Waiting")
	EndEvent
EndState

State Waiting
	Function process(ObjectReference destinationContainer)
		GoToState("Processing")
		
		if (!destinationContainer || !conversions || !conversions.Length || isEmpty())
			GoToState("Waiting")
			return
		endif
		
		Int iCounter = 0
		while (iCounter < conversions.Length)
			scrapConversion(destinationContainer, conversions[iCounter])
			iCounter += 1
		endWhile
		
		iCounter = 0
		while (iCounter < recipes.Length)
			scrapRecipe(destinationContainer, recipes[iCounter])
			iCounter += 1
		endWhile
	EndFunction
	
	Function pull(ObjectReference sourceContainer)
		GoToState("Pulling")
		sourceContainer && sourceContainer.GetItemCount(WorkshopConsumeScavenge) && sourceContainer.RemoveItem(WorkshopConsumeScavenge, -1, true, self)
		GoToState("Waiting")
	EndFunction
EndState

State Processing
	Event OnBeginState(String asOldState)
		SimpleSettlementSolutions:Logger.log(self + " is processing")
		SendCustomEvent("Processing")
	EndEvent
	
	Event OnEndState(String asOldState)
		SimpleSettlementSolutions:Logger.log(self + " is done processing")
		SendCustomEvent("Processed")
	EndEvent
	
	Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
		isEmpty() && GoToState("Waiting")
	EndEvent
EndState

State Pulling
	Event OnBeginState(String asOldState)
		SimpleSettlementSolutions:Logger.log(self + "is pulling")
		SendCustomEvent("Pulling")
	EndEvent
	
	Event OnEndState(String asOldState)
		SimpleSettlementSolutions:Logger.log(self + " is done pulling")
		SendCustomEvent("Pulled")
	EndEvent
EndState
