<!--- created by Bean Maker v0.1 --->

<cfcomponent displayname='CustomInfoBean' hint='CustomInfoBean CFC Bean' extends="BaseDataObject">
	<!--- init method --->
	<cffunction name='init' displayname='CustomInfoBean init()' hint='initialze the bean' access='public' returntype='CustomInfoBean' output='false'>
		<cfargument name='custom' displayname='string custom' hint='initial value for the custom property' type='string' required='no' default='' />
		<cfargument name='invoice' displayname='string invoice' hint='initial value for the invoice property' type='string' required='no' default='' />
		<cfargument name='memo' displayname='string memo' hint='initial value for the memo property' type='string' required='no' default='' />
		<cfscript>
			variables.instance = structNew();
			variables.instance.custom = arguments.custom;
			variables.instance.invoice = arguments.invoice;
			variables.instance.memo = arguments.memo;
		</cfscript>
		<cfreturn this />
	</cffunction>

	<cffunction name="getDataForSQL">
		<cfscript>
			retData = StructNew();
			if (getCustom() NEQ "") 		StructInsert(retData, "custom", "'#getCustom()#'");
			if (getInvoice() NEQ "") 		StructInsert(retData, "invoice", "'#getInvoice()#'");
			if (getMemo() NEQ "") 			StructInsert(retData, "memo", "'#getMemo()#'");
			return retData;
		</cfscript>
	</cffunction>

	<!--- standard getter/setter methods --->
	<cffunction name='getCustom' displayname='string getCustom()' hint='get the value of the custom property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.custom />
	</cffunction>
	<cffunction name='setCustom' displayname='setCustom(string newCustom)' hint='set the value of the custom property' access='public' output='false' returntype='string'>
		<cfargument name='newCustom' displayname='string newCustom' hint='new value for the custom property' type='string' required='yes' />
		<cfset variables.instance.custom = arguments.newCustom />
	</cffunction>

	<cffunction name='getInvoice' displayname='string getInvoice()' hint='get the value of the invoice property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.invoice />
	</cffunction>
	<cffunction name='setInvoice' displayname='setInvoice(string newInvoice)' hint='set the value of the invoice property' access='public' output='false' returntype='string'>
		<cfargument name='newInvoice' displayname='string newInvoice' hint='new value for the invoice property' type='string' required='yes' />
		<cfset variables.instance.invoice = arguments.newInvoice />
	</cffunction>

	<cffunction name='getMemo' displayname='string getMemo()' hint='get the value of the memo property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.memo />
	</cffunction>
	<cffunction name='setMemo' displayname='setMemo(string newMemo)' hint='set the value of the memo property' access='public' output='false' returntype='string'>
		<cfargument name='newMemo' displayname='string newMemo' hint='new value for the memo property' type='string' required='yes' />
		<cfset variables.instance.memo = arguments.newMemo />
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