<!--- WRITE FOR Railo 4.2.1.008
0) Render the output in an easy to work with CSV file. When we switch to using the DB the output will be to do UPDATE SQL queries.
1) Pull Back HTTP Status Code (it does this already)
2) Check to see if the final destination you're taken to is the same destination as defined in the tool (ie, if the tool is supposed to send pearsonschool.com/science to pearsonschool.com/index.cfm?locator=123456 but you actually wind up at pearsonschool.com/index.cfm?locator=abcdef we'd want to know that).
3) Check to see if the final destination is in https or http (easy to check this - just have CF look at the url)
4) Check to see if the final destination, if it's http, is capable of https (dont worry about this. we have functions that can check this.) 
--->

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Test Vanity Urls</title>
</head>
<!--- this include has function httporhttps (url) that will check if final url is http or htps --->
<cfinclude template='sslChecker.cfm'>
<body>
vanityURL > status code > destination as defined YES/NO > final destination https YES/NO <br>
<!--- here is the list of vanity urls in ARRAY --->
<cfset myFile="C:/tmp/vanity2.csv" />
<cftry>
<cfset array = ArrayNew(1)>
<cfloop file="#myFile#" index="i"  item="line">
	<cfset array[i] = listToArray (#line#, ",",true)>
</cfloop>
<cfcatch >
	<cfdump var="#cfcatch#" >
</cfcatch>
</cftry>

<!--- Checking if some data stored in Cookies or not and it is the first run --->
<cfif StructKeyExists(Cookie,"LastRow")>
	<cfset LastRow = #cookie.LastRow#>
    <cfset data="">
    
    <!--- if we have reached and of THE file Abort all operations --->
    <cfif LastRow GTE "#arrayLen(array)#">
    	<cfoutput >
    		#arrayLen(array)# END of the FILE <br>
    	</cfoutput>
    <!--- ABORT --->
    	<cfabort>
    </cfif>
    
    
	<!--- if cookie doesnt exist lastrow eq 0 data 0 and create new file to write results --->
	<cfelse >
	<cfset LastRow = 0>
	<cfset data="">
	<!--- create new file and rewrite existing if its first time running --->
	<cffile action="write"
	file="C:/tmp/myfile.csv"
	output="">	
</cfif>

<!--- Setting lastline variable to use it in the loop and finish loop after last line reached --->
<cfif 1+LastRow+10 GT arrayLen(array)>
	<cfset lastline = arrayLen(array)>
	<cfelse>
	<cfset lastline = 1+LastRow+10>
</cfif>

<!--- Lets start looping thru 10 urls in the row --->
<cfloop from="#1+LastRow#" to="#lastline#" index="i">
	
		   <cftry>  
		<!--- this request doesnt redirects but gets redirect url "result.Responseheader.Location"--->
             <cfhttp url="#array[i][1]#" result="result" method="HEAD" redirect="false" />
        <!--- this requests redirects and get status code of final url --->	
             <cfhttp url="#array[i][1]#" result="result2" method="HEAD" redirect="true" />  
            
          <!--- Some vanity url has no redirection we need to define this to empty ---> 
          <cfif NOT StructKeyExists( result.Responseheader, "Location" )> 
          <cfset result.Responseheader.Location="" > </cfif>
         
         <!--- Here we check if final url is as expected and store result in var locationEqual--->
         <cfif findoneof (#array[i][2]#, #result.Responseheader.Location#)>
         	<cfset locationEqual = "YES" >
         <cfelse>
         	<cfset locationEqual = "NO" >
         	
         </cfif>
             <!--- lets print out results for this 11 requests in format vanityURL > status code > destination as defined YES/NO > final destination https YES/NO --->
          <cfoutput > #array[i][1]# > #result2.Responseheader.Status_Code# > #locationEqual# > #httporhttps(array[i][1])#</cfoutput><br>
	
		    <!--- Saving results in var data to save it in a file later when loop is done or break --->
		  <cfset  data = data & #array[i][1]# &">"& #result2.Responseheader.Status_Code# & ">" & #locationEqual# & ">" & #httporhttps(array[i][1])# &  #chr(13)# & #chr(10)#>
		  
		  

     <cfcatch type="Any"> <cfdump var="#cfcatch#" /> </cfcatch>
    </cftry> 
	   
</cfloop>
<!--- save cookie after the loop --->
				<cfcookie
                 name = "LastRow"
                 value = "#lastline#">

  <!--- Saving this requests results to file --->
	<cffile action="append"
	file="C:/tmp/myfile.csv"
	output="#data#">
	
	
	
	<cfoutput >
		tested #lastline# from #arrayLen(array)#
	</cfoutput>

</body>
</html>

