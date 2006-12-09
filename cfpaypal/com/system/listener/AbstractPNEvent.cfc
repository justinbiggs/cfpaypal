<cfcomponent>
	<cffunction name="onPaymentStatusCompleted">
		<cfargument name="paypalIPNData">
		<cfoutput>[onPaymentStatusCompleted]</cfoutput>
	</cffunction>

	<cffunction name="onPaymentStatusProcessed">
		<cfargument name="paypalIPNData">
	</cffunction>

	<cffunction name="onPaymentStatusPending">
		<cfargument name="paypalIPNData">
	</cffunction>

	<cffunction name="onPaymentStatusFailed">
		<cfargument name="paypalIPNData">
	</cffunction>

	<cffunction name="onPaymentStatusRefunded">
		<cfargument name="paypalIPNData">
	</cffunction>

	<cffunction name="onPaymentStatusReversed">
		<cfargument name="paypalIPNData">
	</cffunction>

	<cffunction name="onPaymentStatus">
		<cfargument name="paypalIPNData">
		<cfoutput>[onPaymentStatus]</cfoutput>
	</cffunction>

	<cffunction name="onSubscriptionSignUp">
		<cfargument name="paypalIPNData">
		<cfoutput>[onSubscriptionSignUp]</cfoutput>
	</cffunction>

	<cffunction name="onSubscriptionCancel">
		<cfargument name="paypalIPNData">
	</cffunction>

	<cffunction name="onSubscriptionModify">
		<cfargument name="paypalIPNData">
	</cffunction>

	<cffunction name="onSubscriptionPayment">
		<cfargument name="paypalIPNData">
		<cfoutput>[onSubscriptionPayment]</cfoutput>
	</cffunction>

	<cffunction name="onSubscriptionFailed">
		<cfargument name="paypalIPNData">
	</cffunction>

	<cffunction name="onSubscriptionEOT">
		<cfargument name="paypalIPNData">
	</cffunction>
	
	<cffunction name="onSubscription">
		<cfargument name="paypalIPNData">
		<cfoutput>[onSubscription]</cfoutput>
	</cffunction>
	
	<cffunction name="onNotificationRecieved">
		<cfargument name="paypalIPNData">
		<cfoutput>[onNotificationRecieved]</cfoutput>
	</cffunction>
</cfcomponent>