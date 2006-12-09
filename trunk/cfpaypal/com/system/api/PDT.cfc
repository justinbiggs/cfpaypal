<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>
</head>

<body>
</body>
</html>


		<!--- url struct to list --->
		<cfloop collection="#url#" item="key">
			<cfif len(urlData) GT 0>
				<cfset urlData = urlData & "&">
			</cfif>
		   <cfset urlData = urlData & "#KEY#=#url[key]#">
		</cfloop>

