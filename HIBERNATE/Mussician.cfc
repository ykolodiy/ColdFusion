<cfcomponent hint="I am a musician" output="false" persistent="true">

<cfproperty name="musicianID" hint="The id for the musician" type="numeric" fieldtype="id"
datatype="integer" generator="identity">
<cfproperty name="name" hint="name of the musician" type="string" length="255">
<cfproperty name="age" hint="Age of the Musician" type="numeric" datatype="integer">

<cffunction name="init" hint="Constructor" access="public" returntype="Musician" output="false">
    <cfargument name="name" hint="the name of the musician" type="string" required="no" default="">
    <cfscript>
        setName(arguments.name);
    
        return this;  
         
    </cfscript>
</cffunction>

</cfcomponent>
