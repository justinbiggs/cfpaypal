<cfoutput>
<form action="#request.config.getValue('paypalposturl')#" method="post" >
		<input type="hidden" name="cmd" value="_xclick">
		<input type="hidden" name="bn" value="SET HERE">
		<input type="hidden" name="business" value="#request.config.getValue('paypalbusinessemail')#">
		<input type="hidden" name="item_name" value="Purchase Order">
		<input type="hidden" name="currency_code" value="USD">
		<input type="hidden" name="amount" value="50">
		<input type="hidden" name="custom" value="*CUSTARJUN*">
		<input type="hidden" name="notify_url" value="#request.config.getValue('paypalnotifyurl')#">
		<input type="hidden" name="return" value="#request.config.getValue('paypalreturnurl')#">
		<input type="hidden" name="cancel_return" value="#request.config.getValue('paypalcancelurl')#">
		<input type="image" src="http://www.paypal.com/en_US/i/btn/x-click-but01.gif" name="submit" alt="Make payments with PayPal - it's fast, free and secure!">

		<input type="hidden" name="quantity" value="1">
		<input type="hidden" name="item_number" value="IT101">
		<input type="hidden" name="invoice" value="INV10001">   
		<input type="hidden" name="shipping" value="4.50">
		<input type="hidden" name="handling" value="2.10">
		<input type="hidden" name="tax" value="1.99">
		<input type="hidden" name="cn" value="Arjuns Instruction">
		<input type="hidden" name="no_shipping" value="0">   
		<input type="hidden" name="no_note" value="0">   
		
		<!----
		
		<input type="hidden" name="shipping2" value="">



		
		
		<input type="hidden" name="on0" value="">   
		<input type="hidden" name="os0" value="">   
		<input type="hidden" name="on1" value="">   
		<input type="hidden" name="os1" value="">   
		


		<input type="hidden" name="cmd" value="_ext-enter">
		<input type="hidden" name="redirect_cmd" value="_xclick">
		<input type="hidden" name="email" value="">   
		<input type="hidden" name="first_name" value="">   
		<input type="hidden" name="last_name" value="">   
		<input type="hidden" name="address1" value="">   
		<input type="hidden" name="address2" value="">   
		<input type="hidden" name="city" value="">   
		<input type="hidden" name="state" value="">   
		<input type="hidden" name="zip" value="">   
		---->
</form>
</cfoutput>