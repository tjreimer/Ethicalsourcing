trigger uniqueSubContractorRltn on Subcontractor__c (before insert) {


// Check if there is an identical facility subcontractor relationship
List<Subcontractor__c> subcntrctr = [Select i.Name,i.Facility_Number__c,
                                     i.Facility__c,Subcontractor__c
          From Subcontractor__c i
          Where i.Facility_Number__c = :Trigger.new[0].Facility_Number__c];
    
 Integer k = 0;
    for(Subcontractor__c subcntr : subcntrctr){
  //      Subcontractor__c  = [Select i.Name, i.Facility_Number__c 
  //                            from Subcontractor__c i
  //                          Where i.Facility_Number__c = :subcntrctr.Facility_Number__c[k]];
    }  
    
    if(subcntrctr.size() > 0) {
        Trigger.new[0].Name.addError('Cannot Enter Duplicate Relationships');  
    }     
}