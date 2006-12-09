<cfcomponent displayname='PaypalCustomerDataPassBean' hint='PaypalCustomerDataPassBean CFC Bean' extends="BaseButtonObject">
	<cfscript>
		variables.instance = structNew();
		variables.instance.email = "";
		variables.instance.first_name = "";
		variables.instance.last_name = "";
		variables.instance.address1 = "";
		variables.instance.address2 = "";
		variables.instance.city = "";
		variables.instance.state = "";
		variables.instance.zip = "";
		variables.instance.night_phone_a = "";
		variables.instance.night_phone_b = "";
		variables.instance.day_phone_a = "";
		variables.instance.day_phone_b = "";
	</cfscript>

	<!--- init method --->
	<cffunction name='init' displayname='PaypalCustomerDataPassBean init()' hint='initialze the bean' access='public' returntype='PaypalCustomerDataPassBean' output='false'>
		<cfreturn this />
	</cffunction>

	<!--- standard getter/setter methods --->
	<cffunction name='getEmail' displayname='string getEmail()' hint='get the value of the email property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.email />
	</cffunction>
	<cffunction name='setEmail' displayname='setEmail(string newEmail)' hint='set the value of the email property' access='public' output='false' returntype='string'>
		<cfargument name='newEmail' displayname='string newEmail' hint='new value for the email property' type='string' required='yes' />
		<cfset variables.instance.email = arguments.newEmail />
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

	<cffunction name='getAddress1' displayname='string getAddress1()' hint='get the value of the address1 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.address1 />
	</cffunction>
	<cffunction name='setAddress1' displayname='setAddress1(string newAddress1)' hint='set the value of the address1 property' access='public' output='false' returntype='string'>
		<cfargument name='newAddress1' displayname='string newAddress1' hint='new value for the address1 property' type='string' required='yes' />
		<cfset variables.instance.address1 = arguments.newAddress1 />
	</cffunction>

	<cffunction name='getAddress2' displayname='string getAddress2()' hint='get the value of the address2 property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.address2 />
	</cffunction>
	<cffunction name='setAddress2' displayname='setAddress2(string newAddress2)' hint='set the value of the address2 property' access='public' output='false' returntype='string'>
		<cfargument name='newAddress2' displayname='string newAddress2' hint='new value for the address2 property' type='string' required='yes' />
		<cfset variables.instance.address2 = arguments.newAddress2 />
	</cffunction>

	<cffunction name='getCity' displayname='string getCity()' hint='get the value of the city property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.city />
	</cffunction>
	<cffunction name='setCity' displayname='setCity(string newCity)' hint='set the value of the city property' access='public' output='false' returntype='string'>
		<cfargument name='newCity' displayname='string newCity' hint='new value for the city property' type='string' required='yes' />
		<cfset variables.instance.city = arguments.newCity />
	</cffunction>

	<cffunction name='getState' displayname='string getState()' hint='get the value of the state property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.state />
	</cffunction>
	<cffunction name='setState' displayname='setState(string newState)' hint='set the value of the state property' access='public' output='false' returntype='string'>
		<cfargument name='newState' displayname='string newState' hint='new value for the state property' type='string' required='yes' />
		<cfset variables.instance.state = arguments.newState />
	</cffunction>

	<cffunction name='getZip' displayname='string getZip()' hint='get the value of the zip property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.zip />
	</cffunction>
	<cffunction name='setZip' displayname='setZip(string newZip)' hint='set the value of the zip property' access='public' output='false' returntype='string'>
		<cfargument name='newZip' displayname='string newZip' hint='new value for the zip property' type='string' required='yes' />
		<cfset variables.instance.zip = arguments.newZip />
	</cffunction>

	<cffunction name='getNight_phone_a' displayname='string getNight_phone_a()' hint='get the value of the night_phone_a property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.night_phone_a />
	</cffunction>
	<cffunction name='setNight_phone_a' displayname='setNight_phone_a(string newNight_phone_a)' hint='set the value of the night_phone_a property' access='public' output='false' returntype='string'>
		<cfargument name='newNight_phone_a' displayname='string newNight_phone_a' hint='new value for the night_phone_a property' type='string' required='yes' />
		<cfset variables.instance.night_phone_a = arguments.newNight_phone_a />
	</cffunction>

	<cffunction name='getNight_phone_b' displayname='string getNight_phone_b()' hint='get the value of the night_phone_b property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.night_phone_b />
	</cffunction>
	<cffunction name='setNight_phone_b' displayname='setNight_phone_b(string newNight_phone_b)' hint='set the value of the night_phone_b property' access='public' output='false' returntype='string'>
		<cfargument name='newNight_phone_b' displayname='string newNight_phone_b' hint='new value for the night_phone_b property' type='string' required='yes' />
		<cfset variables.instance.night_phone_b = arguments.newNight_phone_b />
	</cffunction>

	<cffunction name='getDay_phone_a' displayname='string getDay_phone_a()' hint='get the value of the day_phone_a property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.day_phone_a />
	</cffunction>
	<cffunction name='setDay_phone_a' displayname='setDay_phone_a(string newDay_phone_a)' hint='set the value of the day_phone_a property' access='public' output='false' returntype='string'>
		<cfargument name='newDay_phone_a' displayname='string newDay_phone_a' hint='new value for the day_phone_a property' type='string' required='yes' />
		<cfset variables.instance.day_phone_a = arguments.newDay_phone_a />
	</cffunction>

	<cffunction name='getDay_phone_b' displayname='string getDay_phone_b()' hint='get the value of the day_phone_b property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.day_phone_b />
	</cffunction>
	<cffunction name='setDay_phone_b' displayname='setDay_phone_b(string newDay_phone_b)' hint='set the value of the day_phone_b property' access='public' output='false' returntype='string'>
		<cfargument name='newDay_phone_b' displayname='string newDay_phone_b' hint='new value for the day_phone_b property' type='string' required='yes' />
		<cfset variables.instance.day_phone_b = arguments.newDay_phone_b />
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

	<cffunction name="getCustomerInfoHTML" output="false">
		<cfargument name="singleLineHTML" type="boolean" default="false">
		<cfsavecontent variable="html">
			<cfoutput>
			<cfif getEmail() NEQ "">
				<input type="hidden" name="email" value="#getEmail()#">
			</cfif>
			<cfif getFirst_name() NEQ "">
				<input type="hidden" name="first_name" value="#getFirst_name()#">
			</cfif>
			<cfif getLast_name() NEQ "">
				<input type="hidden" name="last_name" value="#getLast_name()#">
			</cfif>
			<cfif getAddress1() NEQ "">
				<input type="hidden" name="address1" value="#getAddress1()#">
			</cfif>
			<cfif getAddress2() NEQ "">
				<input type="hidden" name="address2" value="#getAddress2()#">
			</cfif>
			<cfif getCity() NEQ "">
				<input type="hidden" name="city" value="#getCity()#">
			</cfif>
			<cfif getState() NEQ "">
				<input type="hidden" name="state" value="#getState()#">
			</cfif>
			<cfif getZip() NEQ "">
				<input type="hidden" name="zip" value="#getZip()#">
			</cfif>
			<cfif getNight_phone_a() NEQ "">
				<input type="hidden" name="night_phone_a" value="#getNight_phone_a()#">
			</cfif>
			<cfif getNight_phone_b() NEQ "">
				<input type="hidden" name="night_phone_b" value="#getNight_phone_b()#">
			</cfif>
			<cfif getDay_phone_a() NEQ "">
				<input type="hidden" name="day_phone_a" value="#getDay_phone_a()#">
			</cfif>
			<cfif getDay_phone_b() NEQ "">
				<input type="hidden" name="day_phone_b" value="#getDay_phone_b()#">
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

</cfcomponent>