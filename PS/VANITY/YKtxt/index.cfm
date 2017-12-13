<cfsetting requestTimeOut="300" />

<!---
0) Render the output in an easy to work with CSV file. When we switch to using the DB the output will be to do UPDATE SQL queries.
1) Pull Back HTTP Status Code (it does this already)
2) Check to see if the final destination you're taken to is the same destination as defined in the tool (ie, if the tool is supposed to send pearsonschool.com/science to pearsonschool.com/index.cfm?locator=123456 but you actually wind up at pearsonschool.com/index.cfm?locator=abcdef we'd want to know that).
3) Check to see if the final destination is in https or http (easy to check this - just have CF look at the url)
4) Check to see if the final destination, if it's http, is capable of https (dont worry about this. we have functions that can check this.) 
--->

<!--- create java object for functions --->
<cfset vanityURLFunctions = JavaCast("null","") />
<cfset vanityURLFunctions = createObject("component", "functions") />

<!--- open the file containing the vanity urls --->
<cfset vanityURLsFilePath = "C:\Users\vkoloyu\CF\ColdFusion\cfusion\wwwroot\Testing\newYKtxt\vanity_urls.csv" />

<!--- establish what the lastline processed line is --->
<!--- (either 0 if the first time running, or what's stored in lastline.txt) --->
<cfparam name="lastline" default="0" />


<!--- read the file lastline.txt and get lastline number in variable lastline--->
<cffile action="read" file="C:\Users\vkoloyu\CF\ColdFusion\cfusion\wwwroot\Testing\newYKtxt\lastline.txt" variable="lastline">


<!--- set start line --->
<cfset startingLine = lastline + 1 />




<!--- establish header row for output csv --->
<cfset outputForCSV = "" />

<cftry>
	


<!--- loop through 2 lines of the file --->
<cfloop file="#vanityURLsFilePath#" from="#startingLine#" to="#(startingLine + 1)#" index="currentLine" >

	<cfdump label="Current Line" var="#currentLine#" />

	<cfset vanityURLArray       = listToArray(currentLine, ",") />
	<cfset vanityURL            = vanityURLArray[1] />
	<cfset vanityURLDestination = vanityURLArray[2] />

	<cfset finalURLDestination  = vanityURLFunctions.getFinalDestinationFromURL(vanityURL) />
	<cfset responseCode         = vanityURLFunctions.getResponseCode(finalURLDestination) />
	<cfset isURLSecure          = vanityURLFunctions.isURLSecure(finalURLDestination) />
	<cfset isURLSecureCapable   = vanityURLFunctions.isURLSecureCapable(finalURLDestination) />
    
	<cfset outputForCSV = outputForCSV & '"#trim(vanityURL)#",' />
	<cfset outputForCSV = outputForCSV & '"#trim(vanityURLDestination)#",' />
	<cfset outputForCSV = outputForCSV & '"#trim(finalURLDestination)#",' />
	<cfset outputForCSV = outputForCSV & '"#trim(responseCode)#",' />
        <cfset outputForCSV = outputForCSV & '"#trim(((findoneof("#vanityURLDestination#", "#finalURLDestination#")) ? "true" : "false"))#",' />
	<cfset outputForCSV = outputForCSV & '"#trim(isURLSecure)#",' />
	<cfset outputForCSV = outputForCSV & '"#trim(isURLSecureCapable)#"' />
	<cfset outputForCSV = outputForCSV & chr(13) />

</cfloop>


<cfcatch type="Any"> <cfdump var="#cfcatch#" /> 
<cfif cfcatch.message EQ "End of file reached.">
	End of file reached
	<cfabort >
</cfif>

</cfcatch>
	

</cftry>

  <!--- Rewrite this lastline to file lastline.txt --->
	<cffile action="write"
	file="C:\Users\vkoloyu\CF\ColdFusion\cfusion\wwwroot\Testing\newYKtxt\lastline.txt"
	output="#(startingLine + 1)#">
	



<!--- append results to file --->
<cffile action="append" file="C:\Users\vkoloyu\CF\ColdFusion\cfusion\wwwroot\Testing\newYKtxt\vanity_urls_results.csv" output="#outputForCSV#" />

<cfoutput>
<p>#(startingLine + 1)# lines processed from 4542.</p>
</cfoutput>

