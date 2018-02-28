<cfscript>
    //larry's ID is 1
    larry = EntityLoad("Musician", 1, true);
    EntityDelete(larry);
</cfscript>
