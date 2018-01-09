global with sharing class FacilityActionCntrl {

        
   webservice static String facilityAction(String facilityId){
       
    
       
        Facility__c facility = [Select i.Name,i.Facility_Number__c,i.Facility_Status__c,i.WCA_Due_for_new_listing__c,
                              i.FS_Due_for_new_listing__c,i.Unauthorized_Sub_Contracting__c,
                              i.FS_Required_country__c,
                              i.FS_Audit_Required__c,i.Country__c,i.Region__c,
                              (Select Name, Audit_Group__c, Audit_Date__c, CAPA_Due_Date__c, Audit_Request_Date__c	,
                               A_Finding__c, B1_Findings__c, B2_T_Findings__c ,B2_6_Findings__c,B2_Finding__c,
                               Outcome__c,Facility_Number__c from Facility_Audits__r ORDER BY Name) 
                              FROM Facility__c i
                              WHERE i.Facility_Number__c = :facilityId LIMIT 1];    
       
            facility = facilityServices.setFSAuditRequired(facility);
       
            facility = facilityServices.rmvdueToWCA(facility);
            facility = facilityServices.rmvdueToWCACAPA(facility);
            facility = facilityServices.rmvdueToFS(facility);
            facility = facilityServices.rmvdueToFSCAPA(facility);
       
            facility = facilityServices.dueforNewLstngFS(facility);
            facility = facilityServices.dueforNewLstngWCA(facility);
       
   //       factory = FactoryServices.setFSCountry(factory);  
       
            facility = facilityServices.compliantWCA(facility);
            facility = facilityServices.compliantFS(facility);
             
            facility = facilityServices.pastWCACAPADeadline(facility);
            facility = facilityServices.pastFSCAPADeadline(facility);
       
            facility = facilityServices.pastWCAAuditDeadline(facility);      
            facility = facilityServices.pastFSAuditDeadline(facility);
       
            facility = facilityServices.findlatestauditdates(facility);
            facility = facilityServices.onsiteinvestigate(facility);       
            facility = facilityServices.calcNoAudits(facility);
       
            facility = facilityServices.pendingWCACAPA(facility);
            facility = facilityServices.pendingFSCAPA(facility);
       
            facility = facilityServices.completedWCACAPA(facility);
            facility = facilityServices.completedFSCAPA(facility);
       
            facility = facilityServices.setOverallRisk(facility);
       
 // Check if the facility has sub contractors
 // Issue a SQL Statement to get the facility with subcontractors
 // Loop through sub facilities and
 // Calculate green status for each facility    
 // save the block status. 
 // If one of the sub contractors has a block status then 
 // set block the main facility.
 // Bypass this logic if the are no sub contractors
 // 
 // 
 // I need a trigger that checks that there are no subcontracting loops
 // master --> sub contractor --> master
 // 
 // 
            facility = facilityServices.calcGreenStatus(facility);
       
           try {
            Database.update(facility);
              }
            catch(DmlException e) {
                return e.getMessage();
          }
       
              Return 'Facility Action Updated';
           }
}