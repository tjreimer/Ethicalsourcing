global with sharing class CountryScoreCntrl {
        
    webservice static String getAuditScoreCards(String Country) {
        
        Country__c ncountry = [Select i.Name,
                              (Select Name, Audit_Score_Card__c, 
                               Prdgrp1__c, PrdGrp2__c, PrdGrp3__c, PrdGrp4__c, PrdGrp5__c,
                               PrdGrp6__c, PrdGrp7__c, PrdGrp8__c, PrdGrp9__c, PrdGrp10__c, Formula__c
                              from CountryScoreCards__r) 
                              FROM Country__c i
                              WHERE i.Name = :country Limit 1]; 
     
        
        List<Facility__c> facility = [Select i.Name,i.Facility_Number__c,i.WCA_Compliant__c,
                                    i.WCA_Due_for_new_listing__c,
                                    i.WCA_CAPA_Not_Requested__c, i.WCA_CAPA_Completed__c,
                                    i.WCA_CAPA_Greenlist_Criteria__c, 
                                    i.WCA_Greenlist_Criteria__c,
                                    i.Training_Completed__c, i.Training_Not_Completed__c, i.Training_not_requested__c,
                                    i.Removed_from_Green_List_Due_to_FS__c,
                                    i.Removed_from_Green_List_Due_to_FS_CAPA__c,
                                    i.Removed_from_Greenlist_Due_to_WCA_CAPA__c,
                                    i.Remove_from_Green_List_Due_to_WCA__c,
                                    i.Past_Audit_Deadline_FS__c,
                                    i.Past_Audit_Deadline_WCA__c,
                                    i.Past_CAPA_Deadline_FS__c,
                                    i.Past_CAPA_Deadline_WCA__c,
                                    i.Pending_CAPA_FS__c,
                                    i.Pending_CAPA_WCA__c,
                                    i.Green_List_Status__c,
                                    i.On_Site_Investigation_Not_Completed__c,i.No_Findings__c,
                                    i.FS_Green_list_criteria__c,i.FS_Due_for_new_listing__c,i.FS_Compliant__c,
                                    i.FS_CAPA_Not_Requested__c,i.FS_CAPA_Green_list_criteria__c,
                                    i.FS_CAPA_Completed__c,i.FS_Audit_Required__c,
                                    i.Engineering_Audit_Requested__c,
                                    i.Engineering_Audit_Not_Requested__c,
                                    i.Engineering_Audit_Not_Completed__c,
                                    i.Engineering_audit_completed__c, i.Facility_Status__c
                                   FROM Facility__c i                                         
                                   WHERE i.FS_Required_country__c =: Country];
        
// Get all vendor/factory relationshps
      
      List<Supplier_Facility__c> splfacility =  [Select Name,Facility_Number__c, Product_Group__c  from Supplier_Facility__c]; 
       
// Create a key/value map for factory number and product group
      Integer i = 0; 
    
      Map<String, String> splMap = new Map<String, String>();
        
   
      for (Supplier_Facility__c spl : splfacility){ 
          splMap.put(splfacility[i].Facility_Number__c, splfacility[i].Product_Group__c);    
          i++;
      } 
        
       List<CountryScoreCard__c> scorecardlist = new List<CountryScoreCard__c>();
               
       for(CountryScoreCard__c scorecard : ncountry.CountryScoreCards__r){
      
           
           scorecard = CountryScoreServices.calcAuditScoreCards(facility, splMap, scorecard);     
           scorecardlist.add(scorecard);          
     }
       try {
                
            Database.update(scorecardlist);
          		    }
            catch(DmlException e) {
                return e.getMessage();
          }                           
        Return 'Score Card for ' + Country + ' Calculated';
    }
  
}