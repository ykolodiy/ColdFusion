<cfscript>
	
	
     //larry's ID is 1  update age
     larry = EntityLoad("Musician", 1, true);
     larry.setAge(48);
</cfscript>
