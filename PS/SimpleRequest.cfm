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
	

<cfdump var="#result#" >



</body>
</html>
