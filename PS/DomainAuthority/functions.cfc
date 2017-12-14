
<cfcomponent name="vanityURLFunctions">


	<cffunction name="getDomainAuthorityScore" returntype="any" hint="This function takes a URL and returns Domain Authority of Passed URL">
	<cfargument type="string" name="url" required="yes"  hint="A URL" />
	
		<cftry>
		<!---Get your access id and secret key here: https://moz.com/products/api/keys --->
		<cfset accessID = "" />
		<cfset secretKey = "" />
		
		<!---Set your expires times for several minutes into the future --->
		<!---An expires time excessively far in the future will not be honored by the Mozscape API. --->
		<cfset expires = #round(getTickCount() /1000)# +300  />
		
		<!---Put each parameter on a new line --->
		<cfset stringToSign = accessID & chr(10) & expires />
		
		<!---Get the hex output of the hmac hash --->
		<cfset binarySignature = hmac(stringToSign, secretKey, "HMACSHA1") />
		<!--- Convert hex to base64 because MOZ want this base64 format in the requesturl --->
		<cfset binarySignature2 = binaryDecode( binarySignature, "hex" ) />
		<cfset binarySignature3 = binaryEncode( binarySignature2, "base64" ) />
		
		<!--- url-encode that --->
		<cfset urlSafeSignature = urlEncodedFormat(binarySignature3) />
		
		<!---Specify the URL that you want link metrics for --->
		<cfset objectURL = #arguments.url# />
		
		<!---Add up all the bit flags you want returned. Learn more here: https://moz.com/help/guides/moz-api/mozscape/api-reference/url-metrics--->
		<cfset cols = "103079215108" />
		
		<!---Put it all together and you get your request URL. This example uses the Mozscape URL Metrics API --->
		<cfset requestUrl = "http://lsapi.seomoz.com/linkscape/url-metrics/"&encodeForURL(objectURL)&"?Cols="&cols&"&AccessID="&accessID&"&Expires="&expires&"&Signature="&urlSafeSignature />
		
		<!---send request --->
		<cfhttp result="result" method="get"  url=#requestUrl# />
		
		<cfcatch type="any">
		<cfdump var="#cfcatch#" >
		</cfcatch>
		</cftry>
		
		
		
		<cfreturn #result.Filecontent# />

	</cffunction>

</cfcomponent>

