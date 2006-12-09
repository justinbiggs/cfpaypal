<!--- created by Bean Maker v0.1 --->

<cfcomponent displayname='SubscriptionInfoBean' hint='SubscriptionInfoBean CFC Bean' extends="BaseDataObject">
	<!--- init method --->
	<cffunction name='init' displayname='SubscriptionInfoBean init()' hint='initialze the bean' access='public' returntype='SubscriptionInfoBean' output='false'>
		<cfargument name='subscr_date' displayname='string subscr_date' hint='initial value for the subscr_date property' type='string' required='no' default='' />
		<cfargument name='subscr_effective' displayname='string subscr_effective' hint='initial value for the subscr_effective property' type='string' required='no' default='' />
		<cfargument name='period1' displayname='string period1' hint='initial value for the period1 property' type='string' required='no' default='' />
		<cfargument name='period2' displayname='string period2' hint='initial value for the period2 property' type='string' required='no' default='' />
		<cfargument name='period3' displayname='string period3' hint='initial value for the period3 property' type='string' required='no' default='' />
		<cfargument name='amount1' displayname='string amount1' hint='initial value for the amount1 property' type='string' required='no' default='' />
		<cfargument name='amount2' displayname='string amount2' hint='initial value for the amount2 property' type='string' required='no' default='' />
		<cfargument name='amount3' displayname='string amount3' hint='initial value for the amount3 property' type='string' required='no' default='' />
		<cfargument name='mc_amount1' displayname='string mc_amount1' hint='initial value for the mc_amount1 property' type='string' required='no' default='' />
		<cfargument name='mc_amount2' displayname='string mc_amount2' hint='initial value for the mc_amount2 property' type='string' required='no' default='' />
		<cfargument name='mc_amount3' displayname='string mc_amount3' hint='initial value for the mc_amount3 property' type='string' required='no' default='' />
		<cfargument name='recurring' displayname='string recurring' hint='initial value for the recurring property' type='string' required='no' default='' />
		<cfargument name='reattempt' displayname='string reattempt' hint='initial value for the reattempt property' type='string' required='no' default='' />
		<cfargument name='retry_at' displayname='string retry_at' hint='initial value for the retry_at property' type='string' required='no' default='' />
		<cfargument name='recur_times' displayname='string recur_times' hint='initial value for the recur_times property' type='string' required='no' default='' />
		<cfargument name='username' displayname='string username' hint='initial value for the username property' type='string' required='no' default='' />
		<cfargument name='password' displayname='string password' hint='initial value for the password property' type='string' required='no' default='' />
		<cfargument name='subscr_id' displayname='string subscr_id' hint='initial value for the subscr_id property' type='string' required='no' default='' />
		<cfscript>
			variables.instance = structNew();
			variables.instance.subscr_date = arguments.subscr_date;
			variables.instance.subscr_effective = arguments.subscr_effective;
			variables.instance.period1 = arguments.period1;
			variables.instance.period2 = arguments.period2;
			variables.instance.period3 = arguments.period3;
			variables.instance.amount1 = arguments.amount1;
			variables.instance.amount2 = arguments.amount2;
			variables.instance.amount3 = arguments.amount3;
			variables.instance.mc_amount1 = arguments.mc_amount1;
			variables.instance.mc_amount2 = arguments.mc_amount2;
			variables.instance.mc_amount3 = arguments.mc_amount3;
			variables.instance.recurring = arguments.recurring;
			variables.instance.reattempt = arguments.reattempt;
			variables.instance.retry_at = arguments.retry_at;
			variables.instance.recur_times = arguments.recur_times;
			variables.instance.username = arguments.username;
			variables.instance.password = arguments.password;
			variables.instance.subscr_id = arguments.subscr_id;
		</cfscript>
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getDataForSQL">
		<cfscript>
			retData = StructNew();
			if (getSubscr_date() NEQ "") 		StructInsert(retData, "subscr_date", "'#getSubscr_date()#'");
			if (getSubscr_effective() NEQ "") 	StructInsert(retData, "subscr_effective", "'#getSubscr_effective()#'");
			if (getPeriod1() NEQ "") 			StructInsert(retData, "period1", "'#getPeriod1()#'");
			if (getPeriod2() NEQ "") 			StructInsert(retData, "period2", "'#getPeriod2()#'");
			if (getPeriod3() NEQ "") 			StructInsert(retData, "period3", "'#getPeriod3()#'");
			if (getAmount1() NEQ "") 			StructInsert(retData, "amount1", getAmount1());
			if (getAmount2() NEQ "") 			StructInsert(retData, "amount2", getAmount2());
			if (getAmount3() NEQ "") 			StructInsert(retData, "amount3", getAmount3());
			if (getMc_amount1() NEQ "") 		StructInsert(retData, "mc_amount1", getMc_amount1());
			if (getMc_amount2() NEQ "") 		StructInsert(retData, "mc_amount2", getMc_amount2());
			if (getMc_amount3() NEQ "") 		StructInsert(retData, "mc_amount3", getMc_amount3());
			if (getRecurring() NEQ "") 			StructInsert(retData, "recurring", "'#getRecurring()#'");
			if (getReattempt() NEQ "") 			StructInsert(retData, "reattempt", "'#getReattempt()#'");
			if (getRetry_at() NEQ "") 			StructInsert(retData, "retry_at", "'#getRetry_at()#'");
			if (getRecur_times() NEQ "") 		StructInsert(retData, "recur_times", "'#getRecur_times()#'");
			if (getUsername() NEQ "") 			StructInsert(retData, "username", "'#getUsername()#'");
			if (getPassword() NEQ "") 			StructInsert(retData, "password", "'#getPassword()#'");
			if (getSubscr_id() NEQ "") 			StructInsert(retData, "subscr_id", "'#getSubscr_id()#'");
			return retData;
		</cfscript>
	</cffunction>
	

	<!--- standard getter/setter methods --->
	<cffunction name='getSubscr_date' displayname='string getSubscr_date()' hint='get the value of the subscr_date property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.subscr_date />
	</cffunction>
	<cffunction name='setSubscr_date' displayname='setSubscr_date(string newSubscr_date)' hint='set the value of the subscr_date property' access='public' output='false' returntype='string'>
		<cfargument name='newSubscr_date' displayname='string newSubscr_date' hint='new value for the subscr_date property' type='string' required='yes' />
		<cfset variables.instance.subscr_date = arguments.newSubscr_date />
	</cffunction>

	<cffunction name='getSubscr_effective' displayname='string getSubscr_effective()' hint='get the value of the subscr_effective property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.subscr_effective />
	</cffunction>
	<cffunction name='setSubscr_effective' displayname='setSubscr_effective(string newSubscr_effective)' hint='set the value of the subscr_effective property' access='public' output='false' returntype='string'>
		<cfargument name='newSubscr_effective' displayname='string newSubscr_effective' hint='new value for the subscr_effective property' type='string' required='yes' />
		<cfset variables.instance.subscr_effective = arguments.newSubscr_effective />
	</cffunction>

	<cffunction name='getPeriod1' displayname='string getPeriod1()' hint='get the value of the period1 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.period1 />
	</cffunction>
	<cffunction name='setPeriod1' displayname='setPeriod1(string newPeriod1)' hint='set the value of the period1 property' access='public' output='false' returntype='string'>
		<cfargument name='newPeriod1' displayname='string newPeriod1' hint='new value for the period1 property' type='string' required='yes' />
		<cfset variables.instance.period1 = arguments.newPeriod1 />
	</cffunction>

	<cffunction name='getPeriod2' displayname='string getPeriod2()' hint='get the value of the period2 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.period2 />
	</cffunction>
	<cffunction name='setPeriod2' displayname='setPeriod2(string newPeriod2)' hint='set the value of the period2 property' access='public' output='false' returntype='string'>
		<cfargument name='newPeriod2' displayname='string newPeriod2' hint='new value for the period2 property' type='string' required='yes' />
		<cfset variables.instance.period2 = arguments.newPeriod2 />
	</cffunction>

	<cffunction name='getPeriod3' displayname='string getPeriod3()' hint='get the value of the period3 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.period3 />
	</cffunction>
	<cffunction name='setPeriod3' displayname='setPeriod3(string newPeriod3)' hint='set the value of the period3 property' access='public' output='false' returntype='string'>
		<cfargument name='newPeriod3' displayname='string newPeriod3' hint='new value for the period3 property' type='string' required='yes' />
		<cfset variables.instance.period3 = arguments.newPeriod3 />
	</cffunction>

	<cffunction name='getAmount1' displayname='string getAmount1()' hint='get the value of the amount1 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.amount1 />
	</cffunction>
	<cffunction name='setAmount1' displayname='setAmount1(string newAmount1)' hint='set the value of the amount1 property' access='public' output='false' returntype='string'>
		<cfargument name='newAmount1' displayname='string newAmount1' hint='new value for the amount1 property' type='string' required='yes' />
		<cfset variables.instance.amount1 = arguments.newAmount1 />
	</cffunction>

	<cffunction name='getAmount2' displayname='string getAmount2()' hint='get the value of the amount2 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.amount2 />
	</cffunction>
	<cffunction name='setAmount2' displayname='setAmount2(string newAmount2)' hint='set the value of the amount2 property' access='public' output='false' returntype='string'>
		<cfargument name='newAmount2' displayname='string newAmount2' hint='new value for the amount2 property' type='string' required='yes' />
		<cfset variables.instance.amount2 = arguments.newAmount2 />
	</cffunction>

	<cffunction name='getAmount3' displayname='string getAmount3()' hint='get the value of the amount3 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.amount3 />
	</cffunction>
	<cffunction name='setAmount3' displayname='setAmount3(string newAmount3)' hint='set the value of the amount3 property' access='public' output='false' returntype='string'>
		<cfargument name='newAmount3' displayname='string newAmount3' hint='new value for the amount3 property' type='string' required='yes' />
		<cfset variables.instance.amount3 = arguments.newAmount3 />
	</cffunction>

	<cffunction name='getMc_amount1' displayname='string getMc_amount1()' hint='get the value of the mc_amount1 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.mc_amount1 />
	</cffunction>
	<cffunction name='setMc_amount1' displayname='setMc_amount1(string newMc_amount1)' hint='set the value of the mc_amount1 property' access='public' output='false' returntype='string'>
		<cfargument name='newMc_amount1' displayname='string newMc_amount1' hint='new value for the mc_amount1 property' type='string' required='yes' />
		<cfset variables.instance.mc_amount1 = arguments.newMc_amount1 />
	</cffunction>

	<cffunction name='getMc_amount2' displayname='string getMc_amount2()' hint='get the value of the mc_amount2 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.mc_amount2 />
	</cffunction>
	<cffunction name='setMc_amount2' displayname='setMc_amount2(string newMc_amount2)' hint='set the value of the mc_amount2 property' access='public' output='false' returntype='string'>
		<cfargument name='newMc_amount2' displayname='string newMc_amount2' hint='new value for the mc_amount2 property' type='string' required='yes' />
		<cfset variables.instance.mc_amount2 = arguments.newMc_amount2 />
	</cffunction>

	<cffunction name='getMc_amount3' displayname='string getMc_amount3()' hint='get the value of the mc_amount3 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.mc_amount3 />
	</cffunction>
	<cffunction name='setMc_amount3' displayname='setMc_amount3(string newMc_amount3)' hint='set the value of the mc_amount3 property' access='public' output='false' returntype='string'>
		<cfargument name='newMc_amount3' displayname='string newMc_amount3' hint='new value for the mc_amount3 property' type='string' required='yes' />
		<cfset variables.instance.mc_amount3 = arguments.newMc_amount3 />
	</cffunction>

	<cffunction name='getRecurring' displayname='string getRecurring()' hint='get the value of the recurring property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.recurring />
	</cffunction>
	<cffunction name='setRecurring' displayname='setRecurring(string newRecurring)' hint='set the value of the recurring property' access='public' output='false' returntype='string'>
		<cfargument name='newRecurring' displayname='string newRecurring' hint='new value for the recurring property' type='string' required='yes' />
		<cfset variables.instance.recurring = arguments.newRecurring />
	</cffunction>

	<cffunction name='getReattempt' displayname='string getReattempt()' hint='get the value of the reattempt property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.reattempt />
	</cffunction>
	<cffunction name='setReattempt' displayname='setReattempt(string newReattempt)' hint='set the value of the reattempt property' access='public' output='false' returntype='string'>
		<cfargument name='newReattempt' displayname='string newReattempt' hint='new value for the reattempt property' type='string' required='yes' />
		<cfset variables.instance.reattempt = arguments.newReattempt />
	</cffunction>

	<cffunction name='getRetry_at' displayname='string getRetry_at()' hint='get the value of the retry_at property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.retry_at />
	</cffunction>
	<cffunction name='setRetry_at' displayname='setRetry_at(string newRetry_at)' hint='set the value of the retry_at property' access='public' output='false' returntype='string'>
		<cfargument name='newRetry_at' displayname='string newRetry_at' hint='new value for the retry_at property' type='string' required='yes' />
		<cfset variables.instance.retry_at = arguments.newRetry_at />
	</cffunction>

	<cffunction name='getRecur_times' displayname='string getRecur_times()' hint='get the value of the recur_times property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.recur_times />
	</cffunction>
	<cffunction name='setRecur_times' displayname='setRecur_times(string newRecur_times)' hint='set the value of the recur_times property' access='public' output='false' returntype='string'>
		<cfargument name='newRecur_times' displayname='string newRecur_times' hint='new value for the recur_times property' type='string' required='yes' />
		<cfset variables.instance.recur_times = arguments.newRecur_times />
	</cffunction>

	<cffunction name='getUsername' displayname='string getUsername()' hint='get the value of the username property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.username />
	</cffunction>
	<cffunction name='setUsername' displayname='setUsername(string newUsername)' hint='set the value of the username property' access='public' output='false' returntype='string'>
		<cfargument name='newUsername' displayname='string newUsername' hint='new value for the username property' type='string' required='yes' />
		<cfset variables.instance.username = arguments.newUsername />
	</cffunction>

	<cffunction name='getPassword' displayname='string getPassword()' hint='get the value of the password property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.password />
	</cffunction>
	<cffunction name='setPassword' displayname='setPassword(string newPassword)' hint='set the value of the password property' access='public' output='false' returntype='string'>
		<cfargument name='newPassword' displayname='string newPassword' hint='new value for the password property' type='string' required='yes' />
		<cfset variables.instance.password = arguments.newPassword />
	</cffunction>

	<cffunction name='getSubscr_id' displayname='string getSubscr_id()' hint='get the value of the subscr_id property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.subscr_id />
	</cffunction>
	<cffunction name='setSubscr_id' displayname='setSubscr_id(string newSubscr_id)' hint='set the value of the subscr_id property' access='public' output='false' returntype='string'>
		<cfargument name='newSubscr_id' displayname='string newSubscr_id' hint='new value for the subscr_id property' type='string' required='yes' />
		<cfset variables.instance.subscr_id = arguments.newSubscr_id />
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