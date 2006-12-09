<cfoutput>
no trial
<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
<input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/x-click-but20.gif" border="0" name="submit" alt="Make payments with PayPal - it's fast, free and secure!">
<img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
<input type="hidden" name="cmd" value="_xclick-subscriptions">
<input type="hidden" name="business" value="#request.config.getValue('paypalbusinessemail')#">
<input type="hidden" name="item_name" value="Test One Subscription">
<input type="hidden" name="item_number" value="REF101">
<input type="hidden" name="no_shipping" value="1">
<input type="hidden" name="no_note" value="1">
<input type="hidden" name="currency_code" value="USD">
<input type="hidden" name="bn" value="PP-SubscriptionsBF">
<input type="hidden" name="a1" value="0.00">
<input type="hidden" name="p1" value="">
<input type="hidden" name="t1" value="">

<input type="hidden" name="a2" value="0.00">
<input type="hidden" name="p2" value="">
<input type="hidden" name="t2" value="">

<input type="hidden" name="a3" value="20.00">
<input type="hidden" name="p3" value="7">
<input type="hidden" name="t3" value="D">

<input type="hidden" name="src" value="1">
<input type="hidden" name="sra" value="1">
	<input type="hidden" name="custom" value="*NO TRIAL*">
	<input type="hidden" name="notify_url" value="#request.config.getValue('paypalnotifyurl')#">
	<input type="hidden" name="return" value="#request.config.getValue('paypalreturnurl')#">
	<input type="hidden" name="cancel_return" value="#request.config.getValue('paypalcancelurl')#">

</form>


<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
<input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/x-click-but20.gif" border="0" name="submit" alt="Make payments with PayPal - it's fast, free and secure!">
<img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
<input type="hidden" name="cmd" value="_xclick-subscriptions">
<input type="hidden" name="business" value="#request.config.getValue('paypalbusinessemail')#">
<input type="hidden" name="item_name" value="Test One Subscription">
<input type="hidden" name="item_number" value="REF101">
<input type="hidden" name="no_shipping" value="1">
<input type="hidden" name="no_note" value="1">
<input type="hidden" name="currency_code" value="USD">
<input type="hidden" name="bn" value="PP-SubscriptionsBF">
<input type="hidden" name="a1" value="0.00">
<input type="hidden" name="p1" value="1">
<input type="hidden" name="t1" value="D">
<input type="hidden" name="a2" value="5.00">
<input type="hidden" name="p2" value="1">
<input type="hidden" name="t2" value="D">
<input type="hidden" name="a3" value="20.00">
<input type="hidden" name="p3" value="1">
<input type="hidden" name="t3" value="M">
<input type="hidden" name="src" value="1">
<input type="hidden" name="sra" value="W">
		<input type="hidden" name="custom" value="*TRIAL*">
		<input type="hidden" name="notify_url" value="#request.config.getValue('paypalnotifyurl')#">
		<input type="hidden" name="return" value="#request.config.getValue('paypalreturnurl')#">
		<input type="hidden" name="cancel_return" value="#request.config.getValue('paypalcancelurl')#">

</form>
</cfoutput>