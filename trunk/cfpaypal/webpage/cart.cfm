<cfoutput>
<form action="#request.config.getValue('paypalposturl')#" method="post" >
		
		<input type="hidden" name="business" value="#request.config.getValue('paypalbusinessemail')#">
		<input type="hidden" name="currency_code" value="USD">
		<input type="hidden" name="custom" value="*CUSTARJUN*">
		<input type="hidden" name="notify_url" value="#request.config.getValue('paypalnotifyurl')#">
		<input type="hidden" name="return" value="#request.config.getValue('paypalreturnurl')#">
		<input type="hidden" name="cancel_return" value="#request.config.getValue('paypalcancelurl')#">
		<input type="image" src="http://www.paypal.com/en_US/i/btn/x-click-but01.gif" name="submit" alt="Make payments with PayPal - it's fast, free and secure!">


		<input type="hidden" name="item_name_1" value="Item 1">
		<input type="hidden" name="item_number_1" value="IT101">
		<input type="hidden" name="amount_1" value="50">
		<input type="hidden" name="quantity_1" value="3">
		<input type="hidden" name="on0_1" value="New">   
		<input type="hidden" name="os0_1" value="New Two">   
		<input type="hidden" name="shipping_1" value="1.99">
		<input type="hidden" name="shipping2_1" value=".99">


		<input type="hidden" name="item_name_2" value="Item Two">
		<input type="hidden" name="item_number_2" value="IT109">
		<input type="hidden" name="amount_2" value="10">
		<input type="hidden" name="quantity_2" value="1">
		
		<input type="hidden" name="upload" value="1">


		<input type="hidden" name="cmd" value="_ext-enter">
		<input type="hidden" name="redirect_cmd" value="_cart">
		
		<input type="hidden" name="email" value="preeti@gmail.com">   
		<input type="hidden" name="first_name" value="Preeti">   
		<input type="hidden" name="last_name" value="Grover">   
		<input type="hidden" name="address1" value="2675 Highland Pass">   
		<input type="hidden" name="address2" value="">   
		<input type="hidden" name="city" value="Alpharetta">   
		<input type="hidden" name="state" value="GA">   
		<input type="hidden" name="zip" value="30004">   

		
		<!----
		<input type="hidden" name="cmd" value="_xclick">
		
		

		
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