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




<cfquery datasource="ORACLE_DEV" name="LS_SUB_DOMAINS">
	SELECT * FROM LS_SUB_DOMAINS
	ORDER BY id
</cfquery>

<h3>
	LS_SUB_DOMAINS TABLE
</h3>
<table >
  <tr>
    <th>ID</th>
    <th>Domain ID</th> 
     <th>Sub Domain</th> 

  </tr>
  
  <cfoutput query="LS_SUB_DOMAINS">
  <tr>
    <td>#LS_SUB_DOMAINS.id#</td>
    <td>#LS_SUB_DOMAINS.domain_id#</td>
    <td>#LS_SUB_DOMAINS.sub_domain#</td>

  </tr>
  </cfoutput>
  
</table>

</body>
</html>