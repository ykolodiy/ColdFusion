//https://www.adobe.com/devnet/coldfusion/articles/coldfusion9_orm.html

<cfscript>
    import Musician.cfc;

    larry = new Musician("Larry Jingle");
    
    larry.setAge(47);
    
    EntitySave(larry);
</cfscript>
