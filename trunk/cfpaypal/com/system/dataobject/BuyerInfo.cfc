<cfcomponent displayname='BuyerInformationBean' hint='BuyerInformationBean CFC Bean' extends="BaseDataObject">
	<!--- init method --->
	<cffunction name='init' displayname='BuyerInformationBean init()' hint='initialze the bean' access='public' returntype='BuyerInformationBean' output='false'>
		<cfargument name='address_city' displayname='string address_city' hint='initial value for the address_city property' type='string' required='no' default='' />
		<cfargument name='address_country' displayname='string address_country' hint='initial value for the address_country property' type='string' required='no' default='' />
		<cfargument name='address_country_code' displayname='string address_country_code' hint='initial value for the address_country_code property' type='string' required='no' default='' />
		<cfargument name='address_name' displayname='string address_name' hint='initial value for the address_name property' type='string' required='no' default='' />
		<cfargument name='address_state' displayname='string address_state' hint='initial value for the address_state property' type='string' required='no' default='' />
		<cfargument name='address_status' displayname='string address_status' hint='initial value for the address_status property' type='string' required='no' default='' />
		<cfargument name='address_street' displayname='string address_street' hint='initial value for the address_street property' type='string' required='no' default='' />
		<cfargument name='address_zip' displayname='string address_zip' hint='initial value for the address_zip property' type='string' required='no' default='' />
		<cfargument name='first_name' displayname='string first_name' hint='initial value for the first_name property' type='string' required='no' default='' />
		<cfargument name='last_name' displayname='string last_name' hint='initial value for the last_name property' type='string' required='no' default='' />
		<cfargument name='payer_business_name' displayname='string payer_business_name' hint='initial value for the payer_business_name property' type='string' required='no' default='' />
		<cfargument name='payer_email' displayname='string payer_email' hint='initial value for the payer_email property' type='string' required='no' default='' />
		<cfargument name='payer_id' displayname='string payer_id' hint='initial value for the payer_id property' type='string' required='no' default='' />
		<cfargument name='payer_status' displayname='string payer_status' hint='initial value for the payer_status property' type='string' required='no' default='' />
		<cfargument name='residence_country' displayname='string residence_country' hint='initial value for the residence_country property' type='string' required='no' default='' />
		<cfscript>
			variables.instance = structNew();
			variables.instance.address_city = arguments.address_city;
			variables.instance.address_country = arguments.address_country;
			variables.instance.address_country_code = arguments.address_country_code;
			variables.instance.address_name = arguments.address_name;
			variables.instance.address_state = arguments.address_state;
			variables.instance.address_status = arguments.address_status;
			variables.instance.address_street = arguments.address_street;
			variables.instance.address_zip = arguments.address_zip;
			variables.instance.first_name = arguments.first_name;
			variables.instance.last_name = arguments.last_name;
			variables.instance.payer_business_name = arguments.payer_business_name;
			variables.instance.payer_email = arguments.payer_email;
			variables.instance.payer_id = arguments.payer_id;
			variables.instance.payer_status = arguments.payer_status;
			variables.instance.residence_country = arguments.residence_country;
		</cfscript>
		<cfreturn this />
	</cffunction>

	<cffunction name="getDataForSQL">
		<cfscript>
			retData = StructNew();
			if (getAddress_city() NEQ "") 			StructInsert(retData, "address_city", "'#getAddress_city()#'");
			if (getAddress_country() NEQ "") 		StructInsert(retData, "address_country", "'#getAddress_country()#'");
			if (getAddress_country_code() NEQ "") 	StructInsert(retData, "address_country_code", "'#getAddress_country_code()#'");
			if (getAddress_name() NEQ "") 			StructInsert(retData, "address_name", "'#getAddress_name()#'");
			if (getAddress_state() NEQ "") 			StructInsert(retData, "address_state", "'#getAddress_state()#'");
			if (getAddress_status() NEQ "") 		StructInsert(retData, "address_status", "'#getAddress_status()#'");
			if (getAddress_street() NEQ "") 		StructInsert(retData, "address_street", "'#getAddress_street()#'");
			if (getAddress_zip() NEQ "") 			StructInsert(retData, "address_zip", "'#getAddress_zip()#'");
			if (getFirst_name() NEQ "") 			StructInsert(retData, "first_name", "'#getFirst_name()#'");
			if (getLast_name() NEQ "") 				StructInsert(retData, "last_name", "'#getLast_name()#'");
			if (getPayer_business_name() NEQ "") 	StructInsert(retData, "payer_business_name", "'#getPayer_business_name()#'");
			if (getPayer_email() NEQ "") 			StructInsert(retData, "payer_email", "'#getPayer_email()#'");
			if (getPayer_id() NEQ "") 				StructInsert(retData, "payer_id", "'#getPayer_id()#'");
			if (getPayer_status() NEQ "") 			StructInsert(retData, "payer_status", "'#getPayer_status()#'");
			if (getResidence_country() NEQ "") 		StructInsert(retData, "residence_country", "'#getResidence_country()#'");
			return retData;
		</cfscript>
	</cffunction>

	<!--- standard getter/setter methods --->
	<cffunction name='getAddress_city' displayname='string getAddress_city()' hint='get the value of the address_city property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.address_city />
	</cffunction>
	<cffunction name='setAddress_city' displayname='setAddress_city(string newAddress_city)' hint='set the value of the address_city property' access='public' output='false' returntype='string'>
		<cfargument name='newAddress_city' displayname='string newAddress_city' hint='new value for the address_city property' type='string' required='yes' />
		<cfset variables.instance.address_city = arguments.newAddress_city />
	</cffunction>

	<cffunction name='getAddress_country' displayname='string getAddress_country()' hint='get the value of the address_country property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.address_country />
	</cffunction>
	<cffunction name='setAddress_country' displayname='setAddress_country(string newAddress_country)' hint='set the value of the address_country property' access='public' output='false' returntype='string'>
		<cfargument name='newAddress_country' displayname='string newAddress_country' hint='new value for the address_country property' type='string' required='yes' />
		<cfset variables.instance.address_country = arguments.newAddress_country />
	</cffunction>

	<cffunction name='getAddress_country_code' displayname='string getAddress_country_code()' hint='get the value of the address_country_code property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.address_country_code />
	</cffunction>
	<cffunction name='setAddress_country_code' displayname='setAddress_country_code(string newAddress_country_code)' hint='set the value of the address_country_code property' access='public' output='false' returntype='string'>
		<cfargument name='newAddress_country_code' displayname='string newAddress_country_code' hint='new value for the address_country_code property' type='string' required='yes' />
		<cfset variables.instance.address_country_code = arguments.newAddress_country_code />
	</cffunction>

	<cffunction name='getAddress_name' displayname='string getAddress_name()' hint='get the value of the address_name property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.address_name />
	</cffunction>
	<cffunction name='setAddress_name' displayname='setAddress_name(string newAddress_name)' hint='set the value of the address_name property' access='public' output='false' returntype='string'>
		<cfargument name='newAddress_name' displayname='string newAddress_name' hint='new value for the address_name property' type='string' required='yes' />
		<cfset variables.instance.address_name = arguments.newAddress_name />
	</cffunction>

	<cffunction name='getAddress_state' displayname='string getAddress_state()' hint='get the value of the address_state property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.address_state />
	</cffunction>
	<cffunction name='setAddress_state' displayname='setAddress_state(string newAddress_state)' hint='set the value of the address_state property' access='public' output='false' returntype='string'>
		<cfargument name='newAddress_state' displayname='string newAddress_state' hint='new value for the address_state property' type='string' required='yes' />
		<cfset variables.instance.address_state = arguments.newAddress_state />
	</cffunction>

	<cffunction name='getAddress_status' displayname='string getAddress_status()' hint='get the value of the address_status property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.address_status />
	</cffunction>
	<cffunction name='setAddress_status' displayname='setAddress_status(string newAddress_status)' hint='set the value of the address_status property' access='public' output='false' returntype='string'>
		<cfargument name='newAddress_status' displayname='string newAddress_status' hint='new value for the address_status property' type='string' required='yes' />
		<cfset variables.instance.address_status = arguments.newAddress_status />
	</cffunction>

	<cffunction name='getAddress_street' displayname='string getAddress_street()' hint='get the value of the address_street property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.address_street />
	</cffunction>
	<cffunction name='setAddress_street' displayname='setAddress_street(string newAddress_street)' hint='set the value of the address_street property' access='public' output='false' returntype='string'>
		<cfargument name='newAddress_street' displayname='string newAddress_street' hint='new value for the address_street property' type='string' required='yes' />
		<cfset variables.instance.address_street = arguments.newAddress_street />
	</cffunction>

	<cffunction name='getAddress_zip' displayname='string getAddress_zip()' hint='get the value of the address_zip property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.address_zip />
	</cffunction>
	<cffunction name='setAddress_zip' displayname='setAddress_zip(string newAddress_zip)' hint='set the value of the address_zip property' access='public' output='false' returntype='string'>
		<cfargument name='newAddress_zip' displayname='string newAddress_zip' hint='new value for the address_zip property' type='string' required='yes' />
		<cfset variables.instance.address_zip = arguments.newAddress_zip />
	</cffunction>

	<cffunction name='getFirst_name' displayname='string getFirst_name()' hint='get the value of the first_name property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.first_name />
	</cffunction>
	<cffunction name='setFirst_name' displayname='setFirst_name(string newFirst_name)' hint='set the value of the first_name property' access='public' output='false' returntype='string'>
		<cfargument name='newFirst_name' displayname='string newFirst_name' hint='new value for the first_name property' type='string' required='yes' />
		<cfset variables.instance.first_name = arguments.newFirst_name />
	</cffunction>

	<cffunction name='getLast_name' displayname='string getLast_name()' hint='get the value of the last_name property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.last_name />
	</cffunction>
	<cffunction name='setLast_name' displayname='setLast_name(string newLast_name)' hint='set the value of the last_name property' access='public' output='false' returntype='string'>
		<cfargument name='newLast_name' displayname='string newLast_name' hint='new value for the last_name property' type='string' required='yes' />
		<cfset variables.instance.last_name = arguments.newLast_name />
	</cffunction>

	<cffunction name='getPayer_business_name' displayname='string getPayer_business_name()' hint='get the value of the payer_business_name property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.payer_business_name />
	</cffunction>
	<cffunction name='setPayer_business_name' displayname='setPayer_business_name(string newPayer_business_name)' hint='set the value of the payer_business_name property' access='public' output='false' returntype='string'>
		<cfargument name='newPayer_business_name' displayname='string newPayer_business_name' hint='new value for the payer_business_name property' type='string' required='yes' />
		<cfset variables.instance.payer_business_name = arguments.newPayer_business_name />
	</cffunction>

	<cffunction name='getPayer_email' displayname='string getPayer_email()' hint='get the value of the payer_email property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.payer_email />
	</cffunction>
	<cffunction name='setPayer_email' displayname='setPayer_email(string newPayer_email)' hint='set the value of the payer_email property' access='public' output='false' returntype='string'>
		<cfargument name='newPayer_email' displayname='string newPayer_email' hint='new value for the payer_email property' type='string' required='yes' />
		<cfset variables.instance.payer_email = arguments.newPayer_email />
	</cffunction>

	<cffunction name='getPayer_id' displayname='string getPayer_id()' hint='get the value of the payer_id property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.payer_id />
	</cffunction>
	<cffunction name='setPayer_id' displayname='setPayer_id(string newPayer_id)' hint='set the value of the payer_id property' access='public' output='false' returntype='string'>
		<cfargument name='newPayer_id' displayname='string newPayer_id' hint='new value for the payer_id property' type='string' required='yes' />
		<cfset variables.instance.payer_id = arguments.newPayer_id />
	</cffunction>

	<cffunction name='getPayer_status' displayname='string getPayer_status()' hint='get the value of the payer_status property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.payer_status />
	</cffunction>
	<cffunction name='setPayer_status' displayname='setPayer_status(string newPayer_status)' hint='set the value of the payer_status property' access='public' output='false' returntype='string'>
		<cfargument name='newPayer_status' displayname='string newPayer_status' hint='new value for the payer_status property' type='string' required='yes' />
		<cfset variables.instance.payer_status = arguments.newPayer_status />
	</cffunction>

	<cffunction name='getResidence_country' displayname='string getResidence_country()' hint='get the value of the residence_country property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.residence_country />
	</cffunction>
	<cffunction name='setResidence_country' displayname='setResidence_country(string newResidence_country)' hint='set the value of the residence_country property' access='public' output='false' returntype='string'>
		<cfargument name='newResidence_country' displayname='string newResidence_country' hint='new value for the residence_country property' type='string' required='yes' />
		<cfset variables.instance.residence_country = arguments.newResidence_country />
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