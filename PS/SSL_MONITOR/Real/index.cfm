<!DOCTYPE html>
<html>
<head>
<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
    text-align: left;
}
table {
    width: 100%;    
    background-color: #f1f1c1;
}
</style>
</head>
<body>

<h2>SSL Certificate Tool</h2>

<cfquery datasource="ORACLE_DEV" name="LS">
SELECT LS_DOMAINS.ROOT_DOMAIN RD,  LS_DOMAINS.DATE_EXPIRES DA, LS_SUB_DOMAINS.SUB_DOMAIN SD, LS_CERTIFICATES.DATE_EXPIRES SA, LS_DOMAINS.ID DI
FROM ((LS_DOMAINS
INNER JOIN LS_SUB_DOMAINS ON LS_DOMAINS.ID = LS_SUB_DOMAINS.DOMAIN_ID)
INNER JOIN LS_CERTIFICATES ON LS_SUB_DOMAINS.ID = LS_CERTIFICATES.SUB_DOMAIN_ID)
</cfquery>


<!---<cfdump var="#LS#" >--->


<table >
  <tr>
	    <th>Edit</th>
	    <th>Root domain</th> 
	   <th>Sub Domain</th> 
	    <th>Domain Expires</th> 
	    <th>SSL Certificate Expires</th> 
	    
  </tr>
  
  <cfoutput query="LS">
  <tr>
    <td><a href="edit.cfm?domainid=#DI#">Edit</a></td>
    <td>#RD#</td>
     <td>#SD#</td>
    <td>#DateTimeFormat(DA, "mm.dd.yyyy")#</td>
    <td>#DateTimeFormat(SA, "mm.dd.yyyy")#</td>
   
    
  </tr>
  </cfoutput>
  
</table>

<br>






</body>
</html>