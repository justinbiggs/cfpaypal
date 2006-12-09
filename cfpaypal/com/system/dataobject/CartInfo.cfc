<cfcomponent displayname='CartInfoBean' hint='CartInfoBean CFC Bean' extends="BaseDataObject" >
	<cfscript>
		variables.instance = structNew();
		variables.instance.cartItems = ArrayNew(1);
		variables.instance.num_cart_items = "";
		variables.instance.mc_handling = "";
		variables.instance.mc_shipping = "";
	</cfscript>

	<cffunction name="getDataForSQL">
		<cfscript>
			retData = StructNew();
			if (getNum_cart_items() NEQ "") 	StructInsert(retData, "num_cart_items", getNum_cart_items());
			if (getMc_handling() NEQ "") 		StructInsert(retData, "mc_handling", getMc_handling());
			if (getMc_shipping() NEQ "") 		StructInsert(retData, "mc_shipping", getMc_shipping());
			return retData;
		</cfscript>
	</cffunction>

	<cffunction name='getCartItems' displayname='string getMc_handling()' hint='get the value of the mc_handling property' access='public' output='false' returntype='array'>
		<cfreturn variables.instance.cartItems />
	</cffunction>

	<!--- init method --->
	<cffunction name='init' displayname='CartInfoBean init()' hint='initialze the bean' access='public' returntype='CartInfoBean' output='false'>
		<cfreturn this />
	</cffunction>

	<!--- standard getter/setter methods --->
	<cffunction name='getMc_handling' displayname='string getMc_handling()' hint='get the value of the mc_handling property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.mc_handling />
	</cffunction>
	<cffunction name='setMc_handling' displayname='setMc_handling(string newMc_handling)' hint='set the value of the mc_handling property' access='public' output='false' returntype='string'>
		<cfargument name='newMc_handling' displayname='string newMc_handling' hint='new value for the mc_handling property' type='string' required='yes' />
		<cfset variables.instance.mc_handling = arguments.newMc_handling />
	</cffunction>

	<cffunction name='getMc_shipping' displayname='string getMc_shipping()' hint='get the value of the mc_shipping property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.mc_shipping />
	</cffunction>
	<cffunction name='setMc_shipping' displayname='setMc_shipping(string newMc_shipping)' hint='set the value of the mc_shipping property' access='public' output='false' returntype='string'>
		<cfargument name='newMc_shipping' displayname='string newMc_shipping' hint='new value for the mc_shipping property' type='string' required='yes' />
		<cfset variables.instance.mc_shipping = arguments.newMc_shipping />
	</cffunction>
	
	<cffunction name='getNum_cart_items' displayname='string getCharset()' hint='get the value of the charset property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.num_cart_items />
	</cffunction>
	<cffunction name='setNum_cart_items' displayname='setCharset(string newCharset)' hint='set the value of the charset property' access='public' output='false' returntype='string'>
		<cfargument name='newnum_cart_items' displayname='string newCharset' hint='new value for the charset property' type='string' required='yes' />
		<cfset variables.instance.num_cart_items = arguments.newnum_cart_items />
	</cffunction>

	<cffunction name='addCartItem' displayname='string getCartItems()' hint='get the value of the cartItems property' access='public' output='false' returntype='string'>
		<cfargument name='cartItem'/>
		<cfset ArrayAppend(variables.instance.cartItems, arguments.cartItem)>
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

	<cffunction name="dump">
		<cfset _dumpData = StructNew()>
		<cfset _dumpData.num_cart_items = variables.instance.num_cart_items>
		<cfset _dumpData.mc_shipping = variables.instance.mc_shipping>
		<cfset _dumpData.mc_handling = variables.instance.mc_handling>

		<cfset _cartItems = ArrayNew(1)>
		<cfloop from="1" to="#ArrayLen(variables.instance.cartItems)#" index="ctr">
			<cfset _cartItem = variables.instance.cartItems[ctr].getInstanceData()>
			<cfset ArrayAppend(_cartItems, _cartItem)>
		</cfloop>
		<cfset _dumpData.cartItems = _cartItems>
		<cfdump var="#_dumpData#">
	</cffunction>
</cfcomponent>