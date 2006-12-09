<cfcomponent>
	<cfscript>
		this.basicInfo = "";
		this.buyerInfo = "";
		this.currencyInfo = "";
		this.customInfo = "";
		this.transactionInfo = "";
		this.otherInfo = "";
		this.subscriptionInfo = "";
		this.cartInfo = "";
		this.cfpaypalInfo = "";
		this.unparasedInfo = "";
		this.orignalInfo = "";

		this.customFieldParsedData = ""; 		//Internal Use
	</cfscript>
	
	<cffunction name="dump" output="true">
		<h1>BasicInfo</h1>
		<cfset this.basicInfo.dump()>
		<h1>BuyerInfo</h1>
		<cfset this.buyerInfo.dump()>
		<h1>CurrencyInfo</h1>
		<cfset this.currencyInfo.dump()>
		<h1>CustomInfo</h1>
		<cfset this.customInfo.dump()>
		<h1>TransactionInfo</h1>
		<cfset this.transactionInfo.dump()>
		<h1>OtherInfo</h1>
		<cfset this.otherInfo.dump()>
		<h1>SubscriptionInfo</h1>
		<cfset this.subscriptionInfo.dump()>
		<h1>CartInfo</h1>
		<cfset this.cartInfo.dump()>
		<h1>CfpaypalInfo</h1>
		<cfset this.cfpaypalInfo.dump()>
		<h1>CustomFieldParsedData</h1>
		<cfdump var="#this.customFieldParsedData#">
		<h1>UnparasedInfo</h1>
		<cfdump var="#this.unparasedInfo#">
		<h1>OrignalInfo</h1>
		<cfdump var="#this.orignalInfo#">
	</cffunction>
	
	<cffunction name="isSecureKeyValid">
		<cfset retData = false>
		<cfif StructKeyExists(this.customFieldParsedData, "cfpenc") AND StructFind(this.customFieldParsedData, "success") EQ true>
			<cfset retData = true>
		</cfif>
		<cfreturn retData>
	</cffunction>

	<cffunction name="isSecureKeyValidationPassed">
		<cfargument name="isCalledFromLoggingEvent" default="false">
		
		<cfif request.config.getValue("cfpaypalsecurekeyverificationenabled") EQ true>
			<cfset retData = false>
			<cfif StructKeyExists(this.customFieldParsedData, "cfpenc") AND StructKeyExists(this.customFieldParsedData, "cfpenc") NEQ "">
				<cfset retData = isSecureKeyValid()>
			</cfif>
		<cfelse>
			<cfset retData = true>
			<!--- while logging we still want to record the fact if key validation failed, just for reportin purposes --->
			<cfif arguments.isCalledFromLoggingEvent EQ true>
				<cfif StructKeyExists(this.customFieldParsedData, "cfpenc") AND StructFind(this.customFieldParsedData, "success") EQ false>
					<cfset retData = false>
				</cfif>
			</cfif>			
		</cfif>
		<cfreturn retData>
	</cffunction>
	
	<cffunction name="getInvoiceID" output="false">
		<cfif this.customInfo.getInvoice() NEQ "">
			<cfreturn this.customInfo.getInvoice()>
		<cfelse>	
			<cfif StructKeyExists(this.customFieldParsedData, "cfpdata") AND  this.customFieldParsedData.cfpdata NEQ "">
				<cfif this.cfpaypalInfo.isSubscriptionData()>
					<cfreturn "#request.config.getValue('cfpaypalautosubscriptionprefix')##this.customFieldParsedData.cfpData#">
				<cfelse>
					<cfreturn "#request.config.getValue('cfpaypalautoinvoiceprefix')##this.customFieldParsedData.cfpData#">
				</cfif>
			<cfelse>
				<cfif this.cfpaypalInfo.isSubscriptionData()>
					<cfreturn request.config.getValue('cfpaypalautosubscriptionprefix') & this.subscriptionInfo.getSubscr_Id()>
				<cfelse>
					<!--- system has no unique ID to keep create invoice table --->
					<cfreturn "">
				</cfif>
			</cfif>
		</cfif>
	</cffunction>

	
	<cffunction name="parsePaypalIPNData">
		<cfargument name="ipnData">
		
		<cfset paypalDataStruct = listToStruct(arguments.ipnData)>
		<cfset this.orignalInfo = StructCopy(paypalDataStruct)>
		
		<cfset this.buyerInfo = CreateObject("component","#request.comPath#.com.system.dataobject.BuyerInfo")>
		<cfset this.buyerInfo.setAddress_city(getPaypalStructData(paypalDataStruct,"address_city"))>
		<cfset this.buyerInfo.setAddress_country(getPaypalStructData(paypalDataStruct,"address_country"))>
		<cfset this.buyerInfo.setAddress_country_code(getPaypalStructData(paypalDataStruct,"address_country_code"))>
		<cfset this.buyerInfo.setAddress_name(getPaypalStructData(paypalDataStruct,"address_name"))>
		<cfset this.buyerInfo.setAddress_state(getPaypalStructData(paypalDataStruct,"address_state"))>
		<cfset this.buyerInfo.setAddress_status(getPaypalStructData(paypalDataStruct,"address_status"))>
		<cfset this.buyerInfo.setAddress_street(getPaypalStructData(paypalDataStruct,"address_street"))>
		<cfset this.buyerInfo.setAddress_zip(getPaypalStructData(paypalDataStruct,"address_zip"))>
		<cfset this.buyerInfo.setFirst_name(getPaypalStructData(paypalDataStruct,"first_name"))>
		<cfset this.buyerInfo.setLast_name(getPaypalStructData(paypalDataStruct,"last_name"))>
		<cfset this.buyerInfo.setPayer_business_name(getPaypalStructData(paypalDataStruct,"payer_business_name"))>
		<cfset this.buyerInfo.setPayer_email(getPaypalStructData(paypalDataStruct,"payer_email"))>
		<cfset this.buyerInfo.setPayer_id(getPaypalStructData(paypalDataStruct,"payer_id"))>
		<cfset this.buyerInfo.setPayer_status(getPaypalStructData(paypalDataStruct,"payer_status"))>
		<cfset this.buyerInfo.setResidence_country(getPaypalStructData(paypalDataStruct,"residence_country"))>
		
		<cfset this.basicInfo = CreateObject("component","#request.comPath#.com.system.dataobject.BasicInfo")>
		<cfset this.basicInfo.setBusiness(getPaypalStructData(paypalDataStruct,"business"))>
		<cfset this.basicInfo.setItem_name(getPaypalStructData(paypalDataStruct,"item_name"))>
		<cfset this.basicInfo.setItem_number(getPaypalStructData(paypalDataStruct,"item_number"))>
		<cfset this.basicInfo.setQuantity(getPaypalStructData(paypalDataStruct,"quantity"))>
		<cfset this.basicInfo.setReceiver_email(getPaypalStructData(paypalDataStruct,"receiver_email"))>
		<cfset this.basicInfo.setReceiver_id(getPaypalStructData(paypalDataStruct,"receiver_id"))>
		<cfset this.basicInfo.setOption_name1(getPaypalStructData(paypalDataStruct,"option_name1"))>
		<cfset this.basicInfo.setOption_name2(getPaypalStructData(paypalDataStruct,"option_name2"))>
		<cfset this.basicInfo.setOption_selection1(getPaypalStructData(paypalDataStruct,"option_selection1"))>
		<cfset this.basicInfo.setOption_selection2(getPaypalStructData(paypalDataStruct,"option_selection2"))>
		
		<cfset this.currencyInfo = CreateObject("component","#request.comPath#.com.system.dataobject.CurrencyInfo")>
		<cfset this.currencyInfo.setExchange_rate(getPaypalStructData(paypalDataStruct,"exchange_rate"))>
		<cfset this.currencyInfo.setMc_currency(getPaypalStructData(paypalDataStruct,"mc_currency"))>
		<cfset this.currencyInfo.setMc_fee(getPaypalStructData(paypalDataStruct,"mc_fee"))>
		<cfset this.currencyInfo.setMc_gross(getPaypalStructData(paypalDataStruct,"mc_gross"))>
		<cfset this.currencyInfo.setPayment_fee(getPaypalStructData(paypalDataStruct,"payment_fee"))>
		<cfset this.currencyInfo.setPayment_gross(getPaypalStructData(paypalDataStruct,"payment_gross"))>
		<cfset this.currencyInfo.setSettle_amount(getPaypalStructData(paypalDataStruct,"settle_amount"))>
		<cfset this.currencyInfo.setSettle_currency(getPaypalStructData(paypalDataStruct,"settle_currency"))>
		
		<cfset this.transactionInfo = CreateObject("component","#request.comPath#.com.system.dataobject.TransactionInfo")>
		<cfset this.transactionInfo.setPayment_status(getPaypalStructData(paypalDataStruct,"payment_status"))>
		<cfset this.transactionInfo.setPending_reason(getPaypalStructData(paypalDataStruct,"pending_reason"))>
		<cfset this.transactionInfo.setReason_code(getPaypalStructData(paypalDataStruct,"reason_code"))>
		<cfset this.transactionInfo.setPayment_date(getPaypalStructData(paypalDataStruct,"payment_date"))>
		<cfset this.transactionInfo.setTxn_id(getPaypalStructData(paypalDataStruct,"txn_id"))>
		<cfset this.transactionInfo.setParent_txn_id(getPaypalStructData(paypalDataStruct,"parent_txn_id"))>
		<cfset this.transactionInfo.setTxn_type(getPaypalStructData(paypalDataStruct,"txn_type"))>
		<cfset this.transactionInfo.setPayment_type(getPaypalStructData(paypalDataStruct,"payment_type"))>
		<cfset this.transactionInfo.setTax(getPaypalStructData(paypalDataStruct,"tax"))>
		<cfset this.transactionInfo.setShipping(getPaypalStructData(paypalDataStruct,"shipping"))>
		<cfset this.transactionInfo.setVerify_sign(getPaypalStructData(paypalDataStruct,"verify_sign"))>
		<cfset this.transactionInfo.setNotify_version(getPaypalStructData(paypalDataStruct,"notify_version"))>
		
		<cfset this.customInfo = CreateObject("component","#request.comPath#.com.system.dataobject.CustomInfo")>
		<cfset this.customInfo.setCustom(getPaypalStructData(paypalDataStruct,"custom"))>
		<cfset this.customInfo.setInvoice(getPaypalStructData(paypalDataStruct,"invoice"))>
		<cfset this.customInfo.setMemo(getPaypalStructData(paypalDataStruct,"memo"))>
		<cfset this.customFieldParsedData = parseCustomFieldData(this.customInfo.getCustom())>

		<cfset this.otherInfo = CreateObject("component","#request.comPath#.com.system.dataobject.OtherInfo")>
		<cfset this.otherInfo.setCharset(getPaypalStructData(paypalDataStruct,"charset"))>
		<cfset this.otherInfo.setTest_ipn(getPaypalStructData(paypalDataStruct,"test_ipn"))>

		<cfset this.subscriptionInfo = CreateObject("component","#request.comPath#.com.system.dataobject.SubscriptionInfo")>
		<cfset this.subscriptionInfo.setSubscr_date(getPaypalStructData(paypalDataStruct,"subscr_date"))>
		<cfset this.subscriptionInfo.setSubscr_effective(getPaypalStructData(paypalDataStruct,"subscr_effective"))>
		<cfset this.subscriptionInfo.setPeriod1(getPaypalStructData(paypalDataStruct,"period1"))>
		<cfset this.subscriptionInfo.setPeriod2(getPaypalStructData(paypalDataStruct,"period2"))>
		<cfset this.subscriptionInfo.setPeriod3(getPaypalStructData(paypalDataStruct,"period3"))>
		<cfset this.subscriptionInfo.setAmount1(getPaypalStructData(paypalDataStruct,"amount1"))>
		<cfset this.subscriptionInfo.setAmount2(getPaypalStructData(paypalDataStruct,"amount2"))>
		<cfset this.subscriptionInfo.setAmount3(getPaypalStructData(paypalDataStruct,"amount3"))>
		<cfset this.subscriptionInfo.setMc_amount1(getPaypalStructData(paypalDataStruct,"mc_amount1"))>
		<cfset this.subscriptionInfo.setMc_amount2(getPaypalStructData(paypalDataStruct,"mc_amount2"))>
		<cfset this.subscriptionInfo.setMc_amount3(getPaypalStructData(paypalDataStruct,"mc_amount3"))>
		<cfset this.subscriptionInfo.setRecurring(getPaypalStructData(paypalDataStruct,"recurring"))>
		<cfset this.subscriptionInfo.setReattempt(getPaypalStructData(paypalDataStruct,"reattempt"))>
		<cfset this.subscriptionInfo.setRetry_at(getPaypalStructData(paypalDataStruct,"retry_at"))>
		<cfset this.subscriptionInfo.setRecur_times(getPaypalStructData(paypalDataStruct,"recur_times"))>
		<cfset this.subscriptionInfo.setUsername(getPaypalStructData(paypalDataStruct,"username"))>
		<cfset this.subscriptionInfo.setPassword(getPaypalStructData(paypalDataStruct,"password"))>
		<cfset this.subscriptionInfo.setSubscr_id(getPaypalStructData(paypalDataStruct,"subscr_id"))>

		<cfset this.cartInfo = CreateObject("component","#request.comPath#.com.system.dataobject.CartInfo")>
		<cfset this.cartInfo.setNum_cart_items(getPaypalStructData(paypalDataStruct,"num_cart_items"))>
		<cfif this.cartInfo.getNum_cart_items() GT 0>
			<cfset this.cartInfo.setMc_handling(getPaypalStructData(paypalDataStruct,"mc_handling"))>
			<cfset this.cartInfo.setMc_shipping(getPaypalStructData(paypalDataStruct,"mc_shipping"))>
		
			<cfloop from="1" to="#this.cartInfo.getNum_cart_items()#" index="ctr">
				<cfset cartItem = CreateObject("component","#request.comPath#.com.system.common.CartItem")>
				<cfset cartItem.setItem_Name(  getPaypalStructData(paypalDataStruct,"item_name#ctr#") )>
				<cfset cartItem.setItem_Number(  getPaypalStructData(paypalDataStruct,"item_number#ctr#") )>
				<cfset cartItem.setQuantity(  getPaypalStructData(paypalDataStruct,"quantity#ctr#") )>
				<cfset cartItem.setShipping(  getPaypalStructData(paypalDataStruct,"mc_shipping#ctr#") )>
				<cfset cartItem.setHandling(  getPaypalStructData(paypalDataStruct,"mc_handling#ctr#") )>
				<cfset cartItem.setGross(  getPaypalStructData(paypalDataStruct,"mc_gross_#ctr#") )>
				<cfset cartItem.setOption_Name1(  getPaypalStructData(paypalDataStruct,"option_name1_#ctr#") )>
				<cfset cartItem.setOption_selection1(  getPaypalStructData(paypalDataStruct,"option_selection1_#ctr#") )>
				<cfset cartItem.setOption_Name2(  getPaypalStructData(paypalDataStruct,"option_name2_#ctr#") )>
				<cfset cartItem.setOption_selection2(  getPaypalStructData(paypalDataStruct,"option_selection2_#ctr#") )>
				<cfset this.cartInfo.addCartItem(cartItem)>
			</cfloop>
		</cfif>

		<cfset this.cfPaypalInfo = CreateObject("component","#request.comPath#.com.system.dataobject.CFPaypalInfo")>
		<cfif this.transactionInfo.getTxn_type().startsWith("subscr_")>
			<cfset this.cfPaypalInfo.setIsSubscriptionData(true)>
		</cfif>
		
		<cfset this.unparasedInfo = paypalDataStruct>		
	</cffunction>

	<cffunction name="getUnprocessedIPNDataList">
		<cfreturn structToList(this.unparasedInfo)>
	</cffunction>




	<!--- private functions --->
	<cffunction name="getPaypalStructData">
		<cfargument name="paypalDataStruct">
		<cfargument name="key">
		
		<cfset retData = "">
		<cfif StructKeyExists(arguments.paypalDataStruct, arguments.key)>
			<cfset retData = StructFind(arguments.paypalDataStruct, arguments.key)>
			<cfset StructDelete(arguments.paypalDataStruct, arguments.key)>
		</cfif>
		<cfreturn retData>
	</cffunction>
	
	<cffunction name="listToStruct">
		<cfargument name="data">
		<cfset retStruct = StructNew()>
		<cfset lineItemArray = ListToArray(arguments.data,"&")>
		<cfloop from="1" to="#ArrayLen(lineItemArray)#" index="ctr">
			<cfset item = lineItemArray[ctr]>
			<cfif ListLen(item,"=") GT 1>
				<cfset StructInsert(retStruct, ListGetAt(item,1,"="), UrlDecode(ListGetAt(item,2,"=")))>
			<cfelse>
				<cfset StructInsert(retStruct, ListGetAt(item,1,"="), "")>
			</cfif>
		</cfloop>
		<cfreturn retStruct>
	</cffunction>
	
	<cffunction name="structToList">
		<cfargument name="struct">
		<cfset list = "">
		<cfloop collection="#arguments.struct#" item="key">
			<cfif len(list) GT 0>
				<cfset list = list & "&">
			</cfif>
	   		<cfset list = list & "#KEY#=#arguments.struct[key]#">
		</cfloop>
		<cfreturn list>
	</cffunction>
	
	<cffunction name="parseCustomFieldData">
		<cfargument name="custom">
		
		<cfset dataStruct = StructNew()>
		<cfset dataStruct.custom = arguments.custom>
		<cfset dataStruct.success = true>
		
		<cfset internalData = "">
		<cfif arguments.custom.startsWith("cfpkey=")>
			<cfset internalData = arguments.custom>
			<cfset dataStruct.custom = "">
		<cfelse>
			<cfif find("^",arguments.custom) GT 0>
				<cfset internalData = Mid(arguments.custom, len(ListGetAt(arguments.custom, 1, "^"))+2,200)>
				<cfset dataStruct.custom = ListGetAt(arguments.custom, 1, "^")>
			</cfif>
		</cfif>

		<cfif internalData NEQ "">
			<cfset StructAppend(dataStruct, listToStruct( URLDecode(internalData) ) )>
			<cfset dataStruct.cfpenc = mid(internalData,find("cfpenc=",internalData)+7,200)>
			<cftry>
				<cfset decryptedValue = Decrypt(dataStruct.cfpenc, request.config.getValue("encryptionkey"))>
				<cfif dataStruct.cfpKey EQ "rnd" AND decryptedValue NEQ dataStruct.cfpData>
					<cfset dataStruct.success = false>
				</cfif> 
				<cfcatch type="expression">
					<cfset dataStruct.success = false>
				</cfcatch>
			</cftry>
		</cfif>
		<cfreturn dataStruct>
	</cffunction>
	
</cfcomponent>