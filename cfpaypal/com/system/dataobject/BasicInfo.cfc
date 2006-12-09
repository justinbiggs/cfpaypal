<cfcomponent displayname='BasicInformationBean' hint='BasicInformationBean CFC Bean' extends="BaseDataObject">
	<!--- init method --->
	<cffunction name='init' displayname='BasicInformationBean init()' hint='initialze the bean' access='public' returntype='BasicInformationBean' output='false'>
		<cfargument name='business' displayname='string business' hint='initial value for the business property' type='string' required='no' default='' />
		<cfargument name='item_name' displayname='string item_name' hint='initial value for the item_name property' type='string' required='no' default='' />
		<cfargument name='item_number' displayname='string item_number' hint='initial value for the item_number property' type='string' required='no' default='' />
		<cfargument name='quantity' displayname='string quantity' hint='initial value for the quantity property' type='string' required='no' default='' />
		<cfargument name='receiver_email' displayname='string receiver_email' hint='initial value for the receiver_email property' type='string' required='no' default='' />
		<cfargument name='receiver_id' displayname='string receiver_id' hint='initial value for the receiver_id property' type='string' required='no' default='' />
		<cfscript>
			variables.instance = structNew();
			variables.instance.business = arguments.business;
			variables.instance.item_name = arguments.item_name;
			variables.instance.item_number = arguments.item_number;
			variables.instance.quantity = arguments.quantity;
			variables.instance.receiver_email = arguments.receiver_email;
			variables.instance.receiver_id = arguments.receiver_id;
			variables.instance.option_name1 = arguments.option_name1;
			variables.instance.option_name2 = arguments.option_name2;
			variables.instance.option_selection1 = arguments.option_selection1;
			variables.instance.option_selection2 = arguments.option_selection2;
		</cfscript>
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getDataForSQL">
		<cfscript>
			retData = StructNew();
			if (getBusiness() NEQ "") StructInsert(retData, "business", "'#getBusiness()#'");
			if (getItem_name() NEQ "") StructInsert(retData, "item_name", "'#getItem_name()#'");
			if (getItem_number() NEQ "") StructInsert(retData, "item_number", "'#getItem_number()#'");
			if (getQuantity() NEQ "") StructInsert(retData, "quantity", getQuantity());
			if (getReceiver_email() NEQ "") StructInsert(retData, "receiver_email", "'#getReceiver_email()#'");
			if (getReceiver_id() NEQ "") StructInsert(retData, "receiver_id", "'#getReceiver_id()#'");
			if (getOption_name1() NEQ "") StructInsert(retData, "option_name1", "'#getOption_name1()#'");
			if (getOption_name2() NEQ "") StructInsert(retData, "option_name2", "'#getOption_name2()#'");
			if (getOption_selection1() NEQ "") StructInsert(retData, "option_selection1", "'#getOption_selection1()#'");
			if (getOption_selection2() NEQ "") StructInsert(retData, "option_selection2", "'#getOption_selection2()#'");
			return retData;
		</cfscript>
	</cffunction>

	<!--- standard getter/setter methods --->
	<cffunction name='getBusiness' displayname='string getBusiness()' hint='get the value of the business property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.business />
	</cffunction>
	<cffunction name='setBusiness' displayname='setBusiness(string newBusiness)' hint='set the value of the business property' access='public' output='false' returntype='string'>
		<cfargument name='newBusiness' displayname='string newBusiness' hint='new value for the business property' type='string' required='yes' />
		<cfset variables.instance.business = arguments.newBusiness />
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

	<cffunction name='getReceiver_email' displayname='string getReceiver_email()' hint='get the value of the receiver_email property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.receiver_email />
	</cffunction>
	<cffunction name='setReceiver_email' displayname='setReceiver_email(string newReceiver_email)' hint='set the value of the receiver_email property' access='public' output='false' returntype='string'>
		<cfargument name='newReceiver_email' displayname='string newReceiver_email' hint='new value for the receiver_email property' type='string' required='yes' />
		<cfset variables.instance.receiver_email = arguments.newReceiver_email />
	</cffunction>

	<cffunction name='getReceiver_id' displayname='string getReceiver_id()' hint='get the value of the receiver_id property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.receiver_id />
	</cffunction>
	<cffunction name='setReceiver_id' displayname='setReceiver_id(string newReceiver_id)' hint='set the value of the receiver_id property' access='public' output='false' returntype='string'>
		<cfargument name='newReceiver_id' displayname='string newReceiver_id' hint='new value for the receiver_id property' type='string' required='yes' />
		<cfset variables.instance.receiver_id = arguments.newReceiver_id />
	</cffunction>

	<cffunction name='getOption_name1' displayname='string getOption_name1()' hint='get the value of the option_name1 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.option_name1 />
	</cffunction>
	<cffunction name='setOption_name1' displayname='setOption_name1(string newOption_name1)' hint='set the value of the option_name1 property' access='public' output='false' returntype='string'>
		<cfargument name='newOption_name1' displayname='string newOption_name1' hint='new value for the option_name1 property' type='string' required='yes' />
		<cfset variables.instance.option_name1 = arguments.newOption_name1 />
	</cffunction>

	<cffunction name='getOption_name2' displayname='string getOption_name2()' hint='get the value of the option_name2 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.option_name2 />
	</cffunction>
	<cffunction name='setOption_name2' displayname='setOption_name2(string newOption_name2)' hint='set the value of the option_name2 property' access='public' output='false' returntype='string'>
		<cfargument name='newOption_name2' displayname='string newOption_name2' hint='new value for the option_name2 property' type='string' required='yes' />
		<cfset variables.instance.option_name2 = arguments.newOption_name2 />
	</cffunction>

	<cffunction name='getOption_selection1' displayname='string getOption_selection1()' hint='get the value of the option_selection1 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.option_selection1 />
	</cffunction>
	<cffunction name='setOption_selection1' displayname='setOption_selection1(string newOption_selection1)' hint='set the value of the option_selection1 property' access='public' output='false' returntype='string'>
		<cfargument name='newOption_selection1' displayname='string newOption_selection1' hint='new value for the option_selection1 property' type='string' required='yes' />
		<cfset variables.instance.option_selection1 = arguments.newOption_selection1 />
	</cffunction>

	<cffunction name='getOption_selection2' displayname='string getOption_selection2()' hint='get the value of the option_selection2 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.option_selection2 />
	</cffunction>
	<cffunction name='setOption_selection2' displayname='setOption_selection2(string newOption_selection2)' hint='set the value of the option_selection2 property' access='public' output='false' returntype='string'>
		<cfargument name='newOption_selection2' displayname='string newOption_selection2' hint='new value for the option_selection2 property' type='string' required='yes' />
		<cfset variables.instance.option_selection2 = arguments.newOption_selection2 />
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

</cfcomponent>