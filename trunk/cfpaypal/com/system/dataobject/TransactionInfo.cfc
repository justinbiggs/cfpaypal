<cfcomponent displayname='TransactionInfoBean' hint='TransactionInfoBean CFC Bean' extends="BaseDataObject">
	<!--- init method --->
	<cffunction name='init' displayname='TransactionInfoBean init()' hint='initialze the bean' access='public' returntype='TransactionInfoBean' output='false'>
		<cfargument name='payment_type' displayname='string payment_type' hint='initial value for the payment_type property' type='string' required='no' default='' />
		<cfargument name='payment_status' displayname='string payment_status' hint='initial value for the payment_status property' type='string' required='no' default='' />
		<cfargument name='pending_reason' displayname='string pending_reason' hint='initial value for the pending_reason property' type='string' required='no' default='' />
		<cfargument name='reason_code' displayname='string reason_code' hint='initial value for the reason_code property' type='string' required='no' default='' />
		<cfargument name='payment_date' displayname='string payment_date' hint='initial value for the payment_date property' type='string' required='no' default='' />
		<cfargument name='txn_id' displayname='string txn_id' hint='initial value for the txn_id property' type='string' required='no' default='' />
		<cfargument name='parent_txn_id' displayname='string parent_txn_id' hint='initial value for the parent_txn_id property' type='string' required='no' default='' />
		<cfargument name='txn_type' displayname='string txn_type' hint='initial value for the txn_type property' type='string' required='no' default='' />
		<cfargument name='tax' displayname='string tax' hint='initial value for the tax property' type='string' required='no' default='' />
		<cfargument name='shipping' displayname='string shipping' hint='initial value for the shipping property' type='string' required='no' default='' />
		<cfargument name='notify_version' displayname='string notify_version' hint='initial value for the notify_version property' type='string' required='no' default='' />
		<cfargument name='verify_sign' displayname='string verify_sign' hint='initial value for the verify_sign property' type='string' required='no' default='' />
		<cfscript>
			variables.instance = structNew();
			variables.instance.payment_type = arguments.payment_type;
			variables.instance.payment_status = arguments.payment_status;
			variables.instance.pending_reason = arguments.pending_reason;
			variables.instance.reason_code = arguments.reason_code;
			variables.instance.payment_date = arguments.payment_date;
			variables.instance.txn_id = arguments.txn_id;
			variables.instance.parent_txn_id = arguments.parent_txn_id;
			variables.instance.txn_type = arguments.txn_type;
			variables.instance.tax = arguments.tax;
			variables.instance.shipping = arguments.shipping;
			variables.instance.notify_version = arguments.notify_version;
			variables.instance.verify_sign = arguments.verify_sign;
		</cfscript>
		<cfreturn this />
	</cffunction>

	<cffunction name="getDataForSQL">
		<cfscript>
			retData = StructNew();
			if (getPayment_type() NEQ "") 		StructInsert(retData, "payment_type", "'#getPayment_type()#'");
			if (getPayment_status() NEQ "") 	StructInsert(retData, "payment_status", "'#getPayment_status()#'");
			if (getPending_reason() NEQ "") 	StructInsert(retData, "pending_reason", "'#getPending_reason()#'");
			if (getReason_code() NEQ "") 		StructInsert(retData, "reason_code", "'#getReason_code()#'");
			if (getPayment_date() NEQ "") 		StructInsert(retData, "payment_date", "'#getPayment_date()#'");
			if (getTxn_id() NEQ "") 			StructInsert(retData, "txn_id", "'#getTxn_id()#'");
			if (getParent_txn_id() NEQ "") 		StructInsert(retData, "parent_txn_id", "'#getParent_txn_id()#'");
			if (getTxn_type() NEQ "") 			StructInsert(retData, "txn_type", "'#getTxn_type()#'");
			if (getTax() NEQ "") 				StructInsert(retData, "tax", getTax());
			if (getShipping() NEQ "") 			StructInsert(retData, "shipping", getShipping());
			if (getNotify_version() NEQ "") 	StructInsert(retData, "notify_version", "'#getNotify_version()#'");
			if (getVerify_sign() NEQ "") 		StructInsert(retData, "verify_sign", "'#getVerify_sign()#'");
			return retData;
		</cfscript>
	</cffunction>

	<!--- standard getter/setter methods --->
	<cffunction name='getPayment_type' displayname='string getPayment_type()' hint='get the value of the payment_type property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.payment_type />
	</cffunction>
	<cffunction name='setPayment_type' displayname='setPayment_type(string newPayment_status)' hint='set the value of the payment_type property' access='public' output='false' returntype='string'>
		<cfargument name='newPayment_type' displayname='string newPayment_type' hint='new value for the payment_type property' type='string' required='yes' />
		<cfset variables.instance.payment_type = arguments.newPayment_type />
	</cffunction>
	
	<cffunction name='getPayment_status' displayname='string getPayment_status()' hint='get the value of the payment_status property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.payment_status />
	</cffunction>
	<cffunction name='setPayment_status' displayname='setPayment_status(string newPayment_status)' hint='set the value of the payment_status property' access='public' output='false' returntype='string'>
		<cfargument name='newPayment_status' displayname='string newPayment_status' hint='new value for the payment_status property' type='string' required='yes' />
		<cfset variables.instance.payment_status = arguments.newPayment_status />
	</cffunction>

	<cffunction name='getPending_reason' displayname='string getPending_reason()' hint='get the value of the pending_reason property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.pending_reason />
	</cffunction>
	<cffunction name='setPending_reason' displayname='setPending_reason(string newPending_reason)' hint='set the value of the pending_reason property' access='public' output='false' returntype='string'>
		<cfargument name='newPending_reason' displayname='string newPending_reason' hint='new value for the pending_reason property' type='string' required='yes' />
		<cfset variables.instance.pending_reason = arguments.newPending_reason />
	</cffunction>

	<cffunction name='getReason_code' displayname='string getReason_code()' hint='get the value of the reason_code property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.reason_code />
	</cffunction>
	<cffunction name='setReason_code' displayname='setReason_code(string newReason_code)' hint='set the value of the reason_code property' access='public' output='false' returntype='string'>
		<cfargument name='newReason_code' displayname='string newReason_code' hint='new value for the reason_code property' type='string' required='yes' />
		<cfset variables.instance.reason_code = arguments.newReason_code />
	</cffunction>

	<cffunction name='getPayment_date' displayname='string getPayment_date()' hint='get the value of the payment_date property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.payment_date />
	</cffunction>
	<cffunction name='setPayment_date' displayname='setPayment_date(string newPayment_date)' hint='set the value of the payment_date property' access='public' output='false' returntype='string'>
		<cfargument name='newPayment_date' displayname='string newPayment_date' hint='new value for the payment_date property' type='string' required='yes' />
		<cfset variables.instance.payment_date = arguments.newPayment_date />
	</cffunction>

	<cffunction name='getTxn_id' displayname='string getTxn_id()' hint='get the value of the txn_id property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.txn_id />
	</cffunction>
	<cffunction name='setTxn_id' displayname='setTxn_id(string newTxn_id)' hint='set the value of the txn_id property' access='public' output='false' returntype='string'>
		<cfargument name='newTxn_id' displayname='string newTxn_id' hint='new value for the txn_id property' type='string' required='yes' />
		<cfset variables.instance.txn_id = arguments.newTxn_id />
	</cffunction>

	<cffunction name='getParent_txn_id' displayname='string getParent_txn_id()' hint='get the value of the parent_txn_id property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.parent_txn_id />
	</cffunction>
	<cffunction name='setParent_txn_id' displayname='setParent_txn_id(string newParent_txn_id)' hint='set the value of the parent_txn_id property' access='public' output='false' returntype='string'>
		<cfargument name='newParent_txn_id' displayname='string newParent_txn_id' hint='new value for the parent_txn_id property' type='string' required='yes' />
		<cfset variables.instance.parent_txn_id = arguments.newParent_txn_id />
	</cffunction>

	<cffunction name='getTxn_type' displayname='string getTxn_type()' hint='get the value of the txn_type property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.txn_type />
	</cffunction>
	<cffunction name='setTxn_type' displayname='setTxn_type(string newTxn_type)' hint='set the value of the txn_type property' access='public' output='false' returntype='string'>
		<cfargument name='newTxn_type' displayname='string newTxn_type' hint='new value for the txn_type property' type='string' required='yes' />
		<cfset variables.instance.txn_type = arguments.newTxn_type />
	</cffunction>

	<cffunction name='getTax' displayname='string getTax()' hint='get the value of the tax property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.tax />
	</cffunction>
	<cffunction name='setTax' displayname='setTax(string newTax)' hint='set the value of the tax property' access='public' output='false' returntype='string'>
		<cfargument name='newTax' displayname='string newTax' hint='new value for the tax property' type='string' required='yes' />
		<cfset variables.instance.tax = arguments.newTax />
	</cffunction>

	<cffunction name='getShipping' displayname='string getShipping()' hint='get the value of the shipping property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.shipping />
	</cffunction>
	<cffunction name='setShipping' displayname='setShipping(string newShipping)' hint='set the value of the shipping property' access='public' output='false' returntype='string'>
		<cfargument name='newShipping' displayname='string newShipping' hint='new value for the shipping property' type='string' required='yes' />
		<cfset variables.instance.shipping = arguments.newShipping />
	</cffunction>

	<cffunction name='getNotify_version' displayname='string getNotify_version()' hint='get the value of the notify_version property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.notify_version />
	</cffunction>
	<cffunction name='setNotify_version' displayname='setNotify_version(string newNotify_version)' hint='set the value of the notify_version property' access='public' output='false' returntype='string'>
		<cfargument name='newNotify_version' displayname='string newNotify_version' hint='new value for the notify_version property' type='string' required='yes' />
		<cfset variables.instance.notify_version = arguments.newNotify_version />
	</cffunction>

	<cffunction name='getVerify_sign' displayname='string getVerify_sign()' hint='get the value of the verify_sign property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.verify_sign />
	</cffunction>
	<cffunction name='setVerify_sign' displayname='setVerify_sign(string newVerify_sign)' hint='set the value of the verify_sign property' access='public' output='false' returntype='string'>
		<cfargument name='newVerify_sign' displayname='string newVerify_sign' hint='new value for the verify_sign property' type='string' required='yes' />
		<cfset variables.instance.verify_sign = arguments.newVerify_sign />
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