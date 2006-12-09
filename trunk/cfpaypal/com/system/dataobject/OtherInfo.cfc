<!--- created by Bean Maker v0.1 --->

<cfcomponent displayname='OtherInfoBean' hint='OtherInfoBean CFC Bean' extends="BaseDataObject">
	<!--- init method --->
	<cffunction name='init' displayname='OtherInfoBean init()' hint='initialze the bean' access='public' returntype='OtherInfoBean' output='false'>
		<cfargument name='charset' displayname='string charset' hint='initial value for the charset property' type='string' required='no' default='' />
		<cfargument name='test_ipn' displayname='string test_ipn' hint='initial value for the test_ipn property' type='string' required='no' default='' />
		<cfscript>
			variables.instance = structNew();
			variables.instance.charset = arguments.charset;
			variables.instance.test_ipn = arguments.test_ipn;
		</cfscript>
		<cfreturn this />
	</cffunction>

	<cffunction name="getDataForSQL">
		<cfscript>
			retData = StructNew();
			if (getCharset() NEQ "") 		StructInsert(retData, "charset", "'#getCharset()#'");
			if (getTest_ipn() NEQ "") 		StructInsert(retData, "test_ipn", "'#getTest_ipn()#'");
			return retData;
		</cfscript>
	</cffunction>

	<!--- standard getter/setter methods --->
	<cffunction name='getCharset' displayname='string getCharset()' hint='get the value of the charset property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.charset />
	</cffunction>
	<cffunction name='setCharset' displayname='setCharset(string newCharset)' hint='set the value of the charset property' access='public' output='false' returntype='string'>
		<cfargument name='newCharset' displayname='string newCharset' hint='new value for the charset property' type='string' required='yes' />
		<cfset variables.instance.charset = arguments.newCharset />
	</cffunction>

	<cffunction name='getTest_ipn' displayname='string getTest_ipn()' hint='get the value of the test_ipn property' access='public' output='false' returntype='string'>
		<cfreturn variables.instance.test_ipn />
	</cffunction>
	<cffunction name='setTest_ipn' displayname='setTest_ipn(string newTest_ipn)' hint='set the value of the test_ipn property' access='public' output='false' returntype='string'>
		<cfargument name='newTest_ipn' displayname='string newTest_ipn' hint='new value for the test_ipn property' type='string' required='yes' />
		<cfset variables.instance.test_ipn = arguments.newTest_ipn />
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