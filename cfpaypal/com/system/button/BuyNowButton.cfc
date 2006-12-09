<cfcomponent displayname='BuyNowButtonBean' hint='BuyNowButtonBean CFC Bean' extends="BaseButtonObject" output="no">
	<cfscript>
		variables.instance = structNew();
		variables.instance.business = request.config.getValue("paypalbusinessemail");
		variables.instance.currency_code = request.config.getValue("defaultcurrencycode");
		variables.instance.notify_url = request.config.getValue('paypalnotifyurl');
		variables.instance.return = request.config.getValue('paypalreturnurl');
		variables.instance.cancel_return = request.config.getValue('paypalcancelurl');
		variables.instance.image_url = request.config.getValue('defaultcompanylogourl');

		variables.instance.custom = "";
		variables.instance.invoice = "";

		variables.instance.item_name = "";
		variables.instance.item_number = "";
		variables.instance.quantity = "";
		variables.instance.amount = "";
		
		variables.instance.shipping = "";
		variables.instance.shipping2 = "";
		variables.instance.handling = "";
		variables.instance.tax = "";
		variables.instance.no_shipping = "";
		variables.instance.cn = "";
		variables.instance.no_note = "";
		variables.instance.on0 = "";
		variables.instance.os0 = "";
		variables.instance.on1 = "";
		variables.instance.os1 = "";
		variables.instance.cs = "";
		
		variables.instance.cartItem = ArrayNew(1);
		variables.instance.customerDataPass = "";
	</cfscript>

	<!--- init method --->
	<cffunction name='init' displayname='BuyNowButtonBean init()' hint='initialze the bean' access='public' returntype='BuyNowButtonBean' output='false'>
		<cfreturn this />
	</cffunction>

	<!--- standard getter/setter methods --->
	<cffunction name='getBusiness' displayname='string getBusiness()' hint='get the value of the business property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.business />
	</cffunction>
	<cffunction name='setBusiness' displayname='setBusiness(string newBusiness)' hint='set the value of the business property' access='public' output='false' returntype='string'>
		<cfargument name='newBusiness' displayname='string newBusiness' hint='new value for the business property' type='string' required='yes' />
		<cfset variables.instance.business = arguments.newBusiness />
	</cffunction>

	<cffunction name='getCurrency_code' displayname='string getCurrency_code()' hint='get the value of the currency_code property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.currency_code />
	</cffunction>
	<cffunction name='setCurrency_code' displayname='setCurrency_code(string newCurrency_code)' hint='set the value of the currency_code property' access='public' output='false' returntype='string'>
		<cfargument name='newCurrency_code' displayname='string newCurrency_code' hint='new value for the currency_code property' type='string' required='yes' />
		<cfset variables.instance.currency_code = arguments.newCurrency_code />
	</cffunction>

	<cffunction name='getItem_name' displayname='string getItem_name()' hint='get the value of the item_name property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.item_name />
	</cffunction>
	<cffunction name='setItem_name' displayname='setItem_name(string newItem_name)' hint='set the value of the item_name property' access='public' output='false' returntype='string'>
		<cfargument name='newItem_name' displayname='string newItem_name' hint='new value for the item_name property' type='string' required='yes' />
		<cfset variables.instance.item_name = arguments.newItem_name />
	</cffunction>

	<cffunction name='getItem_number' displayname='string getItem_number()' hint='get the value of the item_number property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.item_number />
	</cffunction>
	<cffunction name='setItem_number' displayname='setItem_number(string newItem_number)' hint='set the value of the item_number property' access='public' output='false' returntype='string'>
		<cfargument name='newItem_number' displayname='string newItem_number' hint='new value for the item_number property' type='string' required='yes' />
		<cfset variables.instance.item_number = arguments.newItem_number />
	</cffunction>

	<cffunction name='getQuantity' displayname='string getQuantity()' hint='get the value of the quantity property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.quantity />
	</cffunction>
	<cffunction name='setQuantity' displayname='setQuantity(string newQuantity)' hint='set the value of the quantity property' access='public' output='false' returntype='string'>
		<cfargument name='newQuantity' displayname='string newQuantity' hint='new value for the quantity property' type='string' required='yes' />
		<cfset variables.instance.quantity = arguments.newQuantity />
	</cffunction>

	<cffunction name='getAmount' displayname='string getAmount()' hint='get the value of the amount property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.amount />
	</cffunction>
	<cffunction name='setAmount' displayname='setAmount(string newAmount)' hint='set the value of the amount property' access='public' output='false' returntype='string'>
		<cfargument name='newAmount' displayname='string newAmount' hint='new value for the amount property' type='string' required='yes' />
		<cfset variables.instance.amount = arguments.newAmount />
	</cffunction>

	<cffunction name='getShipping' displayname='string getShipping()' hint='get the value of the shipping property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.shipping />
	</cffunction>
	<cffunction name='setShipping' displayname='setShipping(string newShipping)' hint='set the value of the shipping property' access='public' output='false' returntype='string'>
		<cfargument name='newShipping' displayname='string newShipping' hint='new value for the shipping property' type='string' required='yes' />
		<cfset variables.instance.shipping = arguments.newShipping />
	</cffunction>

	<cffunction name='getShipping2' displayname='string getShipping2()' hint='get the value of the shipping2 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.shipping2 />
	</cffunction>
	<cffunction name='setShipping2' displayname='setShipping2(string newShipping2)' hint='set the value of the shipping2 property' access='public' output='false' returntype='string'>
		<cfargument name='newShipping2' displayname='string newShipping2' hint='new value for the shipping2 property' type='string' required='yes' />
		<cfset variables.instance.shipping2 = arguments.newShipping2 />
	</cffunction>

	<cffunction name='getHandling' displayname='string getHandling()' hint='get the value of the handling property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.handling />
	</cffunction>
	<cffunction name='setHandling' displayname='setHandling(string newHandling)' hint='set the value of the handling property' access='public' output='false' returntype='string'>
		<cfargument name='newHandling' displayname='string newHandling' hint='new value for the handling property' type='string' required='yes' />
		<cfset variables.instance.handling = arguments.newHandling />
	</cffunction>

	<cffunction name='getTax' displayname='string getTax()' hint='get the value of the tax property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.tax />
	</cffunction>
	<cffunction name='setTax' displayname='setTax(string newTax)' hint='set the value of the tax property' access='public' output='false' returntype='string'>
		<cfargument name='newTax' displayname='string newTax' hint='new value for the tax property' type='string' required='yes' />
		<cfset variables.instance.tax = arguments.newTax />
	</cffunction>

	<cffunction name='getNo_shipping' displayname='string getNo_shipping()' hint='get the value of the no_shipping property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.no_shipping />
	</cffunction>
	<cffunction name='setNo_shipping' displayname='setNo_shipping(string newNo_shipping)' hint='set the value of the no_shipping property' access='public' output='false' returntype='string'>
		<cfargument name='newNo_shipping' displayname='string newNo_shipping' hint='new value for the no_shipping property' type='string' required='yes' />
		<cfset variables.instance.no_shipping = arguments.newNo_shipping />
	</cffunction>

	<cffunction name='getCn' displayname='string getCn()' hint='get the value of the cn property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.cn />
	</cffunction>
	<cffunction name='setCn' displayname='setCn(string newCn)' hint='set the value of the cn property' access='public' output='false' returntype='string'>
		<cfargument name='newCn' displayname='string newCn' hint='new value for the cn property' type='string' required='yes' />
		<cfset variables.instance.cn = arguments.newCn />
	</cffunction>

	<cffunction name='getNo_note' displayname='string getNo_note()' hint='get the value of the no_note property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.no_note />
	</cffunction>
	<cffunction name='setNo_note' displayname='setNo_note(string newNo_note)' hint='set the value of the no_note property' access='public' output='false' returntype='string'>
		<cfargument name='newNo_note' displayname='string newNo_note' hint='new value for the no_note property' type='string' required='yes' />
		<cfset variables.instance.no_note = arguments.newNo_note />
	</cffunction>

	<cffunction name='getOn0' displayname='string getOn0()' hint='get the value of the on0 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.on0 />
	</cffunction>
	<cffunction name='setOn0' displayname='setOn0(string newOn0)' hint='set the value of the on0 property' access='public' output='false' returntype='string'>
		<cfargument name='newOn0' displayname='string newOn0' hint='new value for the on0 property' type='string' required='yes' />
		<cfset variables.instance.on0 = arguments.newOn0 />
	</cffunction>

	<cffunction name='getOs0' displayname='string getOs0()' hint='get the value of the os0 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.os0 />
	</cffunction>
	<cffunction name='setOs0' displayname='setOs0(string newOs0)' hint='set the value of the os0 property' access='public' output='false' returntype='string'>
		<cfargument name='newOs0' displayname='string newOs0' hint='new value for the os0 property' type='string' required='yes' />
		<cfset variables.instance.os0 = arguments.newOs0 />
	</cffunction>

	<cffunction name='getOn1' displayname='string getOn1()' hint='get the value of the on1 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.on1 />
	</cffunction>
	<cffunction name='setOn1' displayname='setOn1(string newOn1)' hint='set the value of the on1 property' access='public' output='false' returntype='string'>
		<cfargument name='newOn1' displayname='string newOn1' hint='new value for the on1 property' type='string' required='yes' />
		<cfset variables.instance.on1 = arguments.newOn1 />
	</cffunction>

	<cffunction name='getOs1' displayname='string getOs1()' hint='get the value of the os1 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.os1 />
	</cffunction>
	<cffunction name='setOs1' displayname='setOs1(string newOs1)' hint='set the value of the os1 property' access='public' output='false' returntype='string'>
		<cfargument name='newOs1' displayname='string newOs1' hint='new value for the os1 property' type='string' required='yes' />
		<cfset variables.instance.os1 = arguments.newOs1 />
	</cffunction>

	<cffunction name='getCustom' displayname='string getCustom()' hint='get the value of the custom property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.custom.trim() />
	</cffunction>
	<cffunction name='setCustom' displayname='setCustom(string newCustom)' hint='set the value of the custom property' access='public' output='false' returntype='string'>
		<cfargument name='newCustom' displayname='string newCustom' hint='new value for the custom property' type='string' required='yes' />
		<cfset variables.instance.custom = arguments.newCustom />
	</cffunction>

	<cffunction name='getInvoice' displayname='string getInvoice()' hint='get the value of the invoice property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.invoice.trim() />
	</cffunction>
	<cffunction name='setInvoice' displayname='setInvoice(string newInvoice)' hint='set the value of the invoice property' access='public' output='false' returntype='string'>
		<cfargument name='newInvoice' displayname='string newInvoice' hint='new value for the invoice property' type='string' required='yes' />
		<cfset variables.instance.invoice = arguments.newInvoice />
	</cffunction>

	<cffunction name='getNotify_url' displayname='string getNotify_url()' hint='get the value of the notify_url property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.notify_url />
	</cffunction>
	<cffunction name='setNotify_url' displayname='setNotify_url(string newNotify_url)' hint='set the value of the notify_url property' access='public' output='false' returntype='string'>
		<cfargument name='newNotify_url' displayname='string newNotify_url' hint='new value for the notify_url property' type='string' required='yes' />
		<cfset variables.instance.notify_url = arguments.newNotify_url />
	</cffunction>

	<cffunction name='getReturn' displayname='string getReturn()' hint='get the value of the return property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.return />
	</cffunction>
	<cffunction name='setReturn' displayname='setReturn(string newReturn)' hint='set the value of the return property' access='public' output='false' returntype='string'>
		<cfargument name='newReturn' displayname='string newReturn' hint='new value for the return property' type='string' required='yes' />
		<cfset variables.instance.return = arguments.newReturn />
	</cffunction>

	<cffunction name='getCancel_return' displayname='string getCancel_return()' hint='get the value of the cancel_return property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.cancel_return />
	</cffunction>
	<cffunction name='setCancel_return' displayname='setCancel_return(string newCancel_return)' hint='set the value of the cancel_return property' access='public' output='false' returntype='string'>
		<cfargument name='newCancel_return' displayname='string newCancel_return' hint='new value for the cancel_return property' type='string' required='yes' />
		<cfset variables.instance.cancel_return = arguments.newCancel_return />
	</cffunction>

	<cffunction name='getImage_url' displayname='string getImage_url()' hint='get the value of the image_url property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.image_url />
	</cffunction>
	<cffunction name='setImage_url' displayname='setImage_url(string newImage_url)' hint='set the value of the image_url property' access='public' output='false' returntype='string'>
		<cfargument name='newImage_url' displayname='string newImage_url' hint='new value for the image_url property' type='string' required='yes' />
		<cfset variables.instance.image_url = arguments.newImage_url />
	</cffunction>

	<cffunction name='getCs' displayname='string getCs()' hint='get the value of the cs property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.cs />
	</cffunction>
	<cffunction name='setCs' displayname='setCs(string newCs)' hint='set the value of the cs property' access='public' output='false' returntype='string'>
		<cfargument name='newCs' displayname='string newCs' hint='new value for the cs property' type='string' required='yes' />
		<cfset variables.instance.cs = arguments.newCs />
	</cffunction>

	<!--- standard get instance method --->
	<cffunction name='getInstance' displayname='struct getInstance()' hint='get struct instance of the bean' access='public' returntype='struct' output='false'>
		<cfreturn variables.instance />
	</cffunction>

	<!--- standard set instance method --->
	<cffunction name='setInstance' displayname='setInstance(struct newInstance)' hint='set struct instance of the bean' access='public' returntype='void' output='false'>
		<cfargument name='newInstance' displayname='struct newInstance' hint='new instance for the bean' type='struct' required='yes' />
		<cfset variables.instance = arguments.newInstance />
	</cffunction>

	<!--------
	ADDON Properties
	---------->
	<cffunction name='getOption_Name1' displayname='string getOn0()' hint='get the value of the on0 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.on0 />
	</cffunction>
	<cffunction name='setOption_Name1' displayname='setOn0(string newOn0)' hint='set the value of the on0 property' access='public' output='false' returntype='string'>
		<cfargument name='newOn0' displayname='string newOn0' hint='new value for the on0 property' type='string' required='yes' />
		<cfset variables.instance.on0 = arguments.newOn0 />
	</cffunction>

	<cffunction name='getOption_selection1' displayname='string getOs0()' hint='get the value of the os0 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.os0 />
	</cffunction>
	<cffunction name='setOption_selection1' displayname='setOs0(string newOs0)' hint='set the value of the os0 property' access='public' output='false' returntype='string'>
		<cfargument name='newOs0' displayname='string newOs0' hint='new value for the os0 property' type='string' required='yes' />
		<cfset variables.instance.os0 = arguments.newOs0 />
	</cffunction>

	<cffunction name='getOption_Name2' displayname='string getOn1()' hint='get the value of the on1 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.on1 />
	</cffunction>
	<cffunction name='setOption_Name2' displayname='setOn1(string newOn1)' hint='set the value of the on1 property' access='public' output='false' returntype='string'>
		<cfargument name='newOn1' displayname='string newOn1' hint='new value for the on1 property' type='string' required='yes' />
		<cfset variables.instance.on1 = arguments.newOn1 />
	</cffunction>

	<cffunction name='getOption_selection2' displayname='string getOs1()' hint='get the value of the os1 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.os1 />
	</cffunction>
	<cffunction name='setOption_selection2' displayname='setOs1(string newOs1)' hint='set the value of the os1 property' access='public' output='false' returntype='string'>
		<cfargument name='newOs1' displayname='string newOs1' hint='new value for the os1 property' type='string' required='yes' />
		<cfset variables.instance.os1 = arguments.newOs1 />
	</cffunction>
	
	<cffunction name='getIsShippingAddressRequired' displayname='string getNo_shipping()' hint='get the value of the no_shipping property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.no_shipping />
	</cffunction>
	<cffunction name='setIsShippingAddressRequired' displayname='setNo_shipping(string newNo_shipping)' hint='set the value of the no_shipping property' access='public' output='false' returntype='string'>
		<cfargument name='newNo_shipping' displayname='boolean newNo_shipping' hint='new value for the no_shipping property' type='boolean' required='yes' />
		<cfif arguments.newNo_shipping EQ true>
			<cfset variables.instance.no_shipping = 2 />
		<cfelse>
			<cfset variables.instance.no_shipping = 0 />
		</cfif>
	</cffunction>

	<cffunction name='getNoteName' displayname='string getCn()' hint='get the value of the cn property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.cn />
	</cffunction>
	<cffunction name='setNoteName' displayname='setCn(string newCn)' hint='set the value of the cn property' access='public' output='false' returntype='string'>
		<cfargument name='newCn' displayname='string newCn' hint='new value for the cn property' type='string' required='yes' />
		<cfset variables.instance.cn = arguments.newCn />
	</cffunction>

	<cffunction name='getIsNoteRequired' displayname='string getNo_note()' hint='get the value of the no_note property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.no_note />
	</cffunction>
	<cffunction name='setIsNoteRequired' displayname='setNo_note(string newNo_note)' hint='set the value of the no_note property' access='public' output='false' returntype='string'>
		<cfargument name='newNo_note' displayname='string newNo_note' hint='new value for the no_note property' type='boolean' required='yes' />
		<cfif arguments.newNo_note EQ true>
			<cfset variables.instance.no_note = 2 />
		<cfelse>
			<cfset variables.instance.no_note = 0 />
		</cfif>
	</cffunction>
	
	<cffunction name="getButtonHTML" output="false">
		<cfargument name="singleLineHTML" type="boolean" default="false">
		<cfargument name="showSubmitButton" type="boolean" default="true">
		<cfargument name="customButton" type="string" default="">
		<cfargument name="htmlFormName" type="string" default="">
		
		<cfsavecontent variable="html">
			<cfoutput>
			<cfset formName = "">
			<cfif arguments.htmlFormName NEQ "">
				<cfset formName = " name=""#arguments.htmlFormName#"" id=""#arguments.htmlFormName#"" ">
			</cfif>
			<form action="#request.config.getValue('paypalposturl')#" method="post" #formName#>
				<cfif isObject(variables.instance.customerDataPass)>
					#variables.instance.customerDataPass.getCustomerInfoHTML(singleLineHTML=arguments.singleLineHTML)#
					<input type="hidden" name="cmd" value="_ext-enter">
				</cfif>

				<cfif ArrayLen(variables.instance.cartItem) GT 0>
					<input type="hidden" name="upload" value="1">
					<cfif isObject(variables.instance.customerDataPass)>
						<input type="hidden" name="redirect_cmd" value="_cart">
					<cfelse>
						<input type="hidden" name="cmd" value="_cart">
					</cfif>
				<cfelse>
					<cfif isObject(variables.instance.customerDataPass)>
						<input type="hidden" name="redirect_cmd" value="_xclick">
					<cfelse>
						<input type="hidden" name="cmd" value="_xclick">
					</cfif>
				</cfif>
				<input type="hidden" name="custom" value="#transactionSecretKey()#">
				<cfif getInvoice() NEQ "">
					<input type="hidden" name="invoice" value="#getInvoice()#">
				</cfif>

				<input type="hidden" name="business" value="#getBusiness()#">
				<input type="hidden" name="currency_code" value="#getCurrency_code()#">
				<input type="hidden" name="notify_url" value="#getNotify_url()#">
				<input type="hidden" name="return" value="#getReturn()#">
				<input type="hidden" name="cancel_return" value="#getCancel_return()#">
				<input type="hidden" name="image_url" value="#getImage_url()#">
				
				<cfif ArrayLen(variables.instance.cartItem) GT 0>
					<cfloop from="1" to="#ArrayLen(variables.instance.cartItem)#" index="ctr">
						<cfoutput>#variables.instance.cartItem[ctr].getButtonHTML(index=ctr,singleLineHTML=arguments.singleLineHTML)#</cfoutput>
					</cfloop>
				<cfelse>
					<cfif getItem_name() NEQ "">
						<input type="hidden" name="item_name" value="#getItem_name()#">
					</cfif>
					<cfif getItem_number() NEQ "">
						<input type="hidden" name="item_number" value="#getItem_number()#">
					</cfif>
					<cfif getQuantity() NEQ "">
						<input type="hidden" name="quantity" value="#getQuantity()#">
					</cfif>
					<cfif getAmount() NEQ "">
						<input type="hidden" name="amount" value="#getAmount()#">
					</cfif>
					<cfif getShipping() NEQ "">
						<input type="hidden" name="shipping" value="#getShipping()#">
					</cfif>
					<cfif getShipping2() NEQ "">
						<input type="hidden" name="shipping2" value="#getShipping2()#">
					</cfif>
					<cfif getHandling() NEQ "">
						<input type="hidden" name="handling" value="#getHandling()#">
					</cfif>
					<cfif getOn0() NEQ "">
						<input type="hidden" name="on0" value="#getOn0()#">
					</cfif>
					<cfif getOs0() NEQ "">
						<input type="hidden" name="os0" value="#getOs0()#">
					</cfif>
					<cfif getOn1() NEQ "">
						<input type="hidden" name="on1" value="#getOn1()#">
					</cfif>
					<cfif getOs1() NEQ "">
						<input type="hidden" name="os1" value="#getOs1()#">
					</cfif>
				</cfif>
				<cfif getNo_shipping() NEQ "">
					<input type="hidden" name="no_shipping" value="#getNo_shipping()#">
				</cfif>
				<cfif getCn() NEQ "">
					<input type="hidden" name="cn" value="#getCn()#">
				</cfif>
				<cfif getNo_note() NEQ "">
					<input type="hidden" name="no_note" value="#getNo_note()#">
				</cfif>
				<cfif showSubmitButton EQ true>
					<cfif len(customButton) GT 0>
						#customButton#
					<cfelse>
						<input type="image" src="http://www.paypal.com/en_US/i/btn/x-click-but01.gif" name="submit" alt="Make payments with PayPal - it's fast, free and secure!">
					</cfif>
				</cfif>
			</form>
			</cfoutput>
		</cfsavecontent>
		<cfset html = ReReplace(html, "[\t]+", "", "ALL")>
		<cfif arguments.singleLineHTML EQ true>
			<cfset html = ReReplace(html, "[\r\n]+", "", "ALL")>
		<cfelse>
			<cfset html = ReReplace(html, "[\r\n]+", "#Chr(10)#", "ALL")>
		</cfif>
		<cfreturn html>
	</cffunction>
	
	<cffunction name='addCartItem' access='public' output='false' returntype='string'>
		<cfargument name='cartItem' required='yes' />
		<cfset ArrayAppend(variables.instance.cartItem, arguments.cartItem)>
	</cffunction>

	<cffunction name='setCustomerDataPass' access='public' output='false' returntype='string'>
		<cfargument name='data' required='yes' />
		<cfset variables.instance.customerDataPass = arguments.data>
	</cffunction>
	
	<cffunction name="transactionSecretKey" output="false">	
		<cfargument name="isSubscription" default="false">
		
		<cfset retData = "">
		<cfif getInvoice() EQ "">
			<cfset key = "rnd">
			<cfset gotRandonNumber = false>
			<cfloop condition="gotRandonNumber EQ false">
				<cfset data = trim(RandRange(10000, 1000000))>
				
				<!--- check that randon number does not exsit in order database --->
				<cfif arguments.isSubscription EQ true>
					<cfquery name="qryData" datasource="#request.config.getValue('cfpaypalds')#" username="#request.config.getValue('cfpaypaldsuid')#" password="#request.config.getValue('cfpaypaldspwd')#">
						SELECT COUNT(*) AS Total FROM cfpaypal_subscription WHERE invoice = "#request.config.getValue('cfpaypalautosubscriptionprefix')##data#"
					</cfquery>
				<cfelse>
					<cfquery name="qryData" datasource="#request.config.getValue('cfpaypalds')#" username="#request.config.getValue('cfpaypaldsuid')#" password="#request.config.getValue('cfpaypaldspwd')#">
						SELECT COUNT(*) AS Total FROM cfpaypal_invoice WHERE invoice = "#request.config.getValue('cfpaypalautoinvoiceprefix')##data#"
					</cfquery>
				</cfif>
				<cfif qryData.Total LTE 0>
					<cfset gotRandonNumber = true>
				</cfif>
			</cfloop>			
		<cfelse>
			<cfset key = "invoice">
			<cfset data = getInvoice()>
		</cfif>
		<cfset encryptedData = Encrypt(data, request.config.getValue("encryptionkey"))>
		<cfset list = "cfpkey=#key#&cfpdata=#data#&cfpenc=#encryptedData#">
		<cfif getCustom() EQ "">
			<cfset retData = list>
		<cfelse>
			<cfset retData = getCustom() & "^" & list>
		</cfif>
		<cfreturn retData>
	</cffunction>
	
	<!----
	<cffunction name="createInvoiceRecord">
		<cfargument name="invoice">
		<cfquery name="qryData" datasource="#request.config.getValue('cfpaypalds')#" username="#request.config.getValue('cfpaypaldsuid')#" password="#request.config.getValue('cfpaypaldspwd')#">
			SELECT COUNT(*) as InvoiceExists  FROM cfpaypal_invoice WHERE invoice = 
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.invoice#">
		</cfquery>
		<cfif qryData.InvoiceExists LTE 0>
			<!--- Only create the invoice record if it does not exists --->
			<cfquery name="qryData" datasource="#request.config.getValue('cfpaypalds')#" username="#request.config.getValue('cfpaypaldsuid')#" password="#request.config.getValue('cfpaypaldspwd')#">
				INSERT INTO cfpaypal_invoice (invoice, createdOn, lastUpdatedOn) Values(
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.invoice#">, #CreateOdbcDateTime(now())#, #CreateOdbcDateTime(now())#)
			</cfquery>
		</cfif>
	</cffunction>
	---->
</cfcomponent>