<cfcomponent output="no">
	<cfscript>
		variables.instance = StructNew();
		variables.instance.configvalue = StructNew();
		variables.instance.lastConfigLoaded = "";
	</cfscript>
	
	<cffunction name="loadConfig" output="false">
		<cfscript>
			var path = "";
			var configEntries = ArrayNew(1);
			var configStruct = StructNew();
			
			if (isDefined("Application.cfpaypal.configfolder")) {
				path = Application.cfpaypal.configfolder;
			} else {
				path = ExpandPath("\cfpaypal") & "\cfpaypal\config";
			}
			variables.instance.lastConfigLoaded = Application.cfpaypal.configmode;
			configFile = path & "\" & "#variables.instance.lastConfigLoaded#.properties";
		</cfscript>
		<cffile action="read" file="#configFile#" variable="configData">
		<cfloop list="#configData#"  index="curLine"  delimiters="#chr(10)##chr(13)#"> 
			<cfset ArrayAppend(configEntries, curLine)>
		</cfloop>
		<cfloop from="1" to="#ArrayLen(configEntries)#" index="ctr">
			<cfif ListLen(configEntries[ctr],"=") GT 1>
				<cfset StructInsert(configStruct, ListGetAt(configEntries[ctr], 1, "="), ListGetAt(configEntries[ctr], 2, "="))>
			<cfelse>
				<cfset StructInsert(configStruct, ListGetAt(configEntries[ctr], 1, "="), "")>
			</cfif>
		</cfloop>
		<cfset variables.instance.configvalue = configStruct>
	</cffunction>
	
	<cffunction name="getValue" output="false">
		<cfargument name="propertyName">
		<cfif StructCount(variables.instance.configvalue) LTE 0>
			<cfset loadConfig()>
		</cfif>
		<cfif StructKeyExists(variables.instance.configvalue, propertyName)>
			<cfreturn StructFind(variables.instance.configvalue, propertyName)>
		<cfelse>
			<cfreturn "">
		</cfif>
	</cffunction>
	
</cfcomponent>