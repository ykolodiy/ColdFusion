<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Untitled Document</title>
</head>

<body>


<!---LOOP https://helpx.adobe.com/coldfusion/cfml-reference/coldfusion-tags/tags-j-l/cfloop-looping-over-a-list-a-file-or-an-array.html --->

			<cfhttp url="https://www.pearsonschool.com/" result="result" method="GET"> </cfhttp> 	
		     <cfoutput >   #result.Responseheader.Status_Code#</cfoutput>
	

<!---PLAYING WITH ARRAY --->




<!--- putting result to string --->
<cfset dataString = ToString(#result.Header#)> 
<!--- creating array from this string using deliminator as : --->
<cfset myArrayList2 = ListToArray(dataString,':')>
<!--- looping thru array but displaying only line that has LB in it --->
<cfloop array="#myArrayList2#" item="itm">
<cfif findNoCase("LB", #itm#)>
	<cfoutput>#itm#  </cfoutput>
	     
</cfif>
		
  
</cfloop>



</body>
</html>
