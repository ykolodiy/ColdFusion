
<cfcomponent name="vanityURLFunctions">

	<cffunction name="getFinalDestinationFromURL" returntype="string" hint="This function receives a URL and does cfhttp requests in a loop until there are no 301 redirects, returning the final destination. If there are no redirects, it returns the original URL.">

		<cfargument type="string" name="vanityURL" required="yes" default="http://www.pearsonschool.com/index.cfm" hint="A URL" />

		<cfset var nextLocation = arguments.vanityURL />
		<cfset var keepChecking = true />
		<cfset var URLRequestResults = "" />

		<cfdump label="Vanity URL" var="#nextLocation#" />

		<cfset iterations = 1 />
		<cfloop condition="keepChecking is true and iterations lte 5">

	                <cfif left(nextLocation, 2) is "//">

	                	<cfset nextLocation = ReplaceNoCase(nextLocation, "//", "http://") />

	                </cfif>

	                <cfif left(nextLocation, 13) is "/redirect.cfm">

	                	<cfset nextLocation = "https://www.pearsonschool.com" & nextLocation />

	                </cfif>

	                <cfif left(nextLocation, 10) is "/index.cfm">

	                	<cfset nextLocation = "https://www.pearsonschool.com" & nextLocation />

	                </cfif>

	                <cfif left(nextLocation, 9) is "index.cfm">

	                	<cfset nextLocation = "https://www.pearsonschool.com/" & nextLocation />

	                </cfif>

		        <cfhttp timeout="2" method="head" url="#nextLocation#" result="URLRequestResults" redirect="false" />

			<cfdump label="CFHTTP to #nextLocation#" var="#URLRequestResults#" expand="no" />

		        <cfif structKeyExists(URLRequestResults.responseHeader, 'status_code') and URLRequestResults.responseHeader.status_code is 301>

		                <cfset keepChecking = true />
		                <cfset nextLocation = URLRequestResults.responseHeader.Location />

		        <cfelse>
		        
		                <cfset keepChecking = false />
		        
		        </cfif>

			<cfset iterations = iterations + 1 />

		</cfloop>

		<cfdump label="Final Destination" var="#nextLocation#" />

		<cfoutput><hr /></cfoutput>

		<cfreturn nextLocation />

	</cffunction>

	<cffunction name="isURLSecure" returntype="boolean" hint="This function takes a URL and returns a true or false if it is a HTTPS URL">

		<cfargument type="string" name="url" required="yes" default="https://www.pearsonschool.com/index.cfm" hint="A URL" />

		<cfreturn (left(arguments.url, 8) is "https://") />

	</cffunction>

	<cffunction name="isURLSecureCapable" returntype="boolean" hint="This function takes a URL and returns a true or false if it is a HTTPS URL">

		<cfargument type="string" name="url" required="yes" default="https://www.pearsonschool.com/index.cfm" hint="A URL" />

		<cfhttp method="head" url="#replace(arguments.url, 'http://', 'https://')#" result="URLRequestResults" redirect="false" />

		<cfif structKeyExists(URLRequestResults.responseHeader, 'status_code') and URLRequestResults.responseHeader.status_code is "200">
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>

	</cffunction>

</cfcomponent>

