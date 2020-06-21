Scriptname SimpleSettlementSolutions:reference:AddKeyword:Remote extends SimpleSettlementSolutions:reference:AddKeyword Hidden

InjectTec:Plugin Property MyPlugin Auto Const Mandatory

Keyword Function loadKeyword()
	return None
EndFunction

Keyword Function getKeyword()
	return loadKeyword()
EndFunction
