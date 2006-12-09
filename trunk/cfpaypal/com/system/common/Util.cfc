<cfcomponent output="no">
	<cffunction name="parsePaypalDateTime" returntype="string">
		<cfargument name="stringDate">
		<cfscript>  
			var sdf = createObject("java", "java.text.SimpleDateFormat"); 
			var sdfFormat = javaCast("string","HH:mm:ss MMM d, yyyy z");
			parsedDate=sdf.init(sdfFormat).parse(arguments.stringDate); 
			return parsedDate;
		</cfscript>		
	</cffunction>
	
	<cffunction name="getSubscriptionPeriod">
		<cfargument name="period">
		<cfargument name="startDate">
		
		<cfset retData = "">
		<cfset periodTenure = ListGetAt(arguments.period, 1, " ")>
		<cfset periodType = ListGetAt(arguments.period, 2, " ")>
		<cfswitch expression="#periodType#">
			<cfcase value="D">
				<cfset retData = DateAdd("d",periodTenure,arguments.startDate)>
			</cfcase>
			<cfcase value="W">
				<cfset retData = DateAdd("ww",periodTenure,arguments.startDate)>
			</cfcase>
			<cfcase value="M">
				<cfset retData = DateAdd("m",periodTenure,arguments.startDate)>
			</cfcase>
			<cfcase value="Y">
				<cfset retData = DateAdd("yyyy",periodTenure,arguments.startDate)>
			</cfcase>
		</cfswitch>
		<cfreturn retData>
	</cffunction>

	<cffunction name="getSubscriptionPeriodText">
		<cfargument name="period">
		
		<cfset retData = "">
		<cfset periodTenure = ListGetAt(arguments.period, 1, " ")>
		<cfset periodType = ListGetAt(arguments.period, 2, " ")>
		<cfswitch expression="#periodType#">
			<cfcase value="D">
				<cfset retData = "#periodTenure# Day">
			</cfcase>
			<cfcase value="W">
				<cfset retData = "#periodTenure# Week">
			</cfcase>
			<cfcase value="M">
				<cfset retData = "#periodTenure# Month">
			</cfcase>
			<cfcase value="Y">
				<cfset retData = "#periodTenure# Year">
			</cfcase>
		</cfswitch>
		<cfreturn retData>
	</cffunction>
</cfcomponent>