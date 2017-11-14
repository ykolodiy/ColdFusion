<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Untitled Document</title>
</head>

<body>

<cfset site="https://www.pearsonschool.com/">
<!---LOOP https://helpx.adobe.com/coldfusion/cfml-reference/coldfusion-tags/tags-j-l/cfloop-looping-over-a-list-a-file-or-an-array.html --->

			<cfhttp url=#site# result="result" method="GET"> </cfhttp> 	
		     <cfoutput > #site# >  #result.Responseheader.Status_Code# ></cfoutput>
	

<!---PLAYING WITH ARRAY --->




<!--- putting result to string --->
<cfset dataString = ToString(#result.Header#)> 
<!--- creating array from this string using deliminator as : --->
<cfset myArrayList2 = ListToArray(dataString,':')>
<!--- looping thru array but displaying only line that has LB in it --->
<cfloop array="#myArrayList2#" item="itm">
<cfif findNoCase("LB", #itm#)>
	<cfoutput> #Left(itm, 10)#  </cfoutput>
	     
</cfif>
		
  
</cfloop>

	<!---if u wanna send email   --->  
	<cfset p = createObject ('component', 'Testing.mail') />
<cfset p.sent()>



</body>
</html>
