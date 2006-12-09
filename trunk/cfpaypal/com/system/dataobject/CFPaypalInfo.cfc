<cfcomponent displayname='CFPaypalInfo' extends="BaseDataObject">
	<cfscript>	
		variables.instance = structNew();
		variables.instance.paypalProduct = "Website Payments Standard";
		variables.instance.webPayment = true;
		variables.instance.subscription = false;
	</cfscript>
	
	<cffunction name='init'>
	</cffunction>
	
	<cffunction name="setIsSubscriptionData">
		<cfargument name="isSubscriptionData" type="boolean" required="yes">
		<cfset variables.instance.subscription = arguments.isSubscriptionData>
	</cffunction>
	<cffunction name="isSubscriptionData">
		<cfreturn variables.instance.subscription>
	</cffunction>

	<cffunction name="setIsWebPayment">
		<cfargument name="isWebPayment" type="boolean" required="yes">
		<cfset variables.instance.webPayment = arguments.isWebPayment>
	</cffunction>
	<cffunction name="isWebPayment">
		<cfreturn variables.instance.webPayment>
	</cffunction>

	<cffunction name="setPaypalProduct">
		<cfargument name="paypalProduct" type="string" required="yes">
		<cfset variables.instance.paypalProduct = arguments.paypalProduct>
	</cffunction>
	<cffunction name="getPaypalProduct">
		<cfreturn variables.instance.paypalProduct>
	</cffunction>
</cfcomponent>