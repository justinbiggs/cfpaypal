<cfcomponent extends="AbstractPNEvent">
	<cffunction name="onPaymentStatusCompleted">
		<cfargument name="paypalIPNData">
		
		<cfif arguments.paypalIPNData.getInvoiceID() NEQ "">
			<cfif arguments.paypalIPNData.cfpaypalInfo.isSubscriptionData()>
				<!--- Subscription - Completed payment --->
				<cfquery name="qryData" datasource="#request.config.getValue('cfpaypalds')#" username="#request.config.getValue('cfpaypaldsuid')#" password="#request.config.getValue('cfpaypaldspwd')#">
					UPDATE cfpaypal_subscription SET 
						payment_status = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.transactionInfo.getPayment_status()#">, 
						last_txn_id = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.transactionInfo.getTxn_id()#">, 
						paymentUpdatedOn = #CreateOdbcDateTime(now())#, 
						lastUpdatedOn = #CreateOdbcDateTime(now())#, 
						gross = <cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.paypalIPNData.currencyInfo.getMc_gross()#">, 
						fee = <cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.paypalIPNData.currencyInfo.getMc_fee()#">, 
						currency = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.currencyInfo.getMc_Currency()#">
					WHERE
						invoice = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.getInvoiceID()#">
				</cfquery>
			<cfelse>
				<!--- only order payment --->
				<cfquery name="qryData" datasource="#request.config.getValue('cfpaypalds')#" username="#request.config.getValue('cfpaypaldsuid')#" password="#request.config.getValue('cfpaypaldspwd')#">
					UPDATE cfpaypal_invoice SET 
						payment_status = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.transactionInfo.getPayment_status()#">, 
						last_txn_id = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.transactionInfo.getTxn_id()#">, 
						paymentUpdatedOn = #CreateOdbcDateTime(now())#, 
						lastUpdatedOn = #CreateOdbcDateTime(now())#, 
						gross = <cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.paypalIPNData.currencyInfo.getMc_gross()#">, 
						fee = <cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.paypalIPNData.currencyInfo.getMc_fee()#">, 
						currency = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.currencyInfo.getMc_Currency()#">
					WHERE
						invoice = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.getInvoiceID()#">
				</cfquery>
			</cfif>
		</cfif>
	</cffunction>
	
	<cffunction name="onPaymentStatusPending">
		<cfargument name="paypalIPNData">
		
		<cfif arguments.paypalIPNData.getInvoiceID() NEQ "">
			<cfif arguments.paypalIPNData.cfpaypalInfo.isSubscriptionData()>
				<!--- Subscription - Pending payment --->
				<cfquery name="qryData" datasource="#request.config.getValue('cfpaypalds')#" username="#request.config.getValue('cfpaypaldsuid')#" password="#request.config.getValue('cfpaypaldspwd')#">
					UPDATE cfpaypal_subscription SET 
						payment_status = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.transactionInfo.getPayment_status()#">, 
						last_txn_id = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.transactionInfo.getTxn_id()#">, 
						paymentUpdatedOn = #CreateOdbcDateTime(now())#, 
						lastUpdatedOn = #CreateOdbcDateTime(now())#
					WHERE
						invoice = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.getInvoiceID()#">
				</cfquery>
			</cfif>
		</cfif>
	</cffunction>
	
	
	<cffunction name="onNotificationRecieved">
		<cfargument name="paypalIPNData">
		<cfset structData = StructNew()>
		<cfset StructAppend(structData, arguments.paypalIPNData.basicInfo.getDataForSQL())>
		<cfset StructAppend(structData, arguments.paypalIPNData.buyerInfo.getDataForSQL())>
		<cfset StructAppend(structData, arguments.paypalIPNData.currencyInfo.getDataForSQL())>
		<cfset StructAppend(structData, arguments.paypalIPNData.customInfo.getDataForSQL())>
		<cfset StructAppend(structData, arguments.paypalIPNData.otherInfo.getDataForSQL())>
		<cfset StructAppend(structData, arguments.paypalIPNData.subscriptionInfo.getDataForSQL())>
		<cfset StructAppend(structData, arguments.paypalIPNData.transactionInfo.getDataForSQL())>
		<cfset StructAppend(structData, arguments.paypalIPNData.cartInfo.getDataForSQL())>
		
		<cfset structData.invoice = "'" & arguments.paypalIPNData.getInvoiceID() & "'">
		<cfif arguments.paypalIPNData.isSecureKeyValidationPassed(isCalledFromLoggingEvent=true)>
			<cfset StructInsert(structData, "securekeyvalidationpassed", 1)>
		<cfelse>
			<cfset StructInsert(structData, "securekeyvalidationpassed", 0)>
		</cfif>
		
		<cfset fields = "">
		<cfset values = "">
		<cfloop collection="#structData#" item="key">
			<cfif fields NEQ "">
				<cfset fields = fields & ",">
				<cfset values = values & ",">
			</cfif>
			<cfset fields = fields &  key>
			<cfset values = values &  structData[key]>
		</cfloop>

		<cfset sql = "INSERT INTO paypal_notification_data(" & fields & ") VALUES (" & values & ")"> 
		<cfquery name="qryInsert" datasource="#request.config.getValue('cfpaypalds')#" username="#request.config.getValue('cfpaypaldsuid')#" password="#request.config.getValue('cfpaypaldspwd')#">
			#PreserveSingleQuotes(sql)#
		</cfquery>

		
		<cfif arguments.paypalIPNData.cartInfo.getNum_cart_items() GTE 1>
			<cfquery name="qryData" datasource="#request.config.getValue('cfpaypalds')#" username="#request.config.getValue('cfpaypaldsuid')#" password="#request.config.getValue('cfpaypaldspwd')#">
				SELECT @@Identity as ID
			</cfquery>
			<!---
			<cfquery name="qryData" datasource="#request.config.getValue('cfpaypalds')#" username="#request.config.getValue('cfpaypaldsuid')#" password="#request.config.getValue('cfpaypaldspwd')#">
				SELECT ID FROM paypal_notification_data WHERE txn_id = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.transactionInfo.getTxn_id()#">
			</cfquery>
			--->
			<cfset cartItems = arguments.paypalIPNData.cartInfo.getCartItems()>
			<cfloop from="1" to="#ArrayLen(cartItems)#" index="ctr">
				<cfset cartEntry = cartItems[ctr]>
				<cfset fields = "">
				<cfset values = "">
				<cfset structData = cartEntry.getDataForSQL()>
				<cfset structInsert(structData,"paypal_notification_data_id", qryData.ID)>
				<cfset structInsert(structData,"txn_id", arguments.paypalIPNData.transactionInfo.getTxn_id())>
				
				<cfloop collection="#structData#" item="key">
					<cfif fields NEQ "">
						<cfset fields = fields & ",">
						<cfset values = values & ",">
					</cfif>
					<cfset fields = fields &  key>
					<cfset values = values &  structData[key]>
				</cfloop>

				<cfset sql = "INSERT INTO paypal_notification_cart_data(" & fields & ") VALUES (" & values & ")"> 
				<cfquery datasource="#request.config.getValue('cfpaypalds')#" username="#request.config.getValue('cfpaypaldsuid')#" password="#request.config.getValue('cfpaypaldspwd')#">
					#PreserveSingleQuotes(sql)#
				</cfquery>
			</cfloop>			
		</cfif>		
		
		
		<cfif arguments.paypalIPNData.cfpaypalInfo.isSubscriptionData()>
			<!---- subscription --->
			<cfif arguments.paypalIPNData.getInvoiceID() NEQ "">
				<cfquery name="qryData" datasource="#request.config.getValue('cfpaypalds')#" username="#request.config.getValue('cfpaypaldsuid')#" password="#request.config.getValue('cfpaypaldspwd')#">
					SELECT COUNT(*) as InvoiceExists  FROM cfpaypal_subscription WHERE invoice = 
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.getInvoiceID()#">
				</cfquery>
				<cfif qryData.InvoiceExists LTE 0>
					<!--- Only create the subscription record if it does not exists --->
					<cfquery name="qryData" datasource="#request.config.getValue('cfpaypalds')#" username="#request.config.getValue('cfpaypaldsuid')#" password="#request.config.getValue('cfpaypaldspwd')#">
						INSERT INTO cfpaypal_subscription (invoice, createdOn, lastUpdatedOn) Values(
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.getInvoiceID()#">, 
							#CreateOdbcDateTime(now())#, #CreateOdbcDateTime(now())#)
					</cfquery>
				</cfif>
			<cfelse>
				<!--- dont have any invoice to deal with --->
			</cfif>
		<cfelse>
			<!--- create invoice --->
			<cfif arguments.paypalIPNData.getInvoiceID() NEQ "">
				<cfquery name="qryData" datasource="#request.config.getValue('cfpaypalds')#" username="#request.config.getValue('cfpaypaldsuid')#" password="#request.config.getValue('cfpaypaldspwd')#">
					SELECT COUNT(*) as InvoiceExists  FROM cfpaypal_invoice WHERE invoice = 
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.getInvoiceID()#">
				</cfquery>
				<cfif qryData.InvoiceExists LTE 0>
					<!--- Only create the invoice record if it does not exists --->
					<cfquery name="qryData" datasource="#request.config.getValue('cfpaypalds')#" username="#request.config.getValue('cfpaypaldsuid')#" password="#request.config.getValue('cfpaypaldspwd')#">
						INSERT INTO cfpaypal_invoice (invoice, payer_email, firstName, lastName, createdOn, lastUpdatedOn) Values(
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.getInvoiceID()#">, 
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.buyerInfo.getPayer_Email()#">, 
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.buyerInfo.getFirst_Name()#">, 
							<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.buyerInfo.getLast_Name()#">,
							#CreateOdbcDateTime(now())#, #CreateOdbcDateTime(now())#)
					</cfquery>
				</cfif>
			<cfelse>
				<!--- dont have any invoice to deal with --->
			</cfif>
		</cfif>
	</cffunction>
	

	<cffunction name="onSubscriptionSignUp">
		<cfargument name="paypalIPNData">
		
		<!--- create subscription record --->
		<cfif arguments.paypalIPNData.getInvoiceID() NEQ "">
			<!--- check if trail subscription available --->
			<cfset trialData = trialPeriodData(arguments.paypalIPNData.getInvoiceID())>
			
			<cfif trialData.isTrialPeriodValid>
				<!--- startDate =  util.parsePaypalDateTime(arguments.paypalIPNData.subscriptionInfo.getSubscr_Date())	--->
				<cfset subscrStart = now()>
				
				<cfset util = CreateObject("component","#request.comPath#.com.system.common.Util")>
				<cfset subscriptionEndDate = util.getSubscriptionPeriod(trialData.trialPeriod, subscrStart)>
				<cfset subscriptionTenure = util.getSubscriptionPeriodText(trialData.trialPeriod)>
			</cfif>
						
			<!--- create subscription record --->
			<cfquery name="qryData" datasource="#request.config.getValue('cfpaypalds')#" username="#request.config.getValue('cfpaypaldsuid')#" password="#request.config.getValue('cfpaypaldspwd')#">
				UPDATE cfpaypal_subscription 
					SET invoice = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.getInvoiceID()#">, 
						subscr_name = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.basicInfo.getItem_Name()#">, 
						subscr_number = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.basicInfo.getItem_Number()#">, 
						payer_email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.buyerInfo.getPayer_Email()#">, 
						firstName = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.buyerInfo.getFirst_Name()#">, 
						lastName = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.buyerInfo.getLast_Name()#">, 
						<cfif trialData.isTrialPeriodValid>
							trialPeriod = 1,
							subscriptionEndDate = #CreateOdbcDateTime(subscriptionEndDate)# ,
							subscriptionTenure = <cfqueryparam cfsqltype="cf_sql_varchar" value="#subscriptionTenure#">, 
						<cfelse>
							trialPeriod = 0,
						</cfif>
						lastUpdatedOn = #CreateOdbcDateTime(now())#
					WHERE
						invoice = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.paypalIPNData.getInvoiceID()#">
			</cfquery>
		</cfif>
	</cffunction>

	<cffunction name="trialPeriodData">
		<cfargument name="invoiceID">
		
		<cfset isTrialPeriodValid = false>
		<cfset trialPeriodField = "">
		<cfset trialPeriod = "">
		<cfquery name="qryData" datasource="#request.config.getValue('cfpaypalds')#" username="#request.config.getValue('cfpaypaldsuid')#" password="#request.config.getValue('cfpaypaldspwd')#">
			SELECT * FROM paypal_notification_data WHERE invoice = '#arguments.invoiceID#' AND txn_type = 'subscr_signup'
		</cfquery>
		<cfif qryData.recordCount GT 0>
			<cfif qryData.period1 NEQ "" AND qryData.mc_amount1 LTE 0>
				<cfset isTrialPeriodValid = true>
				<cfset trialPeriodField = "1">
				<cfset trialPeriod = qryData.period1>
			</cfif>
			<cfif qryData.period2 NEQ "" AND qryData.mc_amount2 LTE 0>
				<cfset isTrialPeriodValid = true>
				<cfset trialPeriodField = "2">
				<cfset trialPeriod = qryData.period2>
			</cfif>
			<cfif qryData.period3 NEQ "" AND qryData.mc_amount3 LTE 0>
				<cfset isTrialPeriodValid = true>
				<cfset trialPeriodField = "3">
				<cfset trialPeriod = qryData.period3>
			</cfif>
		</cfif>
		<cfset retData = StructNew()>
		<cfset retData.isTrialPeriodValid = isTrialPeriodValid>
		<cfset retData.trialPeriodField = trialPeriodField>
		<cfset retData.trialPeriod = trialPeriod>
		
		<cfreturn retData>
	</cffunction>
		
</cfcomponent>