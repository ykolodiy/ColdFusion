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




<cfquery datasource="ORACLE_DEV" name="LS_DOMAINS">
	SELECT * FROM LS_DOMAINS
	ORDER BY id
</cfquery>

<h3>
	LS_DOMAINS TABLE
</h3>
<table >
  <tr>
    <th>ID</th>
    <th>Root domain</th> 
    <th>Date created</th> 
    <th>Date updated</th> 
    <th>Date expires</th> 
  </tr>
  
  <cfoutput query="LS_DOMAINS">
  <tr>
    <td>#LS_DOMAINS.id#</td>
    <td>#LS_DOMAINS.root_domain#</td>
    <td>#DateTimeFormat(LS_DOMAINS.date_created, "mm.dd.yyyy")#</td>
    <td>#DateTimeFormat(LS_DOMAINS.date_updated, "mm.dd.yyyy")#</td>
    <td>#DateTimeFormat(LS_DOMAINS.date_expires, "mm.dd.yyyy")#</td>
  </tr>
  </cfoutput>
  
</table>

</body>
</html>