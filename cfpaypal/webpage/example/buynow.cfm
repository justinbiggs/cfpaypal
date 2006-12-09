<h1><u>Passing the Aggregate Cart Amount to PayPal</u></h1>
<cfsetting enablecfoutputonly="yes">
<cfoutput><h2>Simple Buy Now/Checkout button</h2></cfoutput>
<cfset buyNow = CreateObject("component","#Request.comPath#.com.system.button.BuyNowButton")>
<cfset buyNow.setInvoice("I0290")>
<cfset buyNow.setItem_Number("P101")>
<cfset buyNow.setItem_Name("Product 1")>
<cfset buyNow.setQuantity("1")>
<cfset buyNow.setAmount("45")>
<cfoutput>#buyNow.getButtonHTML()#</cfoutput>


<cfoutput><h2>Custom button</h2></cfoutput>
<cfset buyNow = CreateObject("component","#Request.comPath#.com.system.button.BuyNowButton")>
<cfset buyNow.setCustom("fun")>
<cfset buyNow.setItem_Number("P101")>
<cfset buyNow.setItem_Name("Product 1")>
<cfset buyNow.setQuantity("1")>
<cfset buyNow.setAmount("45")>
<cfoutput>#buyNow.getButtonHTML(customButton="<input type='submit' name='submit' value='Pay Now'>")#</cfoutput>


<cfoutput><h2>Buy Now/Checkout button with shipping/handling and tax charges</h2></cfoutput>
<cfset buyNow = CreateObject("component","#Request.comPath#.com.system.button.BuyNowButton")>
<cfset buyNow.setItem_Number("P101")>
<cfset buyNow.setItem_Name("Product 1")>
<cfset buyNow.setQuantity("2")>
<cfset buyNow.setAmount("45")>
<cfset buyNow.setShipping("4.55")>
<cfset buyNow.setShipping2("1.55")>
<cfset buyNow.setHandling("1.25")>
<cfset buyNow.setTax(".45")>
<cfset buyNow.setNoteName("Please provide delivey date etc..")>
<cfoutput>#buyNow.getButtonHTML()#</cfoutput>

<cfoutput><h2>Button with no shipping address / no memo required</h2></cfoutput>
<cfset buyNow = CreateObject("component","#Request.comPath#.com.system.button.BuyNowButton")>
<cfset buyNow.setItem_Number("P101")>
<cfset buyNow.setItem_Name("Product 1")>
<cfset buyNow.setQuantity("1")>
<cfset buyNow.setAmount("45")>
<cfset buyNow.setIsShippingAddressRequired(false)>
<cfset buyNow.setIsNoteRequired(false)>
<cfoutput>#buyNow.getButtonHTML()#</cfoutput>

<cfoutput><h2>Button with Option values</h2></cfoutput>
<cfset buyNow = CreateObject("component","#Request.comPath#.com.system.button.BuyNowButton")>
<cfset buyNow.setItem_Number("P101")>
<cfset buyNow.setItem_Name("Product 1")>
<cfset buyNow.setQuantity("1")>
<cfset buyNow.setAmount("45")>
<cfset buyNow.setOption_Name1("Color")>
<cfset buyNow.setOption_selection1("Red")>
<cfset buyNow.setOption_Name2("Size")>
<cfset buyNow.setOption_selection2("X-Large")>
<cfoutput>#buyNow.getButtonHTML()#</cfoutput>


<cfoutput><h2>Passing Customer Information</h2></cfoutput>

<cfset buyNow = CreateObject("component","#Request.comPath#.com.system.button.BuyNowButton")>
<cfset buyNow.setItem_Number("P101")>
<cfset buyNow.setItem_Name("Product 1")>
<cfset buyNow.setQuantity("1")>
<cfset buyNow.setAmount("45")>

<cfset customerDataPass = CreateObject("component","#Request.comPath#.com.system.button.CustomerDataPass")>
<cfset customerDataPass.setEmail("bogus@me.com")>
<cfset customerDataPass.setFirst_name("John")>
<cfset customerDataPass.setLast_name("Smith")>
<cfset customerDataPass.setAddress1("4716 Harvest Court")>
<cfset customerDataPass.setAddress2("")>
<cfset customerDataPass.setCity("Vienna")>
<cfset customerDataPass.setState("VA")>
<cfset customerDataPass.setZip("22033")>
<cfset buyNow.setCustomerDataPass(customerDataPass)>

<cfoutput>#buyNow.getButtonHTML(customButton="<input type='submit' name='submit' value='Pay Now'>")#</cfoutput>






<cfset cartData = ArrayNew(1)>
<cfset ArrayAppend(cartData, "101,Item 1,1,10,red,large")>
<cfset ArrayAppend(cartData, "105,Item 2,2,9.10,blue,small")>
<cfset ArrayAppend(cartData, "109,Item 3,1,5,black,large")>
<cfset ArrayAppend(cartData, "120,Item 4,4,2,blue,medium")>
<cfset myQuery = QueryNew("item, name, qty, price, color, size")>
<cfloop from="1" to="#ArrayLen(cartData)#" index="i">
	<cfset newRow = QueryAddRow(MyQuery)>
	<cfset temp = QuerySetCell(myQuery, "item", ListGetAt( cartData[i],1))>
	<cfset temp = QuerySetCell(myQuery, "name", ListGetAt( cartData[i],2))>
	<cfset temp = QuerySetCell(myQuery, "qty", ListGetAt( cartData[i],3))>
	<cfset temp = QuerySetCell(myQuery, "price", ListGetAt( cartData[i],4))>
	<cfset temp = QuerySetCell(myQuery, "color", ListGetAt( cartData[i],5))>
	<cfset temp = QuerySetCell(myQuery, "size", ListGetAt( cartData[i],6))>
</cfloop>


<cfoutput><u><h1>Passing Individual Items to PayPal</h1></u></cfoutput>

<cfoutput><h2>Passing cart items to paypal</h2></cfoutput>
<cfset buyNow = CreateObject("component","#Request.comPath#.com.system.button.BuyNowButton")>
<cfloop query="myQuery">
	<cfset cartItem = CreateObject("component","#Request.comPath#.com.system.common.CartItem")>
	<cfset cartItem.setItem_Name(myQuery.name)>
	<cfset cartItem.setItem_Number(myQuery.item)>
	<cfset cartItem.setQuantity(myQuery.qty)>
	<cfset cartItem.setAmount(myQuery.price)>
	<cfset buyNow.addCartItem(cartItem)>
</cfloop>
<cfset buyNow.setTax("30")>
<cfoutput>#buyNow.getButtonHTML()#</cfoutput>


<cfoutput><h2>Passing cart items with options options</h2></cfoutput>
<cfset buyNow = CreateObject("component","#Request.comPath#.com.system.button.BuyNowButton")>
<cfloop query="myQuery">
	<cfset cartItem = CreateObject("component","#Request.comPath#.com.system.common.CartItem")>
	<cfset cartItem.setItem_Name(myQuery.name)>
	<cfset cartItem.setItem_Number(myQuery.item)>
	<cfset cartItem.setQuantity(myQuery.qty)>
	<cfset cartItem.setAmount(myQuery.price)>
	<cfset cartItem.setOption_Name1("Color")>
	<cfset cartItem.setOption_selection1(myQuery.color)>
	<cfset cartItem.setOption_Name2("Size")>
	<cfset cartItem.setOption_selection2(myQuery.size)>
	<cfset cartItem.setShipping("1.08")>
	<cfset cartItem.setShipping2(".60")>
	<cfset cartItem.setHandling(".55")>
	
	<cfset buyNow.addCartItem(cartItem)>
</cfloop>
<cfoutput>#buyNow.getButtonHTML()#</cfoutput>