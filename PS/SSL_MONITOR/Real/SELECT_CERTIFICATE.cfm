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




<cfquery datasource="ORACLE_DEV" name="LS_CERTIFICATES">
	SELECT * FROM LS_CERTIFICATES
	ORDER BY id
</cfquery>

<h3>
	LS_CERTIFICATES TABLE
</h3>
<table >
  <tr>
    <th>ID</th>
    <th>Domain ID</th> 
     <th>Sub Domain ID</th> 
      <th>Date Expires</th> 
       
  </tr>
  
  <cfoutput query="LS_CERTIFICATES">
  <tr>
    <td>#LS_CERTIFICATES.id#</td>
    <td>#LS_CERTIFICATES.domain_id#</td>
    <td>#LS_CERTIFICATES.sub_domain_id#</td>
    <td>#DateTimeFormat(LS_CERTIFICATES.date_expires, "mm.dd.yyyy")#</td>
    
  </tr>
  </cfoutput>
  
</table>

</body>
</html>