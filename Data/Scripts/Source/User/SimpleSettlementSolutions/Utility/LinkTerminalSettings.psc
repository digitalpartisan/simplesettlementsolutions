Scriptname SimpleSettlementSolutions:Utility:LinkTerminalSettings extends Quest Hidden

Keyword Function getKeyword()
{Override this in a child script to determine what }
	return None
EndFunction

ObjectReference[] Function search(ObjectReference akTerminalRef)
	Keyword linkTerminalKeyword = getKeyword()
	if (!akTerminalRef || !linkTerminalKeyword)
		return None
	endif

	ObjectReference[] results = akTerminalRef.getLinkedRefArray(linkTerminalKeyword)
	SimpleSettlementSolutions:Logger.logTerminalLinks(akTerminalRef, linkTerminalKeyword, results)
	return results
EndFunction
