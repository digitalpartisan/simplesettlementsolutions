Scriptname SimpleSettlementSolutions:Workshop:Picker extends WorkshopNPCScript
{
To use this script:

Make a new actor record for this purpose and only this purpose.
Make that actor essential and unique.
Strip any faction and/or AI package associations on that actor.

Set the following properties from the parent script:

bAllowMove: True
bCountsForPopulation: False

Reference the documentation on the SettlementFilters and MiscSettlementPickerSettings properties.
}

Group SettlementFilters
	FormList Property RequiredKeywords = None Auto Const
	{Which keywords a settlement reference must have to be included in the options the picker presents to the player.  If None, has no effect.}
	FormList Property ExcludedKeywords = None Auto Const
	{Which keywords a settlement must not have in order to be included in the picker's options.  If None, has no effect.}
	
	Bool Property RequireOwnership = true Auto Const
	{If true, unowned settlements will not appear in the picker's options.}
	Bool Property ExcludeZeroPopulation = false Auto Const
	{If true, only settlements with a population will appear in the picker's options.}
	Bool Property TurnOffHeader = true Auto Const
	{If true, no header will appear above the selection list.  Desirable because the limited default options involve moving a settler or assigning them a caravan route.}
	Bool Property OnlyPotentialVassalSettlements = false Auto Const
	{Has to do with Nuka-World vassal settlement logic.  Leave it alone unless you have a reason to tweak it.}
	Bool Property DisableReservedByQuests = false Auto Const
	{See notes on OnlyPotentialVassalSettlements.}
EndGroup

Group MiscSettlementPickerSettings
	Keyword Property SelectionKeyword = None Auto Const
	{The keyword used to tell the game engine what sort of selection is being made.  This can be left None and probably should be unless you have a specific reason for using a particular move type.
	While this script couteracts the settlement assignment, the method used is a hack and results in a mess in the main Papyrus error log.}
	Message Property ConfirmationMessage = None Auto Const
	{The text shown to the player to confirm their selection.  A good opportunity to warn the player about what will happen if then choose to proceed.}
	Message Property NoSelectionMessage = None Auto Const
	{The message shown to the player when no location is selected, which is almost always a result of the player cancelling the selection process.}
EndGroup

Event OnWorkshopNPCTransfer(Location akNewWorkshopLocation, Keyword akActionKW)
	(WorkshopParent.WorkshopAssignHome == akActionKW || WorkshopParent.WorkshopAssignCaravan == akActionKW || WorkshopParent.WorkshopAssignHomePermanentActor == akActionKW) && WorkshopParent.unassignActor(self, true)
EndEvent

Function handleExclusion(WorkshopScript workshopRef = None, Bool bApply = true)
	if (!workshopRef || !ExcludedKeywords)
		return
	endif
	
	Int iSize = ExcludedKeywords.GetSize()
	if (!iSize)
		return
	endif

	Int iCounter = 0
	Keyword currentKeyword = None
	while (iCounter < iSize)
		currentKeyword = ExcludedKeywords.GetAt(iCounter) as Keyword
		if (currentKeyword) ; Just in case a "none" record made it in to the list
			if (bApply)
				workshopRef.AddKeyword(currentKeyword)
			else
				workshopRef.RemoveKeyword(currentKeyword)
			endif
		endif
		
		iCounter += 1
	endWhile
EndFunction

WorkshopScript Function handleLocationConversion(Location selectedLocation)
	WorkshopScript workshopRef = WorkshopParent.getWorkshopFromLocation(selectedLocation)
	SimpleSettlementSolutions:Workshop:Picker:Logger.logLocationSettlementMatch(self, selectedLocation, workshopRef)
	return workshopRef
EndFunction

Location Function pickLocation(Location akSelectLocation = None)
	SimpleSettlementSolutions:Workshop:Picker:Logger.logOpeningMenu(self)
	Location selectedLocation = OpenWorkshopSettlementMenuEx(SelectionKeyword, ConfirmationMessage, akSelectLocation, RequiredKeywords, ExcludedKeywords, ExcludeZeroPopulation, RequireOwnership, TurnOffHeader, OnlyPotentialVassalSettlements, DisableReservedByQuests)
	SimpleSettlementSolutions:Workshop:Picker:Logger.logPickerResult(self, selectedLocation)
	return selectedLocation
EndFunction

WorkshopScript Function pickWorkshop(Location selectLocation = None)
	Location selectedLocation = pickLocation(selectLocation)
	if (!selectedLocation)
		return None
	endif
	
	WorkshopScript workshopRef = WorkshopParent.getWorkshopFromLocation(selectedLocation)
	SimpleSettlementSolutions:Workshop:Picker:Logger.logLocationSettlementMatch(self, selectedLocation, workshopRef)
	
	return workshopRef
EndFunction

WorkshopScript Function pick(Location defaultLocation = None, WorkshopScript excludeWorkshopRef = None)
	handleExclusion(excludeWorkshopRef)
	WorkshopScript chosenWorkshop = pickWorkshop(defaultLocation)
	handleExclusion(excludeWorkshopRef, false)
	
	if (!chosenWorkshop)
		NoSelectionMessage && NoSelectionMessage.Show()
		return None
	endif
	
	return chosenWorkshop
EndFunction

WorkshopScript Function forcePick(WorkshopScript defaultResult, Location selectLocation = None)
	WorkshopScript result = pickWorkshop(selectLocation)
	if (!result)
		return defaultResult
	endif
	
	return result
EndFunction
