global with sharing  class FacilityServices {
       
public static String annualWCA = 'Annual WCA';
public static String periodicFS = 'Periodic FS';
public static String followUpWCA = 'WCA Follow Up CAPA';


public static String followUpFS = 'FS Follow Up CAPA';
public static String onsiteinvest = 'On Site Investigation';
public static String fcActive = 'Active';
public static String fcDelisted = 'Delisted';

public static date compdate = date.parse('09/01/2014');
// Max Days Calculations 
// 
// 
// Green List Criteria WCA
public static Integer maxDays_1 = -365 - 30 * 4;
    // Green List Criteria CAPA's
public static Integer maxDays_2 = -365 * 3;
// WCA Pending
public static Integer maxDays_3 = -365;
// To Remove WCA
public static Integer maxDays_4 = -365 - 30 * 3;
// Green List Criteria WCA/FS CAPA
public static Integer maxDays_5 = -30;
// Green List Criteria FS
public static Integer maxDays_6 = -365 * 3 - 30 * 4;
// To Remove FS
public static Integer maxDays_7 = -365 * 3 - 30 * 4;
    
    

     
// This method will determine On Site Investigation
    webservice static Facility__c onsiteInvestigate(Facility__c facility){
        
        
     Facility_Audits__c fcltyaudit = new  Facility_Audits__c();
        
     fcltyaudit = findLatestAuditReq(facility, onsiteinvest);
        
        
      if( fcltyaudit.Name == null) {
            
            facility.On_Site_Investigation_Not_Completed__c = False;
            Return facility;
      }
        else {
                   
            
     If((facility.Facility_Status__c == fcActive || 
        facility.Facility_Status__c == fcDelisted) &&
        fcltyaudit.Audit_Date__c == null){
         
            facility.On_Site_Investigation_Not_Completed__c = True;}
        else{
             facility.On_Site_Investigation_Not_Completed__c = False;
        }
              
       Return facility;
        }
    }
 
// This method will determine the WCA Past Audit Deadline WCA_Past_CAPA_Deadline__cc
    webservice static Facility__c pastFSCAPADeadline(Facility__c facility){
        
        
     Facility_Audits__c fcltyaudit = new Facility_Audits__c();
        
     fcltyaudit = findLatestAuditReq(facility, followUpFS);
     
      system.debug('Test 01 ' + fcltyaudit.Audit_Group__c);
        
        
      if(fcltyaudit.Name == null  || fcltyaudit.CAPA_Due_Date__c == NULL) {
            
            facility.Past_CAPA_Deadline_FS__c = False;
            Return facility;
      }
        else {
            
     Integer numDays = 0;
     
     Date todayDiff = date.today();
        
     Date startDate = date.newInstance(2000,1,1);
     Integer duedaysDiff = Math.ABS(fcltyaudit.CAPA_Due_Date__c.daysbetween(startDate));
     Integer todaydaysDiff = Math.ABS(todayDiff.daysBetween(startDate));
        
     If(facility.Facility_Status__c == fcActive &&
        fcltyaudit.Audit_Date__c == null &&
        facility.FS_Audit_Required__c == True &&
        duedaysDiff < todaydaysDiff){
         
            facility.Past_CAPA_Deadline_FS__c = True;}
        else{
             facility.Past_CAPA_Deadline_FS__c = False;
        }
              
       Return facility;
        }
    }
         
      
  // 
 //   
 // This method will determine the WCA Past Audit Deadline WCA_Past_CAPA_Deadline__cc
    webservice static Facility__c pastWCACAPADeadline(Facility__c facility){
        
        
     Facility_Audits__c fcltyaudit = new Facility_Audits__c();
        
     fcltyaudit = findLatestAuditReq(facility, followUpWCA);
    
      if(fcltyaudit.Name == null  || fcltyaudit.CAPA_Due_Date__c == NULL) {
            
            facility.Past_Audit_Deadline_WCA__c = False;
            Return facility;
      }
        else {
            
     Integer numDays = 0;
  
            
     Date todayDiff = date.today();
        
     Date startDate = date.newInstance(2000,1,1);
     Integer duedaysDiff = Math.ABS(fcltyaudit.CAPA_Due_Date__c.daysbetween(startDate));
     Integer todaydaysDiff = Math.ABS(todayDiff.daysBetween(startDate));
        
     If(facility.Facility_Status__c == fcActive &&
        fcltyaudit.Audit_Date__c == null &&
        duedaysDiff < todaydaysDiff){
         
            facility.Past_CAPA_Deadline_WCA__c = True;}
        else{
             facility.Past_CAPA_Deadline_WCA__c = False;
        }
              
       Return facility;
        }
    }  
 
// This method will determine the WCA Compliant WCA_Compliant__c
    webservice static Facility__c compliantFS(Facility__c facility){
        
        
     Facility_Audits__c fcltyaudit = new Facility_Audits__c();
        
     fcltyaudit = findLatestAudit(facility, periodicFS);
        
        
      if(fcltyaudit.Name == null || fcltyaudit.Audit_Date__c == null) {
            
            facility.FS_Compliant__c = False;
            Return facility;
      }
        else {
            
     Integer numDays = 0;
     
     Date todayDiff = date.today().adddays(maxdays_2);
        
     Date startDate = date.newInstance(2000,1,1);
     Integer auditdaysDiff = Math.ABS(fcltyaudit.Audit_Date__c.daysbetween(startDate));
     Integer todaydaysDiff = Math.ABS(todayDiff.daysBetween(startDate));
        
     If(facility.Facility_Status__c == fcActive  &&
        fcltyaudit.Audit_Request_Date__c != Null &&
        auditdaysDiff >= todaydaysDiff){
         
            facility.FS_Compliant__c = True;}
        else{
             facility.FS_Compliant__c = False;
        }
              
       Return facility;
        }
    }           
              
    
 // This method will determine the WCA Compliant WCA_Compliant__c
    webservice static Facility__c compliantWCA(Facility__c facility){
        
        
     Facility_Audits__c fcltyaudit = new Facility_Audits__c();
        
     fcltyaudit = findLatestAudit(facility, annualWCA);
     
      if(fcltyaudit.Name == null || fcltyaudit.Audit_Date__c == null) {
            
            facility.WCA_Compliant__c = False;
            Return facility;
      }
        else {
            
     Integer numDays = 0;
     
     Date todayDiff = date.today().adddays(maxdays_3);
        
     Date startDate = date.newInstance(2000,1,1);
     Integer auditdaysDiff = Math.ABS(fcltyaudit.Audit_Date__c.daysbetween(startDate));
     Integer todaydaysDiff = Math.ABS(todayDiff.daysBetween(startDate));
        
     If(facility.Facility_Status__c == fcActive &&
        auditdaysDiff >= todaydaysDiff){
         
            facility.WCA_Compliant__c = True;}
        else{
             facility.WCA_Compliant__c = False;
        }
              
       Return facility;
        }
    }

 // This method will determine the WCA CAPA Performed WCA_CAPA_Performed__c
    webservice static Facility__c completedWCACAPA(Facility__c facility){
        
        
     Facility_Audits__c fcltyaudit = new Facility_Audits__c();

        
     fcltyaudit = findLatestAudit(facility, followUpWCA);
 
        
      if(fcltyaudit.Name == null) {
            
            facility.WCA_CAPA_Completed__c = False;
            Return facility;
      }
        else {
                
     If(facility.Facility_Status__c == fcActive &&
        fcltyaudit.Audit_Date__c != null)
        {
         
            facility.WCA_CAPA_Completed__c = True;}
        else{
             facility.WCA_CAPA_Completed__c = False;
        }
              
       Return facility;
        }
    }  
    
  // This method will determine the FS CAPA Performed 
    webservice static Facility__c completedFSCAPA(Facility__c facility){
        
        
     Facility_Audits__c  fcltyaudit = new Facility_Audits__c();
 
        
    fcltyaudit = findLatestAudit(facility, followUpFS);

        
      if(fcltyaudit.Name == null) {
            
            facility.FS_CAPA_Completed__c = False;
            Return facility;
      }
        else {
            
     
     If(facility.Facility_Status__c == fcActive &&
        facility.FS_Audit_Required__c == True &&
        fcltyaudit.Audit_Date__c != null)
         {
            facility.FS_CAPA_Completed__c = True;}
        else{
             facility.FS_CAPA_Completed__c = False;
        }
              
       Return facility;
        }
    }  
        
// 
 //   
 // This method will determine the pending FS CAPA
    webservice static Facility__c pendingFSCAPA(Facility__c facility){
        
        
     Facility_Audits__c fcltyaudit = new Facility_Audits__c();
        
     fcltyaudit = findLatestAuditReq(facility, followUpFS);
     
      if(fcltyaudit.Name == null || fcltyaudit.CAPA_Due_Date__c == null) {
            
            facility.Pending_CAPA_FS__c = False;
            Return facility;
      }
        else {
            
     Integer numDays = 0;
     
     Date todayDiff = date.today();
        
     Date startDate = date.newInstance(2000,1,1);
     Integer duedaysDiff = Math.ABS(fcltyaudit.CAPA_Due_Date__c.daysbetween(startDate));
     Integer todaydaysDiff = Math.ABS(todayDiff.daysBetween(startDate));
        

     If(facility.Facility_Status__c == fcActive &&
        facility.FS_Audit_Required__c == True &&
         fcltyaudit.Audit_Date__c == null &&
        duedaysDiff >= todaydaysDiff){
         
            facility.Pending_CAPA_FS__c = True;}
        else{
             facility.Pending_CAPA_FS__c = False;
        }
              
       Return facility;
        }
    }
          
 // 
 //   
 // This method will determine the WCA Past Audit Deadline WCA_Pending_CAPA__c
    webservice static Facility__c pendingWCACAPA(Facility__c facility){
        
        
     Facility_Audits__c fcltyaudit = new Facility_Audits__c();
        
     fcltyaudit = findLatestAuditReq(facility, followUpWCA);
        
        
      if(fcltyaudit.Name == null) {
            
            facility.Pending_CAPA_WCA__c = False;
            Return facility;
      }
        else {
            
     Integer numDays = 0;
     
     Date todayDiff = date.today();
           
            
     Date startDate = date.newInstance(2000,1,1);
     Integer duedaysDiff = Math.ABS(fcltyaudit.CAPA_Due_Date__c.daysbetween(startDate));
     Integer todaydaysDiff = Math.ABS(todayDiff.daysBetween(startDate));
        
 
            
       
     If(facility.Facility_Status__c == fcActive &&
        fcltyaudit.Audit_Date__c == null &&
        duedaysDiff >= todaydaysDiff){
         
            facility.Pending_CAPA_WCA__c = True;}
        else{
             facility.Pending_CAPA_WCA__c = False;
        }
              
       Return facility;
        }
    }    
    
// This method will determine the FS Past Audit Deadline FS_Past_Audit_Deadline__c
    webservice static Facility__c pastFSAuditDeadline(Facility__c facility){
        
        
     Facility_Audits__c fcltyaudit = new Facility_Audits__c();
        
     fcltyaudit = findLatestAudit(facility, periodicFS);
     
      if(fcltyaudit.Name == null || fcltyaudit.Audit_date__c == null) {
            
            facility.Past_CAPA_Deadline_FS__c = False;
            Return facility;
      }
        else {
            
     Integer numDays = 0;
     
     Date todayDiff = date.today().addDays(maxdays_2);
        
     Date startDate = date.newInstance(2000,1,1);
     Integer auditdaysDiff = Math.ABS(  fcltyaudit.Audit_Date__c.daysbetween(startDate));
     Integer todaydaysDiff = Math.ABS(todayDiff.daysBetween(startDate));
        

       
     If(facility.Facility_Status__c == fcActive  &&
        facility.FS_Audit_Required__c == True &&
        auditdaysDiff < todaydaysDiff){
         
            facility.Past_CAPA_Deadline_FS__c = True;}
        else{
             facility.Past_CAPA_Deadline_FS__c = False;
        }
              
       Return facility;
        }
    }
       
    
 // This method will determine the WCA Past Audit Deadline WCA_Past_Audit_Deadline__c
    webservice static Facility__c pastWCAAuditDeadline(Facility__c facility){
        
        
     Facility_Audits__c fcltyaudit = new Facility_Audits__c();
        
     fcltyaudit = findLatestAudit(facility, annualWCA);
     
      if(fcltyaudit.Name == null || fcltyaudit.Audit_Date__c == null) {
            
            facility.Past_CAPA_Deadline_WCA__c = False;
            Return facility;
      }
        else {
            
     Integer numDays = 0;
     
     Date todayDiff = date.today().addDays(maxdays_3);
        
     Date startDate = date.newInstance(2000,1,1);
     Integer auditdaysDiff = Math.ABS( fcltyaudit.Audit_date__c.daysbetween(startDate));
     Integer todaydaysDiff = Math.ABS(todayDiff.daysBetween(startDate));
               
     If(facility.Facility_Status__c == fcActive &&
        auditdaysDiff < todaydaysDiff){     
            facility.Past_CAPA_Deadline_WCA__c = True;}
        else{
             facility.Past_CAPA_Deadline_WCA__c = False;
        }
              
       Return facility;
        }
    }
 

    
    
    
 // This method will determine the overall risk rating of the factory 
    webservice static Facility__c setOverallRisk(Facility__c facility){
        
        boolean high = false;
        boolean medium = false;
        boolean low = false;
        integer i = 0;
        
     // Loop through each audit record to determine risk 
   // 
     
    for(Facility_Audits__c audit : facility.Facility_Audits__r){
               if (audit.Outcome__c == 'High'){
                  high = true;
                    break;
                 }
              if (audit.Outcome__c == 'Low'){
                   low = true;
                      break;
                 }
              if (audit.Outcome__c == 'Medium'){
                   medium = true;
                      break;
                 }
                  i++;
             }     
                    
        if (high) {
            facility.Overall_Risk__c = 'High';
        } else{
            if(medium){
                 facility.Overall_Risk__c = 'Medium';
            }else{
               if(low){
                 facility.Overall_Risk__c = 'Low';
                  }else{
                     facility.Overall_Risk__c = '';
               }
            }
        }
      if(facility.Unauthorized_Sub_Contracting__c == 'Yes'){
         facility.Overall_Risk__c = 'High';
          }
         return facility;        
    }

    // This calculated the number of audits 
//  Number of Audit Records which were completed after September 1st, 2014
//  excluding On-Site Investigation
//   
    public static Facility__c  calcNoAudits(Facility__c facility){ 
    
    Integer numDays = 0;
            
   Date prevWCACapaDate = date.newInstance(2000,1,1);    
   Date prevLCLWCACapaDate = date.newInstance(2000,1,1); 
   Date prevFSCapaDate = date.newInstance(2000,1,1);
   Date prevLCLFSCapaDate = date.newInstance(2000,1,1);
        
   Date startDate = date.newInstance(2014,9,1);
        
   Date wcaCapa = Null;        
   Integer auditdaysDiff = 0;     
   Integer auditcount = 0;
   Integer auditfindcount = 0;
   Integer Acount = 0;
   Integer B1count = 0;
   Integer B2count = 0;
   Integer B26count = 0;
   Integer B2Tcount = 0;
        
   Integer i = 0;  
        
     for(Facility_Audits__c audit : facility.Facility_Audits__r){
         
         
         if(audit.Audit_Date__c != NULL){
           auditdaysDiff = audit.Audit_Date__c.daysbetween(startDate);
         } else {
            auditdaysDiff =0; 
         }
    
       if(audit.CAPA_Due_Date__c != Null) {
           
        if(audit.Audit_Group__c == followUpWCA &&
           audit.Audit_Date__c == Null &&
            audit.CAPA_Due_Date__c < prevWCACapaDate)
		  {
               prevWCACapaDate = audit.CAPA_Due_Date__c;
           }
       }
         
        if(audit.Audit_Group__c == followUpFS &&
           audit.Audit_Date__c == Null &&
            audit.CAPA_Due_Date__c < prevFSCapaDate)
		  {
               prevFSCapaDate = audit.CAPA_Due_Date__c;
           }
         
         
         if(audit.Audit_Group__c != onsiteinvest &&
              auditdaysDiff < 0)  
            {  
     				auditcount++;
                } 
         
      
            if(audit.Audit_Group__c != onsiteinvest &&
              auditdaysDiff < 0 && (
              audit.A_Finding__c == 'Yes' ||
              audit.B1_Findings__c == 'Yes' ||
              audit.B2_Finding__c == 'Yes' ||
              audit.B2_6_Findings__c == 'Yes' ||
              audit.B2_T_Findings__c == 'Yes'))  
            {  
     				auditfindcount++;
           } 
         // Count A findings
           if(audit.Audit_Group__c != onsiteinvest &&
                 auditdaysDiff < 0 && 
                audit.A_Finding__c == 'Yes'){
                  Acount++;
              }
          // Count B1 findings
           if(audit.Audit_Group__c != onsiteinvest &&
                auditdaysDiff < 0 && 
              audit.B1_Findings__c == 'Yes'){
                  B1count++;
              }
         
         // Count B2 Findings
          if(audit.Audit_Group__c != onsiteinvest &&
               auditdaysDiff < 0 && 
              audit.B2_Finding__c == 'Yes'){
                  B2count++;
              }
         // Count B26 Findings
          if(audit.Audit_Group__c != onsiteinvest &&
                 auditdaysDiff < 0 && 
              audit.B2_6_Findings__c == 'Yes'){
                  B26count++;
              }
         // Count B2T Findings
          if(audit.Audit_Group__c != onsiteinvest &&
                 auditdaysDiff < 0 && 
              audit.B2_T_Findings__c == 'Yes'){
                  B2Tcount++;
              }
               
            i++;
        } 
                     
        facility.No_of_Audits__c = auditcount;
        facility.No_of_Audits_with_Findings__c = auditfindcount;
        facility.No_Of_A_Findings__c = Acount;
        facility.No_Of_B1_Findings__c = B1count;
        facility.No_Of_B2_Findings__c = B2count;
        
        facility.No_Of_B2_6_Findings__c = B26count;
        facility.No_Of_B2_T_Findings__c = B2Tcount;
        
        Return facility;   
    } 
 
       
    
    
     // This method will determine the WCA Past LCL CAPA Audit Deadline WCA_Past_LCL_CAPA_Deadline__c
    webservice static Facility__c findlatestauditdates(Facility__c facility){
        
        
     Facility_Audits__c fcltyaudit = new Facility_Audits__c();
         
        
 // Find latest audit  for Periodic FS      
    fcltyaudit = findLatestAudit(facility, periodicFS);     
      if(fcltyaudit.Audit_Date__c == NULL) { 
            facility.Latest_Periodic_FS_Date__c = Null;
      }
        else {

        facility.Latest_Periodic_FS_Date__c = fcltyaudit.Audit_Date__c;       
        }
 
 // Find latest audit for Annual WCA      
     fcltyaudit = findLatestAudit(facility, annualWCA); 
     
      if(fcltyaudit.Name == null || fcltyaudit.Audit_Date__c == NULL) {          
            facility.Latest_Annual_WCA_Date__c = Null;
      }
        else {
        facility.Latest_Annual_WCA_Date__c = fcltyaudit.Audit_Date__c;       
        }
        
 // Find latest audit due date for Follow-Up WCA  CAPA    
    fcltyaudit = findLatestAuditWCACAPA(facility, true );     
      if(fcltyaudit.Name == null) {          
            facility.Latest_WCA_CAPA_Due_Date__c = Null;
      }
        else {
        facility.Latest_WCA_CAPA_Due_Date__c = fcltyaudit.CAPA_Due_Date__c;       
        }
        
 // Find latest audit date  for Follow-Up WCA  CAPA  
     fcltyaudit = findLatestAuditWCACAPA(facility, false );     
      if(fcltyaudit.Name == null) {          
            facility.Latest_WCA_CAPA_Date__c = Null;
      }
        else {
        facility.Latest_WCA_CAPA_Date__c = fcltyaudit.Audit_Date__c;       
        }
        
        
 // Find latest CAPA due date forFollow-Up FS  CAPA    
     fcltyaudit = findLatestAuditFSCAPA(facility, true);     
      if(fcltyaudit.Name == null) {          
            facility.Latest_FS_CAPA_Due_Date__c = Null;
      }
        else {
        facility.Latest_FS_CAPA_Due_Date__c = fcltyaudit.CAPA_Due_Date__c;       
        } 
 
 // Find latest audit date for Follow-Up FS  CAPA    
     fcltyaudit = findLatestAuditFSCAPA(facility, false);     
      if(  fcltyaudit.Name == null) {          
            facility.Latest_FS_CAPA_Date__c = Null;
      }
        else {
        facility.Latest_FS_CAPA_Date__c =  fcltyaudit.Audit_Date__c;       
        }
        
  // Find latest audit On-Site Investigation      
     fcltyaudit = findLatestAudit(facility, onsiteinvest );     
      if(fcltyaudit.Name == null || fcltyaudit.Audit_Date__c == NULL) {          
            facility.Latest_On_Site_Investigation_Date__c = Null;
      }
        else {
        facility.Latest_On_Site_Investigation_Date__c = fcltyaudit.Audit_Date__c;       
        } 
        
      Return facility; 
    } 

// This method will determine the FS Due for new listing
    webservice static Facility__c dueforNewLstngFS(Facility__c facility){
        
        
     Facility_Audits__c fcltyaudit = new Facility_Audits__c();
        
        fcltyaudit = findLatestAuditReq(facility, periodicFS);

        if(fcltyaudit == null) {
            
            facility.FS_Due_for_new_listing__c = False;
            Return facility;
        }
        else {
                      
     If(facility.Facility_Status__c == fcActive &&
        facility.FS_Audit_Required__c == True &&
        fcltyaudit.Audit_Date__c == null){
         
            facility.FS_Due_for_new_listing__c = True;}
        else{
             facility.FS_Due_for_new_listing__c = False;
         }
        }
         Return facility;
    }
    
    
// This method will determine the Initial WCA
    webservice static Facility__c dueforNewLstngWCA(Facility__c facility){
            
     Facility_Audits__c   fcltyaudit = new Facility_Audits__c();
       
     fcltyaudit = findLatestAuditReq(facility, annualWCA);

        
        if(fcltyaudit == null) {   
            facility.WCA_Due_for_new_listing__c = False;
            Return facility;
        }
        else {
            
            
     If(facility.Facility_Status__c == fcActive  &&
       fcltyaudit.Audit_Date__c == null){
           facility.WCA_Due_for_new_listing__c = True;}
        else{       
             facility.WCA_Due_for_new_listing__c = False;
        }           
       }
         Return facility;
    }
 
    
//  *************************************************************
//  						REMOVED FROM GREEN LIST DUE
//  ***************************************************************  

 // This method will determine the RemDueForWCA 
    webservice static Facility__c rmvdueToWCA( Facility__c facility){
        
        
     Facility_Audits__c  fcltyaudit = new Facility_Audits__c();
        
       fcltyaudit = findLatestAudit(facility, annualWCA);
     
        if(fcltyaudit.Name == null || fcltyaudit.Audit_Date__c == null) {
            
            Facility.Remove_from_Green_List_Due_to_WCA__c = false;
            Return facility;
        }
        else {
            
     Integer numDays = 0;
     
            Date todayDiff = date.today().addDays(maxDays_1);
        
     Date startDate = date.newInstance(2000,1,1);
     Integer auditdaysDiff = Math.ABS( fcltyaudit.Audit_date__c.daysbetween(startDate));
     Integer todaydaysDiff = Math.ABS(todayDiff.daysBetween(startDate));
        

       
     If(facility.Facility_Status__c == 'Active' && auditdaysDiff < todaydaysDiff){
         
            facility.Remove_from_Green_List_Due_to_WCA__c = True;}
        else{
             facility.Remove_from_Green_List_Due_to_WCA__c = False;
        }
              
       Return facility;
        }
    }   
 
// This method will determine the Due To WCA CAPA  
    webservice static Facility__c rmvdueToWCACAPA(Facility__c facility){
             
     Facility_Audits__c fcltyaudit = new Facility_Audits__c();
        
     fcltyaudit = findLatestAuditGrp(facility, followUpWCA);
             
        if(fcltyaudit.Name == null ||  fcltyaudit.CAPA_Due_Date__c == null) {
            facility.Removed_from_Greenlist_Due_to_WCA_CAPA__c = False;
            Return facility;
        }
        else {
            
     Integer numDays = 0;
     
     Date todayDiff = date.today().adddays(maxdays_5);
        
     Date startDate = date.newInstance(2000,1,1);
     Integer duedaysDiff = Math.ABS(fcltyaudit.CAPA_Due_Date__c.daysbetween(startDate));
     Integer todaydaysDiff = Math.ABS(todayDiff.daysBetween(startDate));
        
       
     If(facility.Facility_Status__c == 'Active' && duedaysDiff < todaydaysDiff){
         
            facility.Removed_from_Greenlist_Due_to_WCA_CAPA__c = True;}
        else{
            facility.Removed_from_Greenlist_Due_to_WCA_CAPA__c= False;
        }
              
       Return facility;
        }
    }    
// This method will determine the DueToFS 
    webservice static Facility__c rmvdueToFS( Facility__c facility){
        
        
     Facility_Audits__c fcltyaudit = new Facility_Audits__c();
        
     fcltyaudit = findLatestAudit(facility, periodicFS);
    
        
      if(fcltyaudit.Name == null || fcltyaudit.Audit_Date__c == Null) {
            
            facility.Removed_from_Green_List_Due_to_FS__c = False;
            Return facility;
        }
        else {
            
     Integer numDays = 0;
     
     Date todayDiff = date.today().addDays(maxdays_7);
       
     Date startDate = date.newInstance(2000,1,1);
     Integer auditdaysDiff = Math.ABS(fcltyaudit.Audit_date__c.daysbetween(startDate));
     Integer todaydaysDiff = Math.ABS(todayDiff.daysBetween(startDate));
 
            
     If(facility.Facility_Status__c == 'Active' && 
        auditdaysDiff < todaydaysDiff &&
      facility.FS_Audit_Required__c == True){
         
            facility.Removed_from_Green_List_Due_to_FS__c= True;}
        else{
             facility.Removed_from_Green_List_Due_to_FS__c = False;
        }
   
       Return facility;
      }
    }

             
   // This method will determine the Due To FS CAPA  
    webservice static Facility__c rmvdueToFSCAPA(Facility__c facility){
             
     Facility_Audits__c fcltyaudit = new Facility_Audits__c();
        

     fcltyaudit = findLatestAuditGrp(facility, followUpFS);  
     if(fcltyaudit.Name == null || fcltyaudit.CAPA_Due_Date__c == null) {
            
            facility.Removed_from_Green_List_Due_to_FS_CAPA__c = False;
            Return facility;
        }
        else {
     Integer numDays = 0;
     
     Date today1 = date.today().adddays(maxdays_5);
        
        
     Date startDate = date.newInstance(2000,1,1);
     Integer duedaysDiff = Math.ABS(fcltyaudit.CAPA_Due_Date__c.daysbetween(startDate));
     Integer todayDiff = Math.ABS(today1.daysBetween(startDate));
    
        
     If(facility.Facility_Status__c == 'Active' && duedaysDiff < todayDiff &&
         facility.FS_Audit_Required__c == True){
         
            facility.Removed_from_Green_List_Due_to_FS_CAPA__c = True;}
        else{
             facility.Removed_from_Green_List_Due_to_FS_CAPA__c = False;
        }
              
       Return facility;
        }
    }
    
    
//  *************************************************************
//  						GREEN LIST METHODS
//  ***************************************************************  
     
    
// This method will determine the if FS Audit Required is true or false
   public static Facility__c setFSAuditRequired(Facility__c facility){
        
        boolean high = false;
        boolean medium = false;
        boolean low = false;
        integer i = 0;
      
     Facility_Audits__c fcltyaudit = new Facility_Audits__c();
        

     fcltyaudit  = findLatestFSRequired(facility, periodicFS); 
                 
     if(String.isNotBlank(facility.FS_Required_country__c) ||
       fcltyaudit.Audit_Request_Date__c != Null) {
        
            facility.FS_Audit_Required__c = True;
        }else{
        
            facility.FS_Audit_Required__c = False;
        }
         return facility;        
    }
 
 // This methods calculates the Green Status for WCA 
 webservice static Facility__c setWCAAudits(Facility__c facility, String auditgroup){
        
        
      Facility_Audits__c fcltyaudit = new Facility_Audits__c();
        
       fcltyaudit = facilityServices.findLatestAudit(facility, auditgroup);
     
     
     if (fcltyaudit == null || fcltyaudit.Audit_Date__c == Null) {
       facility.WCA_Greenlist_Criteria__c = false;
      
         return facility;
     }
     
      if(fcltyaudit.Name != null ) {
      
            Integer numDays = 0;
            
         Date todayDiff = date.today().addDays(maxdays_1);
       
         Date startDate = date.newInstance(2000,1,1);
         Integer auditdaysDiff = Math.ABS(fcltyaudit.Audit_Date__c.daysbetween(startDate));
         Integer todaydaysDiff = Math.ABS(todayDiff.daysBetween(startDate));
         
          
         If(auditdaysDiff >= todaydaysDiff){
         
              facility.WCA_Greenlist_Criteria__c = true;}
		 else {
            facility.WCA_Greenlist_Criteria__c = false;
        }
     
      } 
          Return facility;
     
    }
    
 // This methods calculates the Green Status for  FS Audits
 webservice static Facility__c setFSAudits(Facility__c facility, String auditgroup){
        
        
      Facility_Audits__c fcltyaudit = new Facility_Audits__c();
        
       fcltyaudit = facilityServices.findLatestAudit(facility, auditgroup);
     

     
     if ( fcltyaudit== null ||  fcltyaudit.Audit_Date__c == Null) {
        facility.FS_Green_list_criteria__c = false;
         return facility;
     }
     
      if( fcltyaudit.Name != null ) {
      
            Integer numDays = 0;
            
         Date todayDiff = date.today().addDays(maxdays_6);
       
         Date startDate = date.newInstance(2000,1,1);
         Integer auditdaysDiff = Math.ABS( fcltyaudit.Audit_Date__c.daysbetween(startDate));
         Integer todaydaysDiff = Math.ABS(todayDiff.daysBetween(startDate));
                    
         If(auditdaysDiff >= todaydaysDiff){
         
             facility.FS_Green_list_criteria__c = true;}
       else {
            facility.FS_Green_list_criteria__c = false;
        }
     
      }
          Return facility;
     
    }
// This methods calculates the Green Status for FS CAPA Countries   
    public static Facility__c  setFSCAPA(Facility__c facility){
 
      Facility_Audits__c fcltyaudit = new Facility_Audits__c();
 
      fcltyaudit = facilityServices.findLatestAuditFSCAPA(facility, true);
 
     if (fcltyaudit.Name == null) {
         facility.FS_CAPA_Green_list_criteria__c = true;
         return facility;
     }
     if(fcltyaudit.Audit_Date__c != null){
           facility.FS_CAPA_Green_list_criteria__c = true; 
           return facility;          
        }  
        
      if(fcltyaudit.Name != Null  &&
         fcltyaudit.Audit_Date__c == null)
         {         
              Integer numDays = 0;
     
              Date todayDiff = date.today().addDays(maxDays_5);
        
              Date startDate = date.newInstance(2000,1,1);
                       
              Integer duedaysDiff = Math.ABS(fcltyaudit.CAPA_Due_Date__c.daysbetween(startDate));
            
              Integer todaydaysDiff = Math.ABS(todayDiff.daysBetween(startDate));
               
             If(duedaysDiff >= todaydaysDiff){       
                 facility.FS_CAPA_Green_list_criteria__c = true;
             } else {
                facility.FS_CAPA_Green_list_criteria__c = false;
          }
        }
        Return facility;
    }
 
// This methods calculates the Green Status for WCA CAPA's   
    public static Facility__c setWCACAPA(Facility__c facility){
     
     Facility_Audits__c fcltyaudit = new Facility_Audits__c();
        
      fcltyaudit = facilityServices.findLatestAuditWCACAPA(facility,true);  
        
     if (fcltyaudit.Name == null) {         
        facility.WCA_CAPA_GreenList_Criteria__c = true;
         return facility;
     } 
   
     if(fcltyaudit.Audit_Date__c != null){
           facility.WCA_CAPA_Greenlist_Criteria__c = true; 
           return facility;          
        }   
        
       if(fcltyaudit.Name != Null &&
          fcltyaudit.Audit_Date__c == null)
       {    
        
             Integer numDays = 0;
            
             Date todayDiff = date.today().addDays(maxDays_5);
        
             Date startDate = date.newInstance(2000,1,1);
         
             Integer duedaysDiff = Math.ABS(fcltyaudit.CAPA_Due_Date__c.daysbetween(startDate));
             Integer todaydaysDiff = Math.ABS(todayDiff.daysBetween(startDate));
               
              if(fcltyaudit.CAPA_Due_Date__c != Null &&
                   duedaysDiff >= todaydaysDiff){
                       
                 facility.WCA_CAPA_Greenlist_Criteria__c = true;
              } else {
                  facility.WCA_CAPA_Greenlist_Criteria__c = false;
             }        
        }
       Return facility; 
       
    }
   
// Calculate the Green Status for a Factory
// 
public static Facility__c calcGreenStatus(Facility__c facility){
    
/// Examine WCA Condition
   		  facility = facilityServices.setWCAAudits(facility,facilityServices.annualWCA);
         
 // Examine WCA CAPA conditions
   
   		  facility = facilityServices.setWCACAPA(facility); 
      
     
// Check if FS Country
     
     if (facility.FS_Audit_Required__c == True) {  
             // Examine FS Condition
      		       facility = facilityServices.setFSAudits(facility,facilityServices.periodicFS);
    
              // Examine FS CAPA Condition
         
           		  facility = facilityServices.setFSCAPA(facility); 
    
     } else {
       facility.FS_Green_list_criteria__c = true;
        facility.FS_CAPA_Green_list_criteria__c = true;
     }
     
 // Calculate Overall Greenlist Status
 // 
   
    if(facility.WCA_CAPA_GreenList_Criteria__c == true &&
       facility.WCA_GreenList_Criteria__c == true &&
       facility.FS_Green_list_criteria__c == true &&
       facility.FS_CAPA_Green_list_criteria__c == true &&
      facility.Facility_Status__c == 'Active')  {
           facility.Green_List_Status__c = 'Unblocked';
      }else{
          facility.Green_List_Status__c = 'Blocked';
      }
       
    Return facility;
    } 
//  *************************************************************
//  						UTILITY METHODS
//  ***************************************************************  
    
 
// This method finds the latest audit records within an audit group for a facility
    webservice static Facility_Audits__c findLatestAudit(Facility__c facility, String auditGroup){
                            
        // Loop through each audit group and compare the dates
        // 
  Integer i = 1;
  Integer numDays = 0;
  Integer compDays = 0;
        
  Date startDate = Date.newInstance(2000, 1, 1);
  Facility_Audits__c latestAudit = new Facility_Audits__c();
  Facility_Audits__c latestAuditReq = new Facility_Audits__c();  
        
     for(Facility_Audits__c audit : facility.Facility_Audits__r){
         
            if(audit.Audit_Group__c == auditGroup && 
              audit.Audit_Date__c != NULL)  
            {  
                numDays = startDate.daysBetween(audit.Audit_Date__c);
                if(numDays > compDays) {
                    latestAudit = audit;
                    compDays = numDays;
                }          
            }
 
            i++;
        } 
         
        return latestAudit;
    }

    
 
// This method finds the latest audit records within an audit group for a facility
// The difference to the previous method is that it looks for an Audit_Date of Null. This
// is necessary for the ITSFactorAudt record generation for Intertek
// 
  webservice static Facility_Audits__c findLatestAuditReq(Facility__c facility, String auditGroup){
        
                                             
  Facility_Audits__c latestAudit = new Facility_Audits__c();
  Date startDate = Date.newInstance(2000, 1, 1);   
        
  Integer numDays = 0;
  Integer compDays = 0;
  Integer i = 0;      
       
     for(Facility_Audits__c audit : facility.Facility_Audits__r){
                    
         if(audit.Audit_Date__c == Null && 
            audit.Audit_Group__c == auditgroup)  
            {  
           
             numDays = startDate.daysBetween(audit.Audit_Request_Date__c);
                
                if(numDays > compDays) {
                    latestAudit = audit;
                    compDays = numDays;
                }
            }  
       
          i++;      
     }             

        return latestAudit;    
    } 

 
// This method finds the latest audit records within an audit group for a facility
// The difference to the previous method is that it looks for an Audit_Date of Null. This
// is necessary for the ITSFactorAudt record generation for Intertek
// 
  webservice static Facility_Audits__c findLatestFSRequired(Facility__c facility, String auditGroup){
        
                                             
  Facility_Audits__c latestAudit = new Facility_Audits__c();
  Date startDate = Date.newInstance(2000, 1, 1);   
        
  Integer numDays = 0;
  Integer compDays = 0;
  Integer i = 0;      
       
     for(Facility_Audits__c audit : facility.Facility_Audits__r){
                    
         if(audit.Audit_Group__c == auditgroup)  
            {  
               latestAudit = audit;
               break;               
            }  
       
          i++;      
     }             

        return latestAudit;    
    } 
    
    
// This method finds the latest audit records for two audit groups for a facility
    webservice static Facility_Audits__c findLatestAuditGrp(Facility__c facility, String auditGrp1){
                                          
        // Loop through each audit group and compare the dates
        // 
  Integer i = 1;
  Integer numDays = 0;
  Integer compDays = 0;
        
  Date startDate = Date.newInstance(2000, 1, 1);
  Facility_Audits__c latestAudit = new Facility_Audits__c();
     
     for(Facility_Audits__c audit : facility.Facility_Audits__r){
        
            if(audit.Audit_Group__c == auditGrp1 && 
              audit.Audit_Date__c == NULL)  
            {  
                 
              numDays = startDate.daysBetween(audit.Audit_Request_Date__c);
                if(numDays > compDays) {
                    latestAudit = audit;
                    compDays = numDays;
                }          
            }
 
            i++;
        }             

        return latestAudit;    
    }
    
    
// This method finds the latest audit records within an audit CAPA group for a factory 
// dateMode = True --> Include only Audit Date == Null
// dateMode = False --> Include only Audit Date != Null
// 
    webservice static Facility_Audits__c findLatestAuditWCACAPA(Facility__c facility, Boolean datemode){
     
  Integer i = 1;
  Integer numDays = 0;
  Integer compDays = 0;
        
  Date startDate = Date.newInstance(2000, 1, 1);
  Facility_Audits__c latestAudit = new Facility_Audits__c();


     // Loop through each audit group and compare the dates
     for(Facility_Audits__c audit : facility.Facility_Audits__r){
                            
            if(audit.Audit_Group__c == followUpWCA &&  
                audit.Audit_Date__c == NULL &&
                datemode == true)  
            {  
                numDays = startDate.daysBetween(audit.Audit_Request_Date__c);
                if(numDays > compDays) {
                    latestAudit = audit;
                    compDays = numDays;
                }          
            }
 
          if(audit.Audit_Group__c == followUpWCA &&
                audit.Audit_Date__c != NULL &&
                datemode == false)  
            {  
                numDays = startDate.daysBetween(audit.Audit_Request_Date__c);
                if(numDays > compDays) {
                    latestAudit = audit;
                    compDays = numDays;
                }          
            }


            i++;
        }             

        return latestAudit;    
    }
    
   webservice static Facility_Audits__c findLatestAuditFSCAPA(Facility__c facility, Boolean datemode){
     
  Integer i = 1;
  Integer numDays = 0;
  Integer compDays = 0;
        
  Date startDate = Date.newInstance(2000, 1, 1);
  Facility_Audits__c latestAudit = new Facility_Audits__c();

     // Loop through each audit group and compare the dates
     for(Facility_Audits__c audit : facility.Facility_Audits__r){
         
        if(audit.Audit_Group__c == followUpFS &&
                 audit.Audit_Date__c == NULL &&
                 datemode == true)  
            {  
                numDays = startDate.daysBetween(audit.Audit_Request_Date__c);
                if(numDays > compDays) {
                    latestAudit = audit;
                    compDays = numDays;
                }          
            }      

        if(audit.Audit_Group__c == followUpFS &&
                 audit.Audit_Date__c != NULL &&
                 datemode == false)  
            {  
                numDays = startDate.daysBetween(audit.Audit_Request_Date__c);
                if(numDays > compDays) {
                    latestAudit = audit;
                    compDays = numDays;
                }          
            }
                                  
            i++;
        }             
    
        return latestAudit;    
    }
    
}