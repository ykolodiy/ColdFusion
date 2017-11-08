<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Untitled Document</title>
</head>

<body>


<cfset cookie.Suka = "ru" />
<cfcookie
    name="LB"
    value="acorn1" 
/>



<cfhttp result="result" method="GET" charset="utf-8" url="https://www.pearsonschool.com/">
    <cfhttpparam name="q" type="Cookie" value="cfml">
</cfhttp>
<cfdump var="#result#">

<cfoutput >
	result.Responseheader.Connection: #result.Responseheader.Connection#
	<br>
	result.Responseheader.Content-Length: #result.Responseheader["Content-Length"]#
</cfoutput>
















</body>
</html>
