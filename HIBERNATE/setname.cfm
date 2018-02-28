<cfscript>
    import Musician.cfc;

    larry = new Musician("Larry Jingle");
    
    larry.setAge(47);
    
    EntitySave(larry);
</cfscript>
