<!--- create java object for functions --->
<cfset domainAuthorityFunction = JavaCast("null","") />
<cfset domainAuthorityFunction = createObject("component", "functions") />


<!--- run functions to get all domain auth results --->
<cfset da1 = domainAuthorityFunction.getDomainAuthorityScore("www.pearsonschool.com")>
<cfset da2 = domainAuthorityFunction.getDomainAuthorityScore("www.pearsonhomeschool.com")>
<cfset da3 = domainAuthorityFunction.getDomainAuthorityScore("www.pearsoncanadaschool.com")>
<cfset da4 = domainAuthorityFunction.getDomainAuthorityScore("www.pearsonglobalschools.com")>

<!--- print the output of da for browser view --->
<cfoutput >
	#da1#<br>
	#da2#<br>
	#da3#<br>
	#da4#<br>
</cfoutput>

<!--- put results in var to save lates --->
<cfset outputForCSV = Now()  & #chr(13)# & #chr(10)# />

	<cfset outputForCSV = outputForCSV & #da1# &#chr(13)# & #chr(10)# />
	<cfset outputForCSV = outputForCSV & #da2# & #chr(13)# & #chr(10)# />
	<cfset outputForCSV = outputForCSV & #da3# & #chr(13)# & #chr(10)# />
	<cfset outputForCSV = outputForCSV & #da4# & #chr(13)# & #chr(10)# />
	


<!--- append results to file  --->
<cffile action="append" file="C:\Users\vkoloyu\CF\ColdFusion\cfusion\wwwroot\Testing\da\domain_authority_results.txt" output="#outputForCSV#" />
