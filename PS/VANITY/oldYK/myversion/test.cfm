	<cffunction name="getResponseCode" returntype = "any" hint="This function takes a URL sends request to it and receives response code"   > 
		
		<cfargument type="string" name="url" required="yes" hint="A URL" />
		
		<cfhttp url="#arguments.url#" result="result" method="head" redirect="true" />  
		  
		<cfreturn "#result.Responseheader.Status_Code#">
		  
	</cffunction>
	
	
	<cfset a = getResponseCode("http://www.google.com") >
	
	
	<cfoutput >
		#a#
	</cfoutput>
