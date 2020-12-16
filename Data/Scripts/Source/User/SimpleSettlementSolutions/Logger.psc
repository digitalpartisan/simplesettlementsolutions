Scriptname SimpleSettlementSolutions:Logger Hidden Const DebugOnly

String Function getName() Global
	return "SimpleSettlementSolutions"
EndFunction

Bool Function log(String sMessage, String[] tags = None) Global
	return Jiffy:Loggout.log(getName(), sMessage, tags)
EndFunction

Bool Function warn(String sMessage, String[] tags = None) Global
	return Jiffy:Loggout.warn(getName(), sMessage, tags)
EndFunction

Bool Function error(String sMessage, String[] tags = None) Global
	return Jiffy:Loggout.error(getName(), sMessage, tags)
EndFunction

Bool Function logTerminalLinks(ObjectReference akTerminalRef, Keyword linkTerminalKeyword, ObjectReference[] linkedRefs) Global
	return log(akTerminalRef + " links of type " + linkTerminalKeyword + ": " + linkedRefs)
EndFunction

