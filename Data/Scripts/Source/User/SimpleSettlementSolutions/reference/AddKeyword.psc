Scriptname SimpleSettlementSolutions:Reference:AddKeyword extends ObjectReference Hidden

Keyword Function getKeyword()
	return None
EndFunction

Event OnInit()
	AddKeyword(getKeyword())
EndEvent
