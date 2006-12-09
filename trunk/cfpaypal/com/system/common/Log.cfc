<cfcomponent>
	<cfscript>
		variables.instance = StructNew();
		variables.instance.logFile = request.config.getValue("logfolder") & "\cfpaypal.txt";
	</cfscript>
	
	<cffunction name="info">
		<cfargument name="data">
		<cffile action="append" file="#variables.instance.logFile#" output="#getPrefix()# - [INFO] - #arguments.data#" addnewline="yes">
	</cffunction>

	<cffunction name="error">
		<cfargument name="data">
		<cffile action="append" file="#variables.instance.logFile#" output="#getPrefix()# - [ERROR] - #arguments.data#" addnewline="yes">
	</cffunction>

	<cffunction name="debug">
		<cfargument name="data">
		<cffile action="append" file="#variables.instance.logFile#" output="#getPrefix()# - [DEBUG] - #arguments.data#" addnewline="yes">
	</cffunction>
	
	<cffunction name="getPrefix">
		<cfreturn "[" & DateFormat(now(), "mm/dd/yyyy") & "]" & " - [" & TimeFormat(now(),"hh:mm:ss") & "]">
	</cffunction>
</cfcomponent>