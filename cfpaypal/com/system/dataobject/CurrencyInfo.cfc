<cfcomponent displayname='CurrencyInfoBean' hint='CurrencyInfoBean CFC Bean' extends="BaseDataObject">
	<!--- init method --->
	<cffunction name='init' displayname='CurrencyInfoBean init()' hint='initialze the bean' access='public' returntype='CurrencyInfoBean' output='false'>
		<cfargument name='exchange_rate' displayname='string exchange_rate' hint='initial value for the exchange_rate property' type='string' required='no' default='' />
		<cfargument name='mc_currency' displayname='string mc_currency' hint='initial value for the mc_currency property' type='string' required='no' default='' />
		<cfargument name='mc_fee' displayname='string mc_fee' hint='initial value for the mc_fee property' type='string' required='no' default='' />
		<cfargument name='mc_gross' displayname='string mc_gross' hint='initial value for the mc_gross property' type='string' required='no' default='' />
		<cfargument name='payment_fee' displayname='string payment_fee' hint='initial value for the payment_fee property' type='string' required='no' default='' />
		<cfargument name='payment_gross' displayname='string payment_gross' hint='initial value for the payment_gross property' type='string' required='no' default='' />
		<cfargument name='settle_amount' displayname='string settle_amount' hint='initial value for the settle_amount property' type='string' required='no' default='' />
		<cfargument name='settle_currency' displayname='string settle_currency' hint='initial value for the settle_currency property' type='string' required='no' default='' />
		<cfscript>
			variables.instance = structNew();
			variables.instance.exchange_rate = arguments.exchange_rate;	//
			variables.instance.mc_currency = arguments.mc_currency;	//
			variables.instance.mc_fee = arguments.mc_fee;		//
			variables.instance.mc_gross = arguments.mc_gross;	//
			variables.instance.payment_fee = arguments.payment_fee;	//
			variables.instance.payment_gross = arguments.payment_gross;	//
			variables.instance.settle_amount = arguments.settle_amount;	//
			variables.instance.settle_currency = arguments.settle_currency;
		</cfscript>
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getDataForSQL">
		<cfscript>
			retData = StructNew();
			if (getExchange_rate() NEQ "") 		StructInsert(retData, "exchange_rate", getExchange_rate());
			if (getMc_currency() NEQ "") 		StructInsert(retData, "mc_currency", "'#getMc_currency()#'");
			if (getMc_fee() NEQ "") 			StructInsert(retData, "mc_fee", getMc_fee());
			if (getMc_gross() NEQ "") 			StructInsert(retData, "mc_gross", getMc_gross());
			if (getPayment_fee() NEQ "") 		StructInsert(retData, "payment_fee", getPayment_fee());
			if (getPayment_gross() NEQ "") 		StructInsert(retData, "payment_gross", getPayment_gross());
			if (getSettle_amount() NEQ "") 		StructInsert(retData, "settle_amount", getSettle_amount());
			if (getSettle_currency() NEQ "") 	StructInsert(retData, "settle_currency", "'#getSettle_currency()#'");
			return retData;
		</cfscript>
	</cffunction>
	

	<!--- standard getter/setter methods --->
	<cffunction name='getExchange_rate' displayname='string getExchange_rate()' hint='get the value of the exchange_rate property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.exchange_rate />
	</cffunction>
	<cffunction name='setExchange_rate' displayname='setExchange_rate(string newExchange_rate)' hint='set the value of the exchange_rate property' access='public' output='false' returntype='string'>
		<cfargument name='newExchange_rate' displayname='string newExchange_rate' hint='new value for the exchange_rate property' type='string' required='yes' />
		<cfset variables.instance.exchange_rate = arguments.newExchange_rate />
	</cffunction>

	<cffunction name='getMc_currency' displayname='string getMc_currency()' hint='get the value of the mc_currency property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.mc_currency />
	</cffunction>
	<cffunction name='setMc_currency' displayname='setMc_currency(string newMc_currency)' hint='set the value of the mc_currency property' access='public' output='false' returntype='string'>
		<cfargument name='newMc_currency' displayname='string newMc_currency' hint='new value for the mc_currency property' type='string' required='yes' />
		<cfset variables.instance.mc_currency = arguments.newMc_currency />
	</cffunction>

	<cffunction name='getMc_fee' displayname='string getMc_fee()' hint='get the value of the mc_fee property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.mc_fee />
	</cffunction>
	<cffunction name='setMc_fee' displayname='setMc_fee(string newMc_fee)' hint='set the value of the mc_fee property' access='public' output='false' returntype='string'>
		<cfargument name='newMc_fee' displayname='string newMc_fee' hint='new value for the mc_fee property' type='string' required='yes' />
		<cfset variables.instance.mc_fee = arguments.newMc_fee />
	</cffunction>

	<cffunction name='getMc_gross' displayname='string getMc_gross()' hint='get the value of the mc_gross property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.mc_gross />
	</cffunction>
	<cffunction name='setMc_gross' displayname='setMc_gross(string newMc_gross)' hint='set the value of the mc_gross property' access='public' output='false' returntype='string'>
		<cfargument name='newMc_gross' displayname='string newMc_gross' hint='new value for the mc_gross property' type='string' required='yes' />
		<cfset variables.instance.mc_gross = arguments.newMc_gross />
	</cffunction>

	<cffunction name='getPayment_fee' displayname='string getPayment_fee()' hint='get the value of the payment_fee property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.payment_fee />
	</cffunction>
	<cffunction name='setPayment_fee' displayname='setPayment_fee(string newPayment_fee)' hint='set the value of the payment_fee property' access='public' output='false' returntype='string'>
		<cfargument name='newPayment_fee' displayname='string newPayment_fee' hint='new value for the payment_fee property' type='string' required='yes' />
		<cfset variables.instance.payment_fee = arguments.newPayment_fee />
	</cffunction>

	<cffunction name='getPayment_gross' displayname='string getPayment_gross()' hint='get the value of the payment_gross property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.payment_gross />
	</cffunction>
	<cffunction name='setPayment_gross' displayname='setPayment_gross(string newPayment_gross)' hint='set the value of the payment_gross property' access='public' output='false' returntype='string'>
		<cfargument name='newPayment_gross' displayname='string newPayment_gross' hint='new value for the payment_gross property' type='string' required='yes' />
		<cfset variables.instance.payment_gross = arguments.newPayment_gross />
	</cffunction>

	<cffunction name='getSettle_amount' displayname='string getSettle_amount()' hint='get the value of the settle_amount property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.settle_amount />
	</cffunction>
	<cffunction name='setSettle_amount' displayname='setSettle_amount(string newSettle_amount)' hint='set the value of the settle_amount property' access='public' output='false' returntype='string'>
		<cfargument name='newSettle_amount' displayname='string newSettle_amount' hint='new value for the settle_amount property' type='string' required='yes' />
		<cfset variables.instance.settle_amount = arguments.newSettle_amount />
	</cffunction>

	<cffunction name='getSettle_currency' displayname='string getSettle_currency()' hint='get the value of the settle_currency property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.settle_currency />
	</cffunction>
	<cffunction name='setSettle_currency' displayname='setSettle_currency(string newSettle_currency)' hint='set the value of the settle_currency property' access='public' output='false' returntype='string'>
		<cfargument name='newSettle_currency' displayname='string newSettle_currency' hint='new value for the settle_currency property' type='string' required='yes' />
		<cfset variables.instance.settle_currency = arguments.newSettle_currency />
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