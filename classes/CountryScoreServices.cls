global with sharing class CountryScoreServices {

    
// Calculate WCA Compliant  
 public static CountryScoreCard__c calcWCACompliant(List<Facility__c> facility, Map<String, String> splmap, CountryScoreCard__c scorecard) {
        
        scorecard.PrdGrp1__c = 0;
        scorecard.PrdGrp2__c = 0;
        scorecard.PrdGrp3__c = 0;
        scorecard.PrdGrp4__c = 0;
        scorecard.PrdGrp5__c = 0;
        scorecard.PrdGrp6__c = 0;
        scorecard.PrdGrp7__c = 0;
        scorecard.PrdGrp8__c = 0;
        scorecard.PrdGrp9__c = 0;
        scorecard.PrdGrp10__c = 0;

     
   
      integer i = 0;
      
        for(Facility__c fclty : facility) {
            String productGroup = splmap.get(facility[i].Facility_Number__c);        
            if(productGroup == scorecard.Product_Group_1__c && 
                facility[i].WCA_Compliant__c == True) {
                  scorecard.PrdGrp1__c++;
               
            }
      	   if(productGroup == scorecard.Product_Group_2__c && 
                facility[i].WCA_Compliant__c == True) {
                  scorecard.PrdGrp2__c++;
            }
      	   if(productGroup == scorecard.Product_Group_3__c && 
                facility[i].WCA_Compliant__c == True) {
                  scorecard.PrdGrp3__c++;
     	    }
          if(productGroup == scorecard.Product_Group_4__c && 
                facility[i].WCA_Compliant__c == True) {
                  scorecard.PrdGrp4__c++;
       		 }
            if(productGroup == scorecard.Product_Group_5__c && 
                facility[i].WCA_Compliant__c == True) {
                  scorecard.PrdGrp5__c++;
      	  }
          if(productGroup == scorecard.Product_Group_6__c && 
                facility[i].WCA_Compliant__c == True) {
                  scorecard.PrdGrp6__c++;
      	  }
          if(productGroup == scorecard.Product_Group_7__c && 
                facility[i].WCA_Compliant__c == True) {
                  scorecard.PrdGrp7__c++;
      	  }
          if(productGroup == scorecard.Product_Group_8__c && 
                facility[i].WCA_Compliant__c == True) {
                  scorecard.PrdGrp8__c++;
      	    }
 
          if(productGroup == scorecard.Product_Group_9__c && 
                facility[i].WCA_Compliant__c == True) {
                  scorecard.PrdGrp9__c++;
      	    }
            
           if(productGroup == scorecard.Product_Group_10__c && 
                facility[i].WCA_Compliant__c == True) {
                  scorecard.PrdGrp10__c++;
      	    }
            i++;
        }
                
        Return scorecard;
        
       }
 
    // Calculate WCA Past Audit Deadline
  public static CountryScoreCard__c calcPastWCAAuditDeadline(List<Facility__c> facility, Map<String, String> splmap, CountryScoreCard__c scorecard) {
        
        scorecard.PrdGrp1__c = 0;
        scorecard.PrdGrp2__c = 0;
        scorecard.PrdGrp3__c = 0;
        scorecard.PrdGrp4__c = 0;
        scorecard.PrdGrp5__c = 0;
        scorecard.PrdGrp6__c = 0;
        scorecard.PrdGrp7__c = 0;
        scorecard.PrdGrp8__c = 0;
        scorecard.PrdGrp9__c = 0;
        scorecard.PrdGrp10__c = 0;
        
        integer i = 0; 
   
      
        for(Facility__c fctry : facility) {
           
            String productGroup = splMap.get(facility[i].Facility_Number__c);
     
       
            if(productGroup == scorecard.Product_Group_1__c && 
                facility[i].Past_Audit_Deadline_WCA__c == True) {
                  scorecard.PrdGrp1__c++;
               
            }
         if(productGroup == scorecard.Product_Group_2__c && 
                facility[i].Past_Audit_Deadline_WCA__c == True) {
                  scorecard.PrdGrp2__c++;
            }
         if(productGroup == scorecard.Product_Group_3__c && 
                facility[i].Past_Audit_Deadline_WCA__c == True) {
                  scorecard.PrdGrp3__c++;
        }
          if(productGroup == scorecard.Product_Group_4__c && 
                facility[i].Past_Audit_Deadline_WCA__c == True) {
                  scorecard.PrdGrp4__c++;
        }
        if(productGroup == scorecard.Product_Group_5__c && 
                facility[i].Past_Audit_Deadline_WCA__c == True) {
                  scorecard.PrdGrp5__c++;
        }
        if(productGroup == scorecard.Product_Group_6__c && 
                facility[i].Past_Audit_Deadline_WCA__c == True) {
                  scorecard.PrdGrp6__c++;
        }
        if(productGroup == scorecard.Product_Group_7__c && 
                facility[i].Past_Audit_Deadline_WCA__c == True) {
                  scorecard.PrdGrp7__c++;
        }
        if(productGroup == scorecard.Product_Group_8__c && 
                facility[i].Past_Audit_Deadline_WCA__c == True) {
                  scorecard.PrdGrp8__c++;
        }
        if(productGroup == scorecard.Product_Group_9__c && 
                facility[i].Past_Audit_Deadline_WCA__c == True) {
                  scorecard.PrdGrp9__c++;
        }
         if(productGroup == scorecard.Product_Group_10__c && 
                facility[i].Past_Audit_Deadline_WCA__c == True) {
                  scorecard.PrdGrp10__c++;
        }           
            
            i++;
        }
                
        Return scorecard;
        
       }
    
 // Calculate Due for New Listing / WCA Initial is actually Due for new listing / Name was changed
  public static CountryScoreCard__c calcWCAInitial(List<Facility__c> facility, Map<String, String> splmap, CountryScoreCard__c scorecard) {
        
        scorecard.PrdGrp1__c = 0;
        scorecard.PrdGrp2__c = 0;
        scorecard.PrdGrp3__c = 0;
        scorecard.PrdGrp4__c = 0;
        scorecard.PrdGrp5__c = 0;
        scorecard.PrdGrp6__c = 0;
        scorecard.PrdGrp7__c = 0;
        scorecard.PrdGrp8__c = 0;
        scorecard.PrdGrp9__c = 0;
        scorecard.PrdGrp10__c = 0;
        
        integer i = 0; 
      
        for(Facility__c fctry : facility) {
           
            String productGroup = splMap.get(facility[i].Facility_Number__c);
        
            if(productGroup == scorecard.Product_Group_1__c && 
                facility[i].WCA_Due_for_new_listing__c == True) {
                  scorecard.PrdGrp1__c++;
               
            }
     	    if(productGroup == scorecard.Product_Group_2__c && 
                facility[i].WCA_Due_for_new_listing__c == True) {
                  scorecard.PrdGrp2__c++;
            }
      	   if(productGroup == scorecard.Product_Group_3__c && 
                facility[i].WCA_Due_for_new_listing__c == True) {
                  scorecard.PrdGrp3__c++;
      	    }
           if(productGroup == scorecard.Product_Group_4__c && 
                facility[i].WCA_Due_for_new_listing__c == True) {
                  scorecard.PrdGrp4__c++;
            }
           if(productGroup == scorecard.Product_Group_5__c && 
                facility[i].WCA_Due_for_new_listing__c == True) {
                  scorecard.PrdGrp5__c++;
         }
         if(productGroup == scorecard.Product_Group_6__c && 
                facility[i].WCA_Due_for_new_listing__c == True) {
                  scorecard.PrdGrp6__c++;
         }
         if(productGroup == scorecard.Product_Group_7__c && 
                facility[i].WCA_Due_for_new_listing__c == True) {
                  scorecard.PrdGrp7__c++;
         }
         if(productGroup == scorecard.Product_Group_8__c && 
                facility[i].WCA_Due_for_new_listing__c == True) {
                  scorecard.PrdGrp8__c++;
         }
         if(productGroup == scorecard.Product_Group_9__c && 
                facility[i].WCA_Due_for_new_listing__c == True) {
                  scorecard.PrdGrp9__c++;
         }
            
                if(productGroup == scorecard.Product_Group_10__c && 
                facility[i].WCA_Due_for_new_listing__c == True) {
                  scorecard.PrdGrp10__c++;
         }
            i++;
        }
                
        Return scorecard;
        
       }
    
 // Calculate WCA CAPA Not Requested
public static CountryScoreCard__c calcWCACAPANotRequested(List<Facility__c> facility, Map<String, String> splmap, CountryScoreCard__c scorecard) {
        

        scorecard.PrdGrp1__c = 0;
        scorecard.PrdGrp2__c = 0;
        scorecard.PrdGrp3__c = 0;
        scorecard.PrdGrp4__c = 0;
        scorecard.PrdGrp5__c = 0;
        scorecard.PrdGrp6__c = 0;
        scorecard.PrdGrp7__c = 0;
        scorecard.PrdGrp8__c = 0;
        scorecard.PrdGrp9__c = 0;
        scorecard.PrdGrp10__c = 0;
        
        integer i = 0; 
      
        for(Facility__c fctry : facility) {
           
            String productGroup = splMap.get(facility[i].Facility_Number__c);
     
       
            if(productGroup == scorecard.Product_Group_1__c && 
                facility[i].WCA_CAPA_Not_Requested__c == True) {
                  scorecard.PrdGrp1__c++;
               
            }
         if(productGroup == scorecard.Product_Group_2__c && 
                facility[i].WCA_CAPA_Not_Requested__c == True) {
                  scorecard.PrdGrp2__c++;
            }
         if(productGroup == scorecard.Product_Group_3__c && 
                facility[i].WCA_CAPA_Not_Requested__c == True) {
                  scorecard.PrdGrp3__c++;
        }
          if(productGroup == scorecard.Product_Group_4__c && 
                facility[i].WCA_CAPA_Not_Requested__c == True) {
                  scorecard.PrdGrp4__c++;
        }
            if(productGroup == scorecard.Product_Group_5__c && 
                facility[i].WCA_CAPA_Not_Requested__c == True) {
                  scorecard.PrdGrp5__c++;
        }
         if(productGroup == scorecard.Product_Group_6__c && 
             facility[i].WCA_CAPA_Not_Requested__c == True) {
                  scorecard.PrdGrp6__c++;
        }
        if(productGroup == scorecard.Product_Group_7__c && 
             facility[i].WCA_CAPA_Not_Requested__c == True) {
                  scorecard.PrdGrp7__c++;
        }
        if(productGroup == scorecard.Product_Group_8__c && 
             facility[i].WCA_CAPA_Not_Requested__c == True) {
                  scorecard.PrdGrp8__c++;
        }
        if(productGroup == scorecard.Product_Group_9__c && 
             facility[i].WCA_CAPA_Not_Requested__c == True) {
                  scorecard.PrdGrp9__c++;
        }
        if(productGroup == scorecard.Product_Group_10__c && 
             facility[i].WCA_CAPA_Not_Requested__c == True) {
                  scorecard.PrdGrp10__c++;
        }          
            
            i++;
        }
                
        Return scorecard;
        
       }
    
// Calculate Past CAPA Performed
 public static CountryScoreCard__c calcWCACAPAPerformed(List<Facility__c> facility, Map<String, String> splmap, CountryScoreCard__c scorecard) {
        
        scorecard.PrdGrp1__c = 0;
        scorecard.PrdGrp2__c = 0;
        scorecard.PrdGrp3__c = 0;
        scorecard.PrdGrp4__c = 0;
        scorecard.PrdGrp5__c = 0;
        scorecard.PrdGrp6__c = 0;
        scorecard.PrdGrp7__c = 0;
        scorecard.PrdGrp8__c = 0;
        scorecard.PrdGrp9__c = 0;
        scorecard.PrdGrp10__c = 0;
        
        integer i = 0; 
    
        for(Facility__c fctry : facility) {
           
            String productGroup = splMap.get(facility[i].Facility_Number__c);
     
       
            if(productGroup == scorecard.Product_Group_1__c && 
                facility[i].WCA_CAPA_Completed__c == True) {
                  scorecard.PrdGrp1__c++;
               
            }
         if(productGroup == scorecard.Product_Group_2__c && 
                facility[i].WCA_CAPA_Completed__c == True) {
                  scorecard.PrdGrp2__c++;
            }
         if(productGroup == scorecard.Product_Group_3__c && 
                facility[i].WCA_CAPA_Completed__c == True) {
                  scorecard.PrdGrp3__c++;
        }
          if(productGroup == scorecard.Product_Group_4__c && 
                facility[i].WCA_CAPA_Completed__c == True) {
                  scorecard.PrdGrp4__c++;
        }
            if(productGroup == scorecard.Product_Group_5__c && 
                facility[i].WCA_CAPA_Completed__c == True) {
                  scorecard.PrdGrp5__c++;
        }
         if(productGroup == scorecard.Product_Group_6__c && 
                facility[i].WCA_CAPA_Completed__c == True) {
                  scorecard.PrdGrp6__c++;
        }
        if(productGroup == scorecard.Product_Group_7__c && 
                facility[i].WCA_CAPA_Completed__c == True) {
                  scorecard.PrdGrp7__c++;
        }
        if(productGroup == scorecard.Product_Group_8__c && 
                facility[i].WCA_CAPA_Completed__c == True) {
                  scorecard.PrdGrp8__c++;
        }
            
        if(productGroup == scorecard.Product_Group_9__c && 
                facility[i].WCA_CAPA_Completed__c == True) {
                  scorecard.PrdGrp9__c++;
        }  
            
         if(productGroup == scorecard.Product_Group_10__c && 
                facility[i].WCA_CAPA_Completed__c == True) {
                  scorecard.PrdGrp10__c++;
        }            
            i++;
        }
                
        Return scorecard; 
       }
    
// Calculate WCA Past CAPA Deadline
  public static CountryScoreCard__c calcPastWCACAPADeadline(List<Facility__c> facility, Map<String, String> splmap, CountryScoreCard__c scorecard) {
        
        scorecard.PrdGrp1__c = 0;
        scorecard.PrdGrp2__c = 0;
        scorecard.PrdGrp3__c = 0;
        scorecard.PrdGrp4__c = 0;
        scorecard.PrdGrp5__c = 0;
        scorecard.PrdGrp6__c = 0;
        scorecard.PrdGrp7__c = 0;
        scorecard.PrdGrp8__c = 0;
        scorecard.PrdGrp9__c = 0;
        scorecard.PrdGrp10__c = 0;
        
        integer i = 0; 
         
        for(Facility__c fctry : facility) {
           
            String productGroup = splMap.get(facility[i].Facility_Number__c);
            
            if(productGroup == scorecard.Product_Group_1__c && 
                facility[i].Past_CAPA_Deadline_WCA__c == True) {
                  scorecard.PrdGrp1__c++;
               
            }
         if(productGroup == scorecard.Product_Group_2__c && 
                facility[i].Past_CAPA_Deadline_WCA__c == True) {
                  scorecard.PrdGrp2__c++;
            }
         if(productGroup == scorecard.Product_Group_3__c && 
                facility[i].Past_CAPA_Deadline_WCA__c == True) {
                  scorecard.PrdGrp3__c++;
        }
          if(productGroup == scorecard.Product_Group_4__c && 
                facility[i].Past_CAPA_Deadline_WCA__c == True) {
                  scorecard.PrdGrp4__c++;
        }
            if(productGroup == scorecard.Product_Group_5__c && 
                facility[i].Past_CAPA_Deadline_WCA__c == True) {
                  scorecard.PrdGrp5__c++;
        }
             if(productGroup == scorecard.Product_Group_6__c && 
                facility[i].Past_CAPA_Deadline_WCA__c == True) {
                  scorecard.PrdGrp6__c++;
        }
            if(productGroup == scorecard.Product_Group_7__c && 
                facility[i].Past_CAPA_Deadline_WCA__c == True) {
                  scorecard.PrdGrp7__c++;
        }
            if(productGroup == scorecard.Product_Group_8__c && 
                facility[i].Past_CAPA_Deadline_WCA__c == True) {
                  scorecard.PrdGrp8__c++;
        }
            if(productGroup == scorecard.Product_Group_9__c && 
                facility[i].Past_CAPA_Deadline_WCA__c == True) {
                  scorecard.PrdGrp9__c++;
        }
            if(productGroup == scorecard.Product_Group_10__c && 
                facility[i].Past_CAPA_Deadline_WCA__c == True) {
                  scorecard.PrdGrp10__c++;
        }
            i++;
        }
                
        Return scorecard;
        
       }
    
// Calculate WCA Pending CAPA / pendingWCACAPA
  public static CountryScoreCard__c calcWCAPendingCAPA(List<Facility__c> facility, Map<String, String> splmap, CountryScoreCard__c scorecard) {
        
        scorecard.PrdGrp1__c = 0;
        scorecard.PrdGrp2__c = 0;
        scorecard.PrdGrp3__c = 0;
        scorecard.PrdGrp4__c = 0;
        scorecard.PrdGrp5__c = 0;
        scorecard.PrdGrp6__c = 0;
        scorecard.PrdGrp7__c = 0;
        scorecard.PrdGrp8__c = 0;
        scorecard.PrdGrp9__c = 0;
        scorecard.PrdGrp10__c = 0;
        
        integer i = 0; 
      
        for(Facility__c fctry : facility) {
           
            String productGroup = splMap.get(facility[i].Facility_Number__c);
            
            if(productGroup == scorecard.Product_Group_1__c && 
                facility[i].Pending_CAPA_WCA__c == True) {
                  scorecard.PrdGrp1__c++;
               
            }
         if(productGroup == scorecard.Product_Group_2__c && 
                facility[i].Pending_CAPA_WCA__c == True) {
                  scorecard.PrdGrp2__c++;
            }
         if(productGroup == scorecard.Product_Group_3__c && 
                facility[i].Pending_CAPA_WCA__c == True) {
                  scorecard.PrdGrp3__c++;
        }
          if(productGroup == scorecard.Product_Group_4__c && 
                facility[i].Pending_CAPA_WCA__c == True) {
                  scorecard.PrdGrp4__c++;
        }
            if(productGroup == scorecard.Product_Group_5__c && 
                facility[i].Pending_CAPA_WCA__c == True) {
                  scorecard.PrdGrp5__c++;
        }
           if(productGroup == scorecard.Product_Group_6__c && 
                facility[i].Pending_CAPA_WCA__c == True) {
                  scorecard.PrdGrp6__c++;
        }
           if(productGroup == scorecard.Product_Group_7__c && 
                facility[i].Pending_CAPA_WCA__c == True) {
                  scorecard.PrdGrp7__c++;
        }
           if(productGroup == scorecard.Product_Group_8__c && 
                facility[i].Pending_CAPA_WCA__c == True) {
                  scorecard.PrdGrp8__c++;
        }
            
          if(productGroup == scorecard.Product_Group_9__c && 
                facility[i].Pending_CAPA_WCA__c == True) {
                  scorecard.PrdGrp9__c++;
        }
           if(productGroup == scorecard.Product_Group_10__c && 
                facility[i].Pending_CAPA_WCA__c == True) {
                  scorecard.PrdGrp10__c++;
        }           
            i++;
        }
                
        Return scorecard;
        
       }
   
 // Calculate FS Compliant / compliantFS
public static CountryScoreCard__c calcCompliantFS(List<Facility__c> facility, Map<String, String> splmap, CountryScoreCard__c scorecard) {
        
        scorecard.PrdGrp1__c = 0;
        scorecard.PrdGrp2__c = 0;
        scorecard.PrdGrp3__c = 0;
        scorecard.PrdGrp4__c = 0;
        scorecard.PrdGrp5__c = 0;
        scorecard.PrdGrp6__c = 0;
        scorecard.PrdGrp7__c = 0;
        scorecard.PrdGrp8__c = 0;
        scorecard.PrdGrp9__c = 0;
        scorecard.PrdGrp10__c = 0;
        
        integer i = 0; 
      
        for(Facility__c fctry : facility) {
           
            String productGroup = splMap.get(facility[i].Facility_Number__c);
            
            if(productGroup == scorecard.Product_Group_1__c && 
                facility[i].FS_Compliant__c == True) {
                  scorecard.PrdGrp1__c++;
               
            }
         if(productGroup == scorecard.Product_Group_2__c && 
                facility[i].FS_Compliant__c == True) {
                  scorecard.PrdGrp1__c++;
            }
         if(productGroup == scorecard.Product_Group_3__c && 
                facility[i].FS_Compliant__c == True) {
                  scorecard.PrdGrp3__c++;
        }
          if(productGroup == scorecard.Product_Group_4__c && 
                facility[i].FS_Compliant__c == True) {
                  scorecard.PrdGrp4__c++;
        }
            if(productGroup == scorecard.Product_Group_5__c && 
                facility[i].FS_Compliant__c == True) {
                  scorecard.PrdGrp5__c++;
        }
        if(productGroup == scorecard.Product_Group_6__c && 
                facility[i].FS_Compliant__c == True) {
                  scorecard.PrdGrp6__c++;
        }
        if(productGroup == scorecard.Product_Group_7__c && 
                facility[i].FS_Compliant__c == True) {
                  scorecard.PrdGrp7__c++;
        }
        if(productGroup == scorecard.Product_Group_8__c && 
                facility[i].FS_Compliant__c == True) {
                  scorecard.PrdGrp8__c++;
        }
        if(productGroup == scorecard.Product_Group_9__c && 
                facility[i].FS_Compliant__c == True) {
                  scorecard.PrdGrp9__c++;
        }  
        if(productGroup == scorecard.Product_Group_10__c && 
                facility[i].FS_Compliant__c == True) {
                  scorecard.PrdGrp10__c++;
        }         
            
            i++;
        }
                
        Return scorecard;
        
       }  
    
// Calculate FS Past Audit Deadline / pastFSAuditDeadline
  public static CountryScoreCard__c calcPastFSAuditDeadline(List<Facility__c> facility, Map<String, String> splmap, CountryScoreCard__c scorecard) {
        
        scorecard.PrdGrp1__c = 0;
        scorecard.PrdGrp2__c = 0;
        scorecard.PrdGrp3__c = 0;
        scorecard.PrdGrp4__c = 0;
        scorecard.PrdGrp5__c = 0;
        scorecard.PrdGrp6__c = 0;
        scorecard.PrdGrp7__c = 0;
        scorecard.PrdGrp8__c = 0;
        scorecard.PrdGrp9__c = 0;
        scorecard.PrdGrp10__c = 0;
        
        integer i = 0; 
      
        for(Facility__c fctry : facility) {
           
            String productGroup = splMap.get(facility[i].Facility_Number__c);
            
            if(productGroup == scorecard.Product_Group_1__c && 
                facility[i].Past_Audit_Deadline_FS__c == True) {
                  scorecard.PrdGrp1__c++;
               
            }
         if(productGroup == scorecard.Product_Group_2__c && 
                facility[i].Past_Audit_Deadline_FS__c == True) {
                  scorecard.PrdGrp2__c++;
            }
         if(productGroup == scorecard.Product_Group_3__c && 
                facility[i].Past_Audit_Deadline_FS__c == True) {
                  scorecard.PrdGrp3__c++;
        }
          if(productGroup == scorecard.Product_Group_4__c && 
                facility[i].Past_Audit_Deadline_FS__c == True) {
                  scorecard.PrdGrp4__c++;
        }
            if(productGroup == scorecard.Product_Group_5__c && 
                facility[i].Past_Audit_Deadline_FS__c == True) {
                  scorecard.PrdGrp5__c++;
        }
        if(productGroup == scorecard.Product_Group_6__c && 
                facility[i].Past_Audit_Deadline_FS__c == True) {
                  scorecard.PrdGrp6__c++;
        }
        if(productGroup == scorecard.Product_Group_7__c && 
                facility[i].Past_Audit_Deadline_FS__c == True) {
                  scorecard.PrdGrp7__c++;
        }
        if(productGroup == scorecard.Product_Group_8__c && 
                facility[i].Past_Audit_Deadline_FS__c == True) {
                  scorecard.PrdGrp8__c++;
        }
         if(productGroup == scorecard.Product_Group_9__c && 
                facility[i].Past_Audit_Deadline_FS__c == True) {
                  scorecard.PrdGrp9__c++;
        }          
        if(productGroup == scorecard.Product_Group_10__c && 
                facility[i].Past_Audit_Deadline_FS__c == True) {
                  scorecard.PrdGrp10__c++;
        }            
            i++;
        }
                
        Return scorecard;
        
       } 
// Calculate FS Initial / initialFS
  public static CountryScoreCard__c calcFSInitial(List<Facility__c> facility, Map<String, String> vndmap, CountryScoreCard__c scorecard) {
        
        scorecard.PrdGrp1__c = 0;
        scorecard.PrdGrp2__c = 0;
        scorecard.PrdGrp3__c = 0;
        scorecard.PrdGrp4__c = 0;
        scorecard.PrdGrp5__c = 0;
        scorecard.PrdGrp6__c = 0;
        scorecard.PrdGrp7__c = 0;
        scorecard.PrdGrp8__c = 0;
        scorecard.PrdGrp9__c = 0;
        scorecard.PrdGrp10__c = 0;
        
        integer i = 0; 
      
        for(Facility__c fctry : facility) {
           
            String productGroup = vndMap.get(facility[i].Facility_Number__c);
            
            if(productGroup == scorecard.Product_Group_1__c && 
                facility[i].FS_Audit_Required__c == True) {
                  scorecard.PrdGrp1__c++;
               
            }
         if(productGroup == scorecard.Product_Group_2__c && 
                facility[i].FS_Audit_Required__c == True) {
                  scorecard.PrdGrp2__c++;
            }
         if(productGroup == scorecard.Product_Group_3__c && 
                facility[i].FS_Audit_Required__c == True) {
                  scorecard.PrdGrp3__c++;
        }
          if(productGroup == scorecard.Product_Group_4__c && 
                facility[i].FS_Audit_Required__c == True) {
                  scorecard.PrdGrp4__c++;
        }
            if(productGroup == scorecard.Product_Group_5__c && 
                facility[i].FS_Audit_Required__c == True) {
                  scorecard.PrdGrp5__c++;
        }
         if(productGroup == scorecard.Product_Group_6__c && 
                facility[i].FS_Audit_Required__c == True) {
                  scorecard.PrdGrp6__c++;
        }
        if(productGroup == scorecard.Product_Group_7__c && 
                facility[i].FS_Audit_Required__c == True) {
                  scorecard.PrdGrp7__c++;
        }
        if(productGroup == scorecard.Product_Group_8__c && 
                facility[i].FS_Audit_Required__c == True) {
                  scorecard.PrdGrp8__c++;
        }
         if(productGroup == scorecard.Product_Group_9__c && 
                facility[i].FS_Audit_Required__c == True) {
                  scorecard.PrdGrp9__c++;
        }           
         if(productGroup == scorecard.Product_Group_10__c && 
                facility[i].FS_Audit_Required__c == True) {
                  scorecard.PrdGrp10__c++;
        }            
            i++;
        }
                
        Return scorecard;
        
       } 
 // Calculate FS_CAPA_Not_Required__c
  public static CountryScoreCard__c calcFSCAPANotRequired(List<Facility__c> facility, Map<String, String> splmap, CountryScoreCard__c scorecard) {
        
        scorecard.PrdGrp1__c = 0;
        scorecard.PrdGrp2__c = 0;
        scorecard.PrdGrp3__c = 0;
        scorecard.PrdGrp4__c = 0;
        scorecard.PrdGrp5__c = 0;
        scorecard.PrdGrp6__c = 0;
        scorecard.PrdGrp7__c = 0;
        scorecard.PrdGrp8__c = 0;
        scorecard.PrdGrp9__c = 0;
        scorecard.PrdGrp10__c = 0;
        
        integer i = 0; 
         
        for(Facility__c fctry : facility) {
           
            String productGroup = splMap.get(facility[i].Facility_Number__c);
            
            if(productGroup == scorecard.Product_Group_1__c && 
                facility[i].FS_CAPA_Not_Requested__c == True) {
                  scorecard.PrdGrp1__c++;
               
            }
         if(productGroup == scorecard.Product_Group_2__c && 
                facility[i].FS_CAPA_Not_Requested__c == True) {
                  scorecard.PrdGrp2__c++;
            }
         if(productGroup == scorecard.Product_Group_3__c && 
                facility[i].FS_CAPA_Not_Requested__c == True) {
                  scorecard.PrdGrp3__c++;
        }
          if(productGroup == scorecard.Product_Group_4__c && 
                facility[i].FS_CAPA_Not_Requested__c == True) {
                  scorecard.PrdGrp4__c++;
        }
            if(productGroup == scorecard.Product_Group_5__c && 
                facility[i].FS_CAPA_Not_Requested__c == True) {
                  scorecard.PrdGrp5__c++;
        }
         if(productGroup == scorecard.Product_Group_6__c && 
                facility[i].FS_CAPA_Not_Requested__c == True) {
                  scorecard.PrdGrp6__c++;
        }
        if(productGroup == scorecard.Product_Group_7__c && 
                facility[i].FS_CAPA_Not_Requested__c == True) {
                  scorecard.PrdGrp7__c++;
        }
        if(productGroup == scorecard.Product_Group_8__c && 
                facility[i].FS_CAPA_Not_Requested__c == True) {
                  scorecard.PrdGrp8__c++;
        }
         if(productGroup == scorecard.Product_Group_9__c && 
                facility[i].FS_CAPA_Not_Requested__c == True) {
                  scorecard.PrdGrp9__c++;
        }           
         if(productGroup == scorecard.Product_Group_10__c && 
                facility[i].FS_CAPA_Not_Requested__c == True) {
                  scorecard.PrdGrp10__c++;
        }              
            i++;
        }
                
        Return scorecard;
        
       } 
    
// Calculate FS_CAPA_Performed / performedFSCAPA
  public static CountryScoreCard__c calcFSCAPAPerformed(List<Facility__c> facility, Map<String, String> splmap, CountryScoreCard__c scorecard) {
        
        scorecard.PrdGrp1__c = 0;
        scorecard.PrdGrp2__c = 0;
        scorecard.PrdGrp3__c = 0;
        scorecard.PrdGrp4__c = 0;
        scorecard.PrdGrp5__c = 0;
        scorecard.PrdGrp6__c = 0;
        scorecard.PrdGrp7__c = 0;
        scorecard.PrdGrp8__c = 0;
        scorecard.PrdGrp9__c = 0;
        scorecard.PrdGrp10__c = 0;
        
        integer i = 0; 
      
        for(Facility__c fctry : facility) {
           
            String productGroup = splMap.get(facility[i].Facility_Number__c);
            
            if(productGroup == scorecard.Product_Group_1__c && 
                facility[i].FS_CAPA_Completed__c == True) {
                  scorecard.PrdGrp1__c++;
               
            }
         if(productGroup == scorecard.Product_Group_2__c && 
                facility[i].FS_CAPA_Completed__c == True) {
                  scorecard.PrdGrp2__c++;
            }
         if(productGroup == scorecard.Product_Group_3__c && 
                facility[i].FS_CAPA_Completed__c == True) {
                  scorecard.PrdGrp3__c++;
        }
          if(productGroup == scorecard.Product_Group_4__c && 
                facility[i].FS_CAPA_Completed__c == True) {
                  scorecard.PrdGrp4__c++;
        }
            if(productGroup == scorecard.Product_Group_5__c && 
               facility[i].FS_CAPA_Completed__c == True) {
                  scorecard.PrdGrp5__c++;
        }
         if(productGroup == scorecard.Product_Group_6__c && 
               facility[i].FS_CAPA_Completed__c == True) {
                  scorecard.PrdGrp6__c++;
        }
         if(productGroup == scorecard.Product_Group_7__c && 
               facility[i].FS_CAPA_Completed__c == True) {
                  scorecard.PrdGrp7__c++;
        }
        if(productGroup == scorecard.Product_Group_8__c && 
               facility[i].FS_CAPA_Completed__c == True) {
                  scorecard.PrdGrp8__c++;
        }
         if(productGroup == scorecard.Product_Group_9__c && 
               facility[i].FS_CAPA_Completed__c == True) {
                  scorecard.PrdGrp9__c++;
        }           
            i++;
        }
                
        Return scorecard;
        
     } 
    
// Calculate FS Past CAPA Deadline / pastFSCAPADeadline
  public static CountryScoreCard__c calcPastFSCAPADeadline(List<Facility__c> facility, Map<String, String> splmap, CountryScoreCard__c scorecard) {
        
        scorecard.PrdGrp1__c = 0;
        scorecard.PrdGrp2__c = 0;
        scorecard.PrdGrp3__c = 0;
        scorecard.PrdGrp4__c = 0;
        scorecard.PrdGrp5__c = 0;
        scorecard.PrdGrp6__c = 0;
        scorecard.PrdGrp7__c = 0;
        scorecard.PrdGrp8__c = 0;
        scorecard.PrdGrp9__c = 0;
        scorecard.PrdGrp10__c = 0;
        
        integer i = 0; 
         
        for(Facility__c fctry : facility) {
           
            String productGroup = splMap.get(facility[i].Facility_Number__c);
            
            if(productGroup == scorecard.Product_Group_1__c && 
                facility[i].Past_CAPA_Deadline_FS__c == True) {
                  scorecard.PrdGrp1__c++;
               
            }
         if(productGroup == scorecard.Product_Group_2__c && 
                facility[i].Past_CAPA_Deadline_FS__c == True) {
                  scorecard.PrdGrp2__c++;
            }
         if(productGroup == scorecard.Product_Group_3__c && 
                facility[i].Past_CAPA_Deadline_FS__c == True) {
                  scorecard.PrdGrp3__c++;
        }
          if(productGroup == scorecard.Product_Group_4__c && 
                facility[i].Past_CAPA_Deadline_FS__c == True) {
                  scorecard.PrdGrp4__c++;
        }
            if(productGroup == scorecard.Product_Group_5__c && 
               facility[i].Past_CAPA_Deadline_FS__c == True) {
                  scorecard.PrdGrp5__c++;
        }
          if(productGroup == scorecard.Product_Group_6__c && 
               facility[i].Past_CAPA_Deadline_FS__c == True) {
                  scorecard.PrdGrp6__c++;
        }
         if(productGroup == scorecard.Product_Group_7__c && 
               facility[i].Past_CAPA_Deadline_FS__c == True) {
                  scorecard.PrdGrp7__c++;
        }
        if(productGroup == scorecard.Product_Group_8__c && 
               facility[i].Past_CAPA_Deadline_FS__c == True) {
                  scorecard.PrdGrp8__c++;
        }
         if(productGroup == scorecard.Product_Group_9__c && 
               facility[i].Past_CAPA_Deadline_FS__c == True) {
                  scorecard.PrdGrp9__c++;
        }  
        if(productGroup == scorecard.Product_Group_10__c && 
               facility[i].Past_CAPA_Deadline_FS__c == True) {
                  scorecard.PrdGrp10__c++;
        }            
            
            
            i++;
        }
                
        Return scorecard;
        
       } 

// Calculate FS Pending CAPA / pendingFSCAPA
  public static CountryScoreCard__c calcPendingFSCAPA(List<Facility__c> facility, Map<String, String> splmap, CountryScoreCard__c scorecard) {
        
        scorecard.PrdGrp1__c = 0;
        scorecard.PrdGrp2__c = 0;
        scorecard.PrdGrp3__c = 0;
        scorecard.PrdGrp4__c = 0;
        scorecard.PrdGrp5__c = 0;
        scorecard.PrdGrp6__c = 0;
        scorecard.PrdGrp7__c = 0;
        scorecard.PrdGrp8__c = 0;
        scorecard.PrdGrp9__c = 0;
        scorecard.PrdGrp10__c = 0;
        
        integer i = 0; 
       
        for(Facility__c fctry : facility) {
           
            String productGroup = splMap.get(facility[i].Facility_Number__c);
            
            if(productGroup == scorecard.Product_Group_1__c && 
                facility[i].Pending_CAPA_FS__c == True) {
                  scorecard.PrdGrp1__c++;
               
            }
         if(productGroup == scorecard.Product_Group_2__c && 
                facility[i].Pending_CAPA_FS__c == True) {
                  scorecard.PrdGrp2__c++;
            }
         if(productGroup == scorecard.Product_Group_3__c && 
                facility[i].Pending_CAPA_FS__c == True) {
                  scorecard.PrdGrp3__c++;
        }
          if(productGroup == scorecard.Product_Group_4__c && 
                facility[i].Pending_CAPA_FS__c == True) {
                  scorecard.PrdGrp4__c++;
        }
            if(productGroup == scorecard.Product_Group_5__c && 
               facility[i].Pending_CAPA_FS__c == True) {
                  scorecard.PrdGrp5__c++;
        }
         if(productGroup == scorecard.Product_Group_6__c && 
               facility[i].Pending_CAPA_FS__c == True) {
                  scorecard.PrdGrp6__c++;
        }
        if(productGroup == scorecard.Product_Group_7__c && 
               facility[i].Pending_CAPA_FS__c == True) {
                  scorecard.PrdGrp7__c++;
        }
        if(productGroup == scorecard.Product_Group_8__c && 
               facility[i].Pending_CAPA_FS__c == True) {
                  scorecard.PrdGrp8__c++;
        }
      if(productGroup == scorecard.Product_Group_9__c && 
               facility[i].Pending_CAPA_FS__c == True) {
                  scorecard.PrdGrp9__c++;
        }            
      if(productGroup == scorecard.Product_Group_10__c && 
               facility[i].Pending_CAPA_FS__c == True) {
                  scorecard.PrdGrp10__c++;
        }            
            i++;
        }
                
        Return scorecard;
        
       } 

 
     // Calculate Training Not Required 
  public static CountryScoreCard__c calcTrainNotRequired(List<Facility__c> facility, Map<String, String> splmap, CountryScoreCard__c scorecard) {
        
        scorecard.PrdGrp1__c = 0;
        scorecard.PrdGrp2__c = 0;
        scorecard.PrdGrp3__c = 0;
        scorecard.PrdGrp4__c = 0;
        scorecard.PrdGrp5__c = 0;
        scorecard.PrdGrp6__c = 0;
        scorecard.PrdGrp7__c = 0;
        scorecard.PrdGrp8__c = 0;
        scorecard.PrdGrp9__c = 0;
        scorecard.PrdGrp10__c = 0;
        
        integer i = 0; 
        
        for(Facility__c fctry : facility) {
           
            String productGroup = splMap.get(facility[i].Facility_Number__c);
            
            if(productGroup == scorecard.Product_Group_1__c && 
                facility[i].Training_not_requested__c == True) {
                  scorecard.PrdGrp1__c++;             
            }
         if(productGroup == scorecard.Product_Group_2__c && 
                facility[i].Training_not_requested__c == True) {
                  scorecard.PrdGrp2__c++;
            }
         if(productGroup == scorecard.Product_Group_3__c && 
                facility[i].Training_not_requested__c == True) {
                  scorecard.PrdGrp3__c++;
        }
          if(productGroup == scorecard.Product_Group_4__c && 
                facility[i].Training_not_requested__c == True) {
                  scorecard.PrdGrp4__c++;
        }
            if(productGroup == scorecard.Product_Group_5__c && 
               facility[i].Training_not_requested__c == True) {
                  scorecard.PrdGrp5__c++;
        }
         if(productGroup == scorecard.Product_Group_6__c && 
               facility[i].Training_not_requested__c == True) {
                  scorecard.PrdGrp6__c++;
        }
        if(productGroup == scorecard.Product_Group_7__c && 
               facility[i].Training_not_requested__c == True) {
                  scorecard.PrdGrp7__c++;
        }
        if(productGroup == scorecard.Product_Group_8__c && 
               facility[i].Training_not_requested__c == True) {
                  scorecard.PrdGrp8__c++;
        }
        if(productGroup == scorecard.Product_Group_9__c && 
               facility[i].Training_not_requested__c == True) {
                  scorecard.PrdGrp9__c++;
        }           
       if(productGroup == scorecard.Product_Group_10__c && 
               facility[i].Training_not_requested__c == True) {
                  scorecard.PrdGrp10__c++;
        }           
            i++;
        }
                
        Return scorecard;
        
       } 
   // Calculate Training Not Required 
  public static CountryScoreCard__c calcTrainCompleted(List<Facility__c> facility, Map<String, String> splmap, CountryScoreCard__c scorecard) {
        
        scorecard.PrdGrp1__c = 0;
        scorecard.PrdGrp2__c = 0;
        scorecard.PrdGrp3__c = 0;
        scorecard.PrdGrp4__c = 0;
        scorecard.PrdGrp5__c = 0;
        scorecard.PrdGrp6__c = 0;
        scorecard.PrdGrp7__c = 0;
        scorecard.PrdGrp8__c = 0;
        scorecard.PrdGrp9__c = 0;
        scorecard.PrdGrp10__c = 0;
        
        integer i = 0; 
        
        for(Facility__c fctry : facility) {
           
            String productGroup = splMap.get(facility[i].Facility_Number__c);
            
            if(productGroup == scorecard.Product_Group_1__c && 
                facility[i].Training_Completed__c == True) {
                  scorecard.PrdGrp1__c++;             
            }
         if(productGroup == scorecard.Product_Group_2__c && 
                facility[i].Training_Completed__c == True) {
                  scorecard.PrdGrp2__c++;
            }
         if(productGroup == scorecard.Product_Group_3__c && 
                facility[i].Training_Completed__c == True) {
                  scorecard.PrdGrp3__c++;
        }
          if(productGroup == scorecard.Product_Group_4__c && 
                facility[i].Training_Completed__c == True) {
                  scorecard.PrdGrp4__c++;
        }
            if(productGroup == scorecard.Product_Group_5__c && 
               facility[i].Training_Completed__c == True) {
                  scorecard.PrdGrp5__c++;
        }
          if(productGroup == scorecard.Product_Group_6__c && 
               facility[i].Training_Completed__c == True) {
                  scorecard.PrdGrp6__c++;
        }
         if(productGroup == scorecard.Product_Group_7__c && 
               facility[i].Training_Completed__c == True) {
                  scorecard.PrdGrp7__c++;
        }
        if(productGroup == scorecard.Product_Group_8__c && 
               facility[i].Training_Completed__c == True) {
                  scorecard.PrdGrp8__c++;
        }
         if(productGroup == scorecard.Product_Group_9__c && 
               facility[i].Training_Completed__c == True) {
                  scorecard.PrdGrp9__c++;
        } 
        if(productGroup == scorecard.Product_Group_10__c && 
               facility[i].Training_Completed__c == True) {
                  scorecard.PrdGrp10__c++;
        }             
            
            i++;
        }
                
        Return scorecard;
        
       } 
 // Calculate Training Not Required 
  public static CountryScoreCard__c calcTrainNotCompleted(List<Facility__c> facility, Map<String, String> splmap, CountryScoreCard__c scorecard) {
        
        scorecard.PrdGrp1__c = 0;
        scorecard.PrdGrp2__c = 0;
        scorecard.PrdGrp3__c = 0;
        scorecard.PrdGrp4__c = 0;
        scorecard.PrdGrp5__c = 0;
        scorecard.PrdGrp6__c = 0;
        scorecard.PrdGrp7__c = 0;
        scorecard.PrdGrp8__c = 0;
        scorecard.PrdGrp9__c = 0;
        scorecard.PrdGrp10__c = 0;
        
        integer i = 0; 
        
        for(Facility__c fctry : facility) {
           
            String productGroup = splMap.get(facility[i].Facility_Number__c);
            
            if(productGroup == scorecard.Product_Group_1__c && 
                facility[i].Training_Not_Completed__c == True) {
                  scorecard.PrdGrp1__c++;             
            }
         if(productGroup == scorecard.Product_Group_2__c && 
                facility[i].Training_Not_Completed__c == True) {
                  scorecard.PrdGrp2__c++;
            }
         if(productGroup == scorecard.Product_Group_3__c && 
                facility[i].Training_Not_Completed__c == True) {
                  scorecard.PrdGrp3__c++;
        }
          if(productGroup == scorecard.Product_Group_4__c && 
                facility[i].Training_Not_Completed__c == True) {
                  scorecard.PrdGrp4__c++;
        }
            if(productGroup == scorecard.Product_Group_5__c && 
               facility[i].Training_Not_Completed__c == True) {
                  scorecard.PrdGrp5__c++;
        }
         if(productGroup ==  scorecard.Product_Group_6__c && 
               facility[i].Training_Not_Completed__c == True) {
                  scorecard.PrdGrp6__c++;
        }
        if(productGroup == scorecard.Product_Group_7__c && 
               facility[i].Training_Not_Completed__c == True) {
                  scorecard.PrdGrp7__c++;
        }
        if(productGroup == scorecard.Product_Group_8__c && 
               facility[i].Training_Not_Completed__c == True) {
                  scorecard.PrdGrp8__c++;
        }
        if(productGroup == scorecard.Product_Group_9__c && 
               facility[i].Training_Not_Completed__c == True) {
                  scorecard.PrdGrp9__c++;
        }            
        if(productGroup == scorecard.Product_Group_10__c && 
               facility[i].Training_Not_Completed__c == True) {
                  scorecard.PrdGrp10__c++;
        }              
            i++;
        }
                
        Return scorecard;
        
       }
 // Calculate Training Not Required 
  public static CountryScoreCard__c calcEngAuditReq(List<Facility__c> facility, Map<String, String> splmap, CountryScoreCard__c scorecard) {
        
        scorecard.PrdGrp1__c = 0;
        scorecard.PrdGrp2__c = 0;
        scorecard.PrdGrp3__c = 0;
        scorecard.PrdGrp4__c = 0;
        scorecard.PrdGrp5__c = 0;
        scorecard.PrdGrp6__c = 0;
        scorecard.PrdGrp7__c = 0;
        scorecard.PrdGrp8__c = 0;
        scorecard.PrdGrp9__c = 0;
        scorecard.PrdGrp10__c = 0;
        
        integer i = 0; 
        
        for(Facility__c fctry : facility) {
           
            String productGroup = splMap.get(facility[i].Facility_Number__c);
            
            if(productGroup == scorecard.Product_Group_1__c && 
                facility[i].Engineering_Audit_Requested__c == 'Yes') {
                  scorecard.PrdGrp1__c++;             
            }
         if(productGroup == scorecard.Product_Group_2__c && 
                facility[i].Engineering_Audit_Requested__c == 'Yes') {
                  scorecard.PrdGrp2__c++;
            }
         if(productGroup == scorecard.Product_Group_3__c && 
                facility[i].Engineering_Audit_Requested__c == 'Yes') {
                  scorecard.PrdGrp3__c++;
        }
          if(productGroup == scorecard.Product_Group_4__c && 
                facility[i].Engineering_Audit_Requested__c == 'Yes') {
                  scorecard.PrdGrp4__c++;
        }
            if(productGroup == scorecard.Product_Group_5__c && 
               facility[i].Engineering_Audit_Requested__c == 'Yes') {
                  scorecard.PrdGrp5__c++;
        }
          if(productGroup == scorecard.Product_Group_6__c && 
               facility[i].Engineering_Audit_Requested__c == 'Yes') {
                  scorecard.PrdGrp6__c++;
        }
         if(productGroup == scorecard.Product_Group_7__c && 
               facility[i].Engineering_Audit_Requested__c == 'Yes') {
                  scorecard.PrdGrp7__c++;
        }
         if(productGroup == scorecard.Product_Group_8__c && 
               facility[i].Engineering_Audit_Requested__c == 'Yes') {
                  scorecard.PrdGrp8__c++;
        }
         if(productGroup == scorecard.Product_Group_9__c && 
               facility[i].Engineering_Audit_Requested__c == 'Yes') {
                  scorecard.PrdGrp9__c++;
        }            
        if(productGroup == scorecard.Product_Group_10__c && 
               facility[i].Engineering_Audit_Requested__c == 'Yes') {
                  scorecard.PrdGrp10__c++;
        }           
            i++;
        }
                
        Return scorecard;
        
       }
 // Calculate Training Not Required 
  public static CountryScoreCard__c calcEngAuditCompleted(List<Facility__c> facility, Map<String, String> splmap, CountryScoreCard__c scorecard) {
        
        scorecard.PrdGrp1__c = 0;
        scorecard.PrdGrp2__c = 0;
        scorecard.PrdGrp3__c = 0;
        scorecard.PrdGrp4__c = 0;
        scorecard.PrdGrp5__c = 0;
        scorecard.PrdGrp6__c = 0;
        scorecard.PrdGrp7__c = 0;
        scorecard.PrdGrp8__c = 0;
        scorecard.PrdGrp9__c = 0;
        scorecard.PrdGrp10__c = 0;
        
        integer i = 0; 
        
        for(Facility__c fctry : facility) {
           
            String productGroup = splMap.get(facility[i].Facility_Number__c);
            
            if(productGroup == scorecard.Product_Group_1__c && 
                facility[i].Engineering_audit_completed__c == True) {
                  scorecard.PrdGrp1__c++;             
            }
         if(productGroup == scorecard.Product_Group_2__c && 
                facility[i].Engineering_audit_completed__c == True) {
                  scorecard.PrdGrp2__c++;
            }
         if(productGroup == scorecard.Product_Group_3__c && 
                facility[i].Engineering_audit_completed__c == True) {
                  scorecard.PrdGrp3__c++;
        }
          if(productGroup == scorecard.Product_Group_4__c && 
                facility[i].Engineering_audit_completed__c == True) {
                  scorecard.PrdGrp4__c++;
        }
            if(productGroup == scorecard.Product_Group_5__c && 
               facility[i].Engineering_audit_completed__c == True) {
                  scorecard.PrdGrp5__c++;
        }
         if(productGroup == scorecard.Product_Group_6__c && 
               facility[i].Engineering_audit_completed__c == True) {
                  scorecard.PrdGrp6__c++;
        }
         if(productGroup == scorecard.Product_Group_7__c && 
               facility[i].Engineering_audit_completed__c == True) {
                  scorecard.PrdGrp7__c++;
        }
        if(productGroup == scorecard.Product_Group_8__c && 
               facility[i].Engineering_audit_completed__c == True) {
                  scorecard.PrdGrp8__c++;
        }
        if(productGroup == scorecard.Product_Group_9__c && 
               facility[i].Engineering_audit_completed__c == True) {
                  scorecard.PrdGrp9__c++;
        }            
       if(productGroup == scorecard.Product_Group_10__c && 
               facility[i].Engineering_audit_completed__c == True) {
                  scorecard.PrdGrp10__c++;
        }            
            i++;
        }
                
        Return scorecard;
        
       }
// Calculate Accord Engineering Audit Not Requested 
  public static CountryScoreCard__c calcEngAuditNotReq(List<Facility__c> facility, Map<String, String> splmap, CountryScoreCard__c scorecard) {
        
        scorecard.PrdGrp1__c = 0;
        scorecard.PrdGrp2__c = 0;
        scorecard.PrdGrp3__c = 0;
        scorecard.PrdGrp4__c = 0;
        scorecard.PrdGrp5__c = 0;
        scorecard.PrdGrp6__c = 0;
        scorecard.PrdGrp7__c = 0;
        scorecard.PrdGrp8__c = 0;
        scorecard.PrdGrp9__c = 0;
        scorecard.PrdGrp10__c = 0;
        
        
        integer i = 0; 
        
        for(Facility__c fctry : facility) {
           
            String productGroup = splMap.get(facility[i].Facility_Number__c);
            
            if(productGroup == scorecard.Product_Group_1__c && 
                facility[i].Engineering_Audit_Not_Requested__c == True) {
                  scorecard.PrdGrp1__c++;             
            }
         if(productGroup == scorecard.Product_Group_2__c && 
                facility[i].Engineering_Audit_Not_Requested__c == True) {
                  scorecard.PrdGrp2__c++;
            }
         if(productGroup == scorecard.Product_Group_3__c && 
                facility[i].Engineering_Audit_Not_Requested__c == True) {
                  scorecard.PrdGrp3__c++;
        }
          if(productGroup == scorecard.Product_Group_4__c && 
                facility[i].Engineering_Audit_Not_Requested__c == True) {
                  scorecard.PrdGrp4__c++;
        }
        if(productGroup == scorecard.Product_Group_5__c && 
               facility[i].Engineering_Audit_Not_Requested__c == True) {
                  scorecard.PrdGrp5__c++;
        }
        if(productGroup == scorecard.Product_Group_6__c && 
               facility[i].Engineering_Audit_Not_Requested__c == True) {
                  scorecard.PrdGrp6__c++;
        }
         if(productGroup == scorecard.Product_Group_7__c && 
               facility[i].Engineering_Audit_Not_Requested__c == True) {
                  scorecard.PrdGrp7__c++;
        }
        if(productGroup == scorecard.Product_Group_8__c && 
               facility[i].Engineering_Audit_Not_Requested__c == True) {
                  scorecard.PrdGrp8__c++;
        }
        if(productGroup == scorecard.Product_Group_9__c && 
               facility[i].Engineering_Audit_Not_Requested__c == True) {
                  scorecard.PrdGrp9__c++;
        }           
         if(productGroup == scorecard.Product_Group_10__c && 
               facility[i].Engineering_Audit_Not_Requested__c == True) {
                  scorecard.PrdGrp10__c++;
        }            
            i++;
        }
                
        Return scorecard;
        
       }
    
 // Calculate Greenlist
  public static CountryScoreCard__c calcGreenlist(List<Facility__c> facility, Map<String, String> splmap, CountryScoreCard__c scorecard) {
        
        scorecard.PrdGrp1__c = 0;
        scorecard.PrdGrp2__c = 0;
        scorecard.PrdGrp3__c = 0;
        scorecard.PrdGrp4__c = 0;
        scorecard.PrdGrp5__c = 0;
        scorecard.PrdGrp6__c = 0;
        scorecard.PrdGrp7__c = 0;
        scorecard.PrdGrp8__c = 0;
        scorecard.PrdGrp9__c = 0;
        scorecard.PrdGrp10__c = 0;
        
        integer i = 0; 
        
        for(Facility__c fctry : facility) {
           
            String productGroup = splMap.get(facility[i].Facility_Number__c);
         
            if(productGroup == scorecard.Product_Group_1__c && 
                facility[i].Green_List_Status__c == 'Unblocked') {
                  scorecard.PrdGrp1__c++;             
            }
         if(productGroup == scorecard.Product_Group_2__c && 
                facility[i].Green_List_Status__c == 'Unblocked') {
                  scorecard.PrdGrp2__c++;
            }
         if(productGroup == scorecard.Product_Group_3__c && 
                facility[i].Green_List_Status__c == 'Unblocked') {
                  scorecard.PrdGrp3__c++;
        }
          if(productGroup == scorecard.Product_Group_4__c && 
                facility[i].Green_List_Status__c == 'Unblocked') {
                  scorecard.PrdGrp4__c++;
        }
        if(productGroup == scorecard.Product_Group_5__c && 
               facility[i].Green_List_Status__c == 'Unblocked') {
                  scorecard.PrdGrp5__c++;
        }
        if(productGroup == scorecard.Product_Group_6__c && 
               facility[i].Green_List_Status__c == 'Unblocked') {
                  scorecard.PrdGrp6__c++;
        }
         if(productGroup == scorecard.Product_Group_7__c && 
               facility[i].Green_List_Status__c == 'Unblocked') {
                  scorecard.PrdGrp7__c++;
        }
        if(productGroup == scorecard.Product_Group_8__c && 
               facility[i].Green_List_Status__c == 'Unblocked') {
                  scorecard.PrdGrp8__c++;
        }
            i++;
        }
         
        Return scorecard;
        
       }   
 
  // Calculate Greenlist
  public static CountryScoreCard__c calcnonGreenlist(List<Facility__c> facility, Map<String, String> splmap, CountryScoreCard__c scorecard) {
        
        scorecard.PrdGrp1__c = 0;
        scorecard.PrdGrp2__c = 0;
        scorecard.PrdGrp3__c = 0;
        scorecard.PrdGrp4__c = 0;
        scorecard.PrdGrp5__c = 0;
        scorecard.PrdGrp6__c = 0;
        scorecard.PrdGrp7__c = 0;
        scorecard.PrdGrp8__c = 0;
        scorecard.PrdGrp9__c = 0;
        scorecard.PrdGrp10__c = 0;
        
        integer i = 0; 
        
        for(Facility__c fctry : facility) {
           
            String productGroup = splMap.get(facility[i].Facility_Number__c);
         
            if(productGroup == scorecard.Product_Group_1__c && 
                facility[i].Green_List_Status__c == 'Blocked') {
                  scorecard.PrdGrp1__c++;             
            }
         if(productGroup == scorecard.Product_Group_2__c && 
                facility[i].Green_List_Status__c == 'Blocked') {
                  scorecard.PrdGrp2__c++;
            }
         if(productGroup == scorecard.Product_Group_3__c && 
                facility[i].Green_List_Status__c == 'Blocked') {
                  scorecard.PrdGrp3__c++;
        }
          if(productGroup == scorecard.Product_Group_4__c && 
                facility[i].Green_List_Status__c == 'Blocked') {
                  scorecard.PrdGrp4__c++;
        }
        if(productGroup == scorecard.Product_Group_5__c && 
               facility[i].Green_List_Status__c == 'Blocked') {
                  scorecard.PrdGrp5__c++;
        }
        if(productGroup == scorecard.Product_Group_6__c && 
               facility[i].Green_List_Status__c == 'Blocked') {
                  scorecard.PrdGrp6__c++;
        }
         if(productGroup == scorecard.Product_Group_7__c && 
               facility[i].Green_List_Status__c == 'Blocked') {
                  scorecard.PrdGrp7__c++;
        }
        if(productGroup == scorecard.Product_Group_8__c && 
               facility[i].Green_List_Status__c == 'Blocked') {
                  scorecard.PrdGrp8__c++;
        }
        if(productGroup == scorecard.Product_Group_9__c && 
               facility[i].Green_List_Status__c == 'Blocked') {
                  scorecard.PrdGrp9__c++;
        }
        if(productGroup == scorecard.Product_Group_10__c && 
               facility[i].Green_List_Status__c == 'Blocked') {
                  scorecard.PrdGrp10__c++;
        }
            i++;
        }
         
        Return scorecard;
        
       }   
 
    
 
   // Calculate non Mannual Accepted 
  public static CountryScoreCard__c calcManAcceptedShip(List<Facility__c> facility, Map<String, String> splmap, CountryScoreCard__c scorecard) {
        
        scorecard.PrdGrp1__c = 0;
        scorecard.PrdGrp2__c = 0;
        scorecard.PrdGrp3__c = 0;
        scorecard.PrdGrp4__c = 0;
        scorecard.PrdGrp5__c = 0;
        scorecard.PrdGrp6__c = 0;
        scorecard.PrdGrp7__c = 0;
        scorecard.PrdGrp8__c = 0;
        scorecard.PrdGrp9__c = 0;
        scorecard.PrdGrp10__c = 0;
        
        integer i = 0; 
        
        for(Facility__c fctry : facility) {
           
            String productGroup = splMap.get(facility[i].Facility_Number__c);
            
            if(productGroup == scorecard.Product_Group_1__c && 
                facility[i].Facility_Status__c == 'Manual Accepted Shipments') {
                  scorecard.PrdGrp1__c++;             
            }
         if(productGroup == scorecard.Product_Group_2__c && 
                facility[i].Facility_Status__c == 'Manual Accepted Shipments') {
                  scorecard.PrdGrp2__c++;
            }
         if(productGroup == scorecard.Product_Group_3__c && 
                facility[i].Facility_Status__c == 'Manual Accepted Shipments') {
                  scorecard.PrdGrp3__c++;
        }
          if(productGroup == scorecard.Product_Group_4__c && 
                facility[i].Facility_Status__c == 'Manual Accepted Shipments') {
                  scorecard.PrdGrp4__c++;
        }
        if(productGroup == scorecard.Product_Group_5__c && 
               facility[i].Facility_Status__c == 'Manual Accepted Shipments') {
                  scorecard.PrdGrp5__c++;
        }
        if(productGroup == scorecard.Product_Group_6__c && 
               facility[i].Facility_Status__c == 'Manual Accepted Shipments') {
                  scorecard.PrdGrp6__c++;
        }
         if(productGroup == scorecard.Product_Group_7__c && 
               facility[i].Facility_Status__c == 'Manual Accepted Shipments') {
                  scorecard.PrdGrp7__c++;
        }
        if(productGroup == scorecard.Product_Group_8__c && 
               facility[i].Facility_Status__c == 'Manual Accepted Shipments') {
                  scorecard.PrdGrp8__c++;
        }
            i++;
        }
                
        Return scorecard;
        
       }    
 
   // Calculate non Mannual Accepted 
  public static CountryScoreCard__c calcDelisted(List<Facility__c> facility, Map<String, String> splmap, CountryScoreCard__c scorecard) {
        
         scorecard.PrdGrp1__c = 0;
        scorecard.PrdGrp2__c = 0;
        scorecard.PrdGrp3__c = 0;
        scorecard.PrdGrp4__c = 0;
        scorecard.PrdGrp5__c = 0;
        scorecard.PrdGrp6__c = 0;
        scorecard.PrdGrp7__c = 0;
        scorecard.PrdGrp8__c = 0;
        scorecard.PrdGrp9__c = 0;
        scorecard.PrdGrp10__c = 0;
        
        integer i = 0; 
        
        for(Facility__c fctry : facility) {
           
            String productGroup = splMap.get(facility[i].Facility_Number__c);
            
            if(productGroup == scorecard.Product_Group_1__c && 
                facility[i].Facility_Status__c == 'Delisted') {
                  scorecard.PrdGrp1__c++;             
            }
         if(productGroup == scorecard.Product_Group_2__c && 
                facility[i].Facility_Status__c == 'Delisted') {
                  scorecard.PrdGrp2__c++;
            }
         if(productGroup == scorecard.Product_Group_3__c && 
                facility[i].Facility_Status__c == 'Delisted') {
                  scorecard.PrdGrp3__c++;
        }
          if(productGroup == scorecard.Product_Group_4__c && 
                facility[i].Facility_Status__c == 'Delisted') {
                  scorecard.PrdGrp4__c++;
        }
        if(productGroup == scorecard.Product_Group_5__c && 
               facility[i].Facility_Status__c == 'Delisted') {
                  scorecard.PrdGrp5__c++;
        }
        if(productGroup == scorecard.Product_Group_6__c && 
               facility[i].Facility_Status__c == 'Delisted') {
                  scorecard.PrdGrp6__c++;
        }
         if(productGroup == scorecard.Product_Group_7__c && 
               facility[i].Facility_Status__c == 'Delisted') {
                  scorecard.PrdGrp7__c++;
        }
        if(productGroup == scorecard.Product_Group_8__c && 
               facility[i].Facility_Status__c == 'Delisted') {
                  scorecard.PrdGrp8__c++;
        }
        if(productGroup == scorecard.Product_Group_9__c && 
               facility[i].Facility_Status__c == 'Delisted') {
                  scorecard.PrdGrp9__c++;
        }
        if(productGroup == scorecard.Product_Group_10__c && 
               facility[i].Facility_Status__c == 'Delisted') {
                  scorecard.PrdGrp10__c++;
        } 
            i++;
        }
                
        Return scorecard;
        
       }   
    
    
     public static CountryScoreCard__c calcAuditScorecards(List<Facility__c> facility, Map<String, String> splmap, CountryScoreCard__c scorecard) {
    

       If(scorecard.Formula__c == '00002') {
       
    	   scorecard = calcPastWCAAuditDeadline(facility, splmap, scorecard);
       }
       
       If(scorecard.Formula__c == '00003') {
    	   scorecard = calcWCAInitial(facility, splmap, scorecard);
       } 
       If(scorecard.Formula__c == '00004') {
    	   scorecard = calcWCACompliant(facility, splmap, scorecard);

       }
       If(scorecard.Formula__c == '00005') {
    	   scorecard = calcWCACAPANotRequested(facility, splmap, scorecard);
       } 
        
       If(scorecard.Formula__c == '00007') {
    	   scorecard = calcWCACAPAPerformed(facility, splmap, scorecard);
       } 
        
       If(scorecard.Formula__c== '00008') {
    	   scorecard = calcPastWCACAPADeadline(facility, splmap, scorecard);
       } 
 
       If(scorecard.Formula__c == '00009') {
    	   scorecard = calcWCAPendingCAPA(facility, splmap, scorecard);
       }

       If(scorecard.Formula__c == '00012') {
    	   scorecard = calcCompliantFS(facility, splmap, scorecard);
       }
       If(scorecard.Formula__c == '00013') {
    	   scorecard = calcPastFSAuditDeadline(facility, splmap, scorecard);
       }
       If(scorecard.Formula__c == '00014') {
    	   scorecard = calcFSInitial(facility, splmap, scorecard);
       }
       If(scorecard.Formula__c == '00015') {
    	   scorecard = calcFSCAPANotRequired(facility, splmap, scorecard);
       }
       If(scorecard.Formula__c == '00016') {
    	   scorecard = calcFSCAPAPerformed(facility, splmap, scorecard);
       }
       If(scorecard.Formula__c == '00017') {
    	   scorecard = calcPastFSCAPADeadline(facility, splmap, scorecard);
       }
       If(scorecard.Formula__c == '00018') {
    	   scorecard = calcPendingFSCAPA(facility, splmap, scorecard);
       }
 

       If(scorecard.Formula__c == '00022') {
    	   scorecard = calcTrainNotRequired(facility, splmap, scorecard);
       }
       If(scorecard.Formula__c == '00023') {
    	   scorecard = calcTrainCompleted(facility, splmap, scorecard);
       }
       If(scorecard.Formula__c == '00025') {
    	   scorecard = calcTrainNotCompleted(facility, splmap, scorecard);
       }
       If(scorecard.Formula__c == '00026') {
    	   scorecard = calcEngAuditNotReq(facility, splmap, scorecard);
       }
       If(scorecard.Formula__c == '00027') {
    	   scorecard = calcEngAuditCompleted(facility, splmap, scorecard);
       }
       If(scorecard.Formula__c == '00028') {
    	   scorecard = calcEngAuditReq(facility, splmap, scorecard);
       }

        If(scorecard.Formula__c == '00030') {
    	   scorecard = calcGreenList(facility, splmap, scorecard);
       }
        If(scorecard.Formula__c == '00031') {
    	   scorecard = calcnonGreenList(facility, splmap, scorecard);
       }
        If(scorecard.Formula__c == '00032') {
    	   scorecard = calcManAcceptedShip(facility, splmap, scorecard);
       }
           If(scorecard.Formula__c == '00033') {
    	   scorecard = calcDelisted(facility, splmap, scorecard);
       }
       Return scorecard;
   }


}