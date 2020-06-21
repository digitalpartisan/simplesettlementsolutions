Scriptname SimpleSettlementSolutions:reference:AddKeyword:Remote:digits extends SimpleSettlementSolutions:reference:AddKeyword:Remote

Import InjectTec:Utility:HexidecimalLogic

DigitSet Property KeywordDigits Auto Const Mandatory

Keyword Function loadKeyword()
	MyPlugin.lookup(KeywordDigits) as Keyword
EndFunction
