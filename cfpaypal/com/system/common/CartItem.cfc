<cfcomponent displayname='CartItem' hint='BuyNowCartItemBean CFC Bean'>
	<cfscript>
		variables.instance = structNew();
		variables.instance.item_name = "";
		variables.instance.item_number = "";
		variables.instance.Quantity = "";
		variables.instance.amount = "";
		variables.instance.shipping = "";
		variables.instance.shipping2 = "";
		variables.instance.handling = "";
		variables.instance.on0 = "";
		variables.instance.os0 = "";
		variables.instance.on1 = "";
		variables.instance.os1 = "";
		variables.instance.gross = "";
	</cfscript>

	<cffunction name="getDataForSQL">
		<cfscript>
			retData = StructNew();
			if (getItem_name() NEQ "") 			StructInsert(retData, "item_name", "'#getItem_name()#'");
			if (getItem_number() NEQ "") 		StructInsert(retData, "item_number", "'#getItem_number()#'");
			if (getQuantity() NEQ "") 			StructInsert(retData, "quantity", getQuantity());
			if (getShipping() NEQ "") 			StructInsert(retData, "shipping", getShipping());
			if (getShipping2() NEQ "") 			StructInsert(retData, "shipping2", getShipping2());
			if (getHandling() NEQ "") 			StructInsert(retData, "handling", getHandling());
			if (getOption_name1() NEQ "") 		StructInsert(retData, "option_name1", "'#getOption_name1()#'");
			if (getOption_name2() NEQ "") 		StructInsert(retData, "option_name2", "'#getOption_name2()#'");
			if (getOption_selection1() NEQ "") 	StructInsert(retData, "option_selection1", "'#getOption_selection1()#'");
			if (getOption_selection2() NEQ "") 	StructInsert(retData, "option_selection2", "'#getOption_selection2()#'");
			if (getGross() NEQ "") 				StructInsert(retData, "gross", getGross());
			return retData;
		</cfscript>
	</cffunction>

	<!--- init method --->
	<cffunction name='init' displayname='BuyNowCartItemBean init()' hint='initialze the bean' access='public' returntype='BuyNowCartItemBean' output='false'>
		<cfreturn this />
	</cffunction>

	<!--- standard getter/setter methods --->
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

	<cffunction name='getQuantity' displayname='string getQuantity()' hint='get the value of the Quantity property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.Quantity />
	</cffunction>
	<cffunction name='setQuantity' displayname='setQuantity(string newQuantity)' hint='set the value of the Quantity property' access='public' output='false' returntype='string'>
		<cfargument name='newQuantity' displayname='string newQuantity' hint='new value for the Quantity property' type='string' required='yes' />
		<cfset variables.instance.Quantity = arguments.newQuantity />
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

	<cffunction name='getGross' displayname='string getOs1()' hint='get the value of the os1 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.gross />
	</cffunction>
	<cffunction name='setGross' displayname='setOs1(string newOs1)' hint='set the value of the os1 property' access='public' output='false' returntype='string'>
		<cfargument name='newOs1' displayname='string newOs1' hint='new value for the os1 property' type='string' required='yes' />
		<cfset variables.instance.gross = arguments.newOs1 />
	</cffunction>

	<cffunction name="getButtonHTML" output="false">
		<cfargument name="index" type="numeric" default="1">
		<cfargument name="singleLineHTML" type="boolean" default="false">
		<cfsavecontent variable="html">
			<cfoutput>
			<cfif getItem_name() NEQ "">
				<input type="hidden" name="item_name_#arguments.index#" value="#getItem_name()#">
			</cfif>
			<cfif getItem_number() NEQ "">
				<input type="hidden" name="item_number_#arguments.index#" value="#getItem_number()#">
			</cfif>
			<cfif getQuantity() NEQ "">
				<input type="hidden" name="quantity_#arguments.index#" value="#getQuantity()#">
			</cfif>
			<cfif getAmount() NEQ "">
				<input type="hidden" name="amount_#arguments.index#" value="#getAmount()#">
			</cfif>
			<cfif getShipping() NEQ "">
				<input type="hidden" name="shipping_#arguments.index#" value="#getShipping()#">
			</cfif>
			<cfif getShipping2() NEQ "">
				<input type="hidden" name="shipping2_#arguments.index#" value="#getShipping2()#">
			</cfif>
			<cfif getHandling() NEQ "">
				<input type="hidden" name="handling_#arguments.index#" value="#getHandling()#">
			</cfif>
			<cfif getOn0() NEQ "">
				<input type="hidden" name="on0_#arguments.index#" value="#getOn0()#">
			</cfif>
			<cfif getOs0() NEQ "">
				<input type="hidden" name="os0_#arguments.index#" value="#getOs0()#">
			</cfif>
			<cfif getOn1() NEQ "">
				<input type="hidden" name="on1_#arguments.index#" value="#getOn1()#">
			</cfif>
			<cfif getOs1() NEQ "">
				<input type="hidden" name="os1_#arguments.index#" value="#getOs1()#">
			</cfif>
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

	<cffunction name="getInstanceData">
		<cfreturn Duplicate(variables.instance)>
	</cffunction>

	<cffunction name="dump">
		<cfdump var="#variables.instance#">
	</cffunction>
</cfcomponent>