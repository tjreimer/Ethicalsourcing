trigger uniqueSupFclty on Supplier_Facility__c (before insert) {

// Check if the vendor/factory relationship exists. 
List<Supplier_Facility__c> supfacility = [Select i.Name 
          From Supplier_Facility__c i
          Where i.Supplier_Number__c = :Trigger.new[0].Supplier_Number__c and
                      i.Facility_Number__c = :Trigger.new[0].Facility_Number__c];
    
    if(supfacility.size() > 0) {
        Trigger.new[0].Name.addError('Cannot Enter Duplicate Relationships');  
    }     
}