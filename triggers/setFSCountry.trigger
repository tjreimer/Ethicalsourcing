trigger setFSCountry on Facility__c (before insert, before update) {
// Check the FS Country 
 List<Country__c> fscountry = [Select i.Name, i.FS_Country__c, i.Default_PSTL_Code__c From Country__c i 
                                     Where i.id = :Trigger.new[0].Country__c AND i.Country_Status__c = 'Active'];
    
    if(fscountry.size() > 0 && fscountry[0].FS_Country__c == true )
    {
        Trigger.new[0].FS_Required_country__c = fscountry[0].name;
    }
    else
    {
        Trigger.new[0].FS_Required_country__c = '';
    } 

  if(fscountry.size() > 0 && Trigger.new[0].PSTL_Code__c == Null)
    {
  
        Trigger.new[0].PSTL_Code__c = fscountry[0].Default_PSTL_Code__c ;
  } 
}