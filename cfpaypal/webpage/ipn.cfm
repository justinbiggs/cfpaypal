<cfset dbRecorderPNEventListener = CreateObject("component","#request.comPath#.com.system.listener.DBRecorderPNEventListener")>

<cfset ipn = CreateObject("component","#Request.comPath#.com.system.api.IPN")>
<cfset ipn.addListener("default", dbRecorderPNEventListener)>
<cfset ipn.notificationRecieved()>