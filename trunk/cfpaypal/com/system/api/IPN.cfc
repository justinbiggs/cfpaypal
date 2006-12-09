<cfcomponent>
	<cfscript>
		variables.instance = StructNew();
		variables.instance.success = false;
		variables.instance.paypalIPNData = "";
		variables.instance.listeners = StructNew();
	</cfscript>
	
	<cffunction name="addListener">
		<cfargument name="listenerName">
		<cfargument name="listenerObject">
		<cfscript>
			StructInsert(variables.instance.listeners, arguments.listenerName, arguments.listenerObject);
		</cfscript>
	</cffunction>
	
	<cffunction name="notificationRecieved">
		<cfscript>
			var cmd = "cmd=_notify-validate";
			var formData = "";
			var urlData = "";
			var logPrefix = "TYPE=IPN,";
			
			log = CreateObject("component","#Request.comPath#.com.system.common.Log");
			
			if (request.config.getValue("cfpaypaldebug") EQ false)
			{
				if (not isDefined("form.fieldNames")) return "";
			}
		</cfscript>

		<cfif (request.config.getValue("cfpaypaldebug") EQ true)>
			<cfset httpResponse = "VERIFIED">
			<cfset formData = "txn_type=subscr%5Fsignup&subscr_id=S%2D6YT76434J60681424&last_name=Kalura&residence_country=US&mc_currency=USD&item_name=Test%20One%20Subscription&amount1=0%2E00&amount2=5%2E00&amount3=20%2E00&recurring=1&verify_sign=AQU0e5vuZCvSg%2DXJploSa%2EsGUDlpA6cNIQYB7ueALetBtngcyhQkRZDL&payer_status=verified&test_ipn=1&payer_email=indiankey%40gmail%2Ecom&first_name=Arjun&receiver_email=indiankey%40indinakey%2Ecom&payer_id=NNBBT7RFRYNT6&reattempt=0&item_number=REF101&payer_business_name=Indiankey&custom=%2ATRIAL%2A&charset=windows%2D1252&notify_version=2%2E1&period1=1%20D&period2=1%20D&mc_amount1=0%2E00&period3=1%20M&mc_amount2=5%2E00&mc_amount3=20%2E00&subscr_date=14%3A51%3A51%20Apr%2015%2C%202006%20PDT">
		<cfelse>
			<!--- form struct to list --->		
			<cfloop index="frmField" list="#Form.FieldNames#">
				<cfif len(formData) GT 0>
					<cfset formData = formData & "&">
				</cfif>
				<cfset formData = formData & "#LCase(frmField)#=#URLEncodedFormat(Form[frmField])#">
			</cfloop>
			<CFIF IsDefined("FORM.payment_date")>
				<CFSET formData = formData & "&payment_date=#URLEncodedFormat(Form.payment_date)#">
			</CFIF>
			<CFIF IsDefined("FORM.subscr_date")>
				<CFSET formData = formData & "&subscr_date=#URLEncodedFormat(Form.subscr_date)#">
			</CFIF>
			<CFIF IsDefined("FORM.auction_closing_date")>
				<CFSET formData = formData & "&subscr_date=#URLEncodedFormat(Form.auction_closing_date)#">
			</CFIF>
			
			<cfhttp url="#request.config.getValue('paypalverificationurl')#?#cmd#&#formData#" method="get" resolveurl="false">
			</cfhttp>
			<cfset httpResponse = cfhttp.FileContent>
		</cfif>
		
		<cfif httpResponse EQ "VERIFIED">
			<!--- payment verified --->
			<cfset log.info(logPrefix & "STATUS=VERIFIED,FORM=" & formData)>
			<!--- update the notification success status to true --->
			<cfset variables.instance.success = true>
			<!--- parse the response --->
			<cfset variables.instance.paypalIPNData = CreateObject("component","#request.comPath#.com.system.dataobject.PaypalIPNData")>
			<cfset variables.instance.paypalIPNData.parsePaypalIPNData(ipnData=formData)>
			
			<!--- log the unprocessed IPN data elements --->
			<cfif variables.instance.paypalIPNData.getUnprocessedIPNDataList() NEQ "">
				<cfset log.info(logPrefix & "UNPROCESSED_IPN_DATA=" & variables.instance.paypalIPNData.getUnprocessedIPNDataList())>
			</cfif>			
			<cfif variables.instance.paypalIPNData.isSecureKeyValid() EQ false>
				<!--- secure key validation failed --->
				<cfset log.info(logPrefix & "STATUS=Secure Key Validation Failed")>
			</cfif>
			
			<!--- fire events --->
			<cfset triggerEvent(eventName="onNotificationRecieved")>
			
			<cfif variables.instance.paypalIPNData.isSecureKeyValidationPassed()>
				<cfset triggerPaymentStatusEvent()>
			
				<!--- subscription event --->
				<cfset triggerSubscriptionEvent()>
			</cfif>
		<cfelse>
			<!--- invalid --->
			<cfset log.error(logPrefix & "STATUS=INVALID,FORM=" & formData)>
		</cfif>
	</cffunction>
	
	<cffunction name="triggerPaymentStatusEvent">
		<cfargument name="byPassTransactionTypeCheck" default="false">
		
		<cfscript>
			var transactionInfo = variables.instance.paypalIPNData.TransactionInfo;
			if ((transactionInfo.getTxn_type() EQ "web_accept") OR (arguments.byPassTransactionTypeCheck EQ true))
			{
				switch (transactionInfo.getPayment_status())
				{
					case "Completed":
						triggerEvent("onPaymentStatusCompleted");
						break;
					case "Processed":
						triggerEvent("onPaymentStatusProcessed");
						break;
					case "Pending":
						triggerEvent("onPaymentStatusPending");
						break;
					case "Failed":
						triggerEvent("onPaymentStatusFailed");
						break;
					case "Refunded":
						triggerEvent("onPaymentStatusRefunded");
						break;
					case "Reversed":
						triggerEvent("onPaymentStatusReversed");
						break;
				}
				triggerEvent("onPaymentStatus");
			} 
		</cfscript>
	</cffunction>

	<cffunction name="triggerSubscriptionEvent">
		
		<cfscript>
			var transactionInfo = variables.instance.paypalIPNData.TransactionInfo;
			if (transactionInfo.getTxn_type().startsWith("subscr_"))
			{
				switch (transactionInfo.getTxn_type())
				{
					case "subscr_signup":
						triggerEvent("onSubscriptionSignUp");
						break;
					case "subscr_cancel":
						triggerEvent("onSubscriptionCancel");
						break;
					case "subscr_failed":
						triggerEvent("onSubscriptionFailed");
						break;
					case "subscr_payment":
						triggerEvent("onSubscriptionPayment");
						triggerPaymentStatusEvent(byPassTransactionTypeCheck=true);
						break;
					case "subscr_eot":
						triggerEvent("onSubscriptionEOT");
						break;
					case "subscr_modify":
						triggerEvent("onSubscriptionModify");
						break;
				}
				triggerEvent("onSubscription");
			} 
		</cfscript>
	</cffunction>
	
	<cffunction name="triggerEvent">
		<cfargument name="eventName">
		<cfloop collection="#variables.instance.listeners#" item="key">
			<cfset listenerObject = variables.instance.listeners[key]>
			<cfset _event = "listenerObject.#arguments.eventName#(variables.instance.paypalIPNData)">
			<cfset evaluate(_event)>
		</cfloop>
	</cffunction>
</cfcomponent>