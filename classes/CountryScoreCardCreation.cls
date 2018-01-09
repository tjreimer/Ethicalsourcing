global class CountryScoreCardCreation {

    
    webservice static String crtCntryScoreCard() {
 
    integer k = 0;
    integer i = 0;   
    integer j = 0;  
        
  // Read all product groups    
 	List<Product_Group__c> nproductGroup = [Select i.Name, i.PrdGrpAssociation__c
                                                  From Product_Group__c i]; 
        
  // Read all countries        
       List<Country__c> ncountry = [Select i.id, i.Name 
                                                  From Country__c i 
                                           Where i.FS_Country__c = True];
        
   // Read all score cards     
   		 List<Audit_Score_Card__c> nscorecard = [Select i.id, i.Name 
                                                  From Audit_Score_Card__c i ];
                                      


 //Create country score card record with output table
 //     

       List<CountryScoreCard__c> scorecardlist = new List<CountryScoreCard__c>();

// Loop over FS Countries
        for(Country__c cntry : ncountry){
             
           
            
 
            
            k = 0;
 // Loop over Audit Score Cards           
             for(Audit_Score_Card__c  scorecard : nscorecard){
                CountryScoreCard__c ncntryscorecard = new CountrySCoreCard__c();
                ncntryscorecard.Country__c = ncountry[i].id;
                ncntryscorecard.Audit_Score_Card__c = nscorecard[k].id;
                system.debug('Audit Score Card ID ' +ncntryscorecard.Audit_Score_Card__c);
                   j = 0;
    				    for(Product_Group__c prdgrp : nproductGroup){ 
               				  if(nproductGroup[j].PrdGrpAssociation__c == 1){
                  			   ncntryscorecard.Product_Group_1__c = nproductGroup[j].name;                   
		              	       break;
               			  }
               			  j++;
            			 }
                 
       				j = 0; 
      				    for(Product_Group__c prdgrp : nproductGroup){ 
               				  if(nproductGroup[j].PrdGrpAssociation__c == 2){
                  			   ncntryscorecard.Product_Group_2__c = nproductGroup[j].name;                   
		              	       break;
               			  }
               			  j++;
            			 }
        
       			 j = 0; 
        			   for(Product_Group__c prdgrp : nproductGroup){ 
               				  if(nproductGroup[j].PrdGrpAssociation__c == 3){
                  			   ncntryscorecard.Product_Group_3__c = nproductGroup[j].name;                   
		              	       break;
               				  }
               			  j++;
            			 }
       
      		    j = 0; 
       			   for(Product_Group__c prdgrp : nproductGroup){ 
               				  if(nproductGroup[j].PrdGrpAssociation__c == 4){
                  			   ncntryscorecard.Product_Group_4__c = nproductGroup[j].name;                   
		              	       break;
               			  }
               			  j++;
            			 }     
       		  j = 0; 
          	  for(Product_Group__c prdgrp : nproductGroup){ 
               				  if(nproductGroup[j].PrdGrpAssociation__c == 5){
                  			   ncntryscorecard.Product_Group_5__c = nproductGroup[j].name;                   
		              	       break;
               			  }
               			  j++;
            			 } 
       
             j = 0; 
       		   for(Product_Group__c prdgrp : nproductGroup){ 
               				  if(nproductGroup[j].PrdGrpAssociation__c == 6){
                  			   ncntryscorecard.Product_Group_6__c = nproductGroup[j].name;                   
		              	       break;
               			  }
               			  j++;
            			 }      
         			    j = 0; 
      		 		  for(Product_Group__c prdgrp : nproductGroup){ 			
               				  if(nproductGroup[j].PrdGrpAssociation__c == 7){
                  			   ncntryscorecard.Product_Group_7__c = nproductGroup[j].name;                   
		              	       break;
               			  }
               			  j++;
            			 }
         		    j = 0; 
           			  for(Product_Group__c prdgrp : nproductGroup){ 
               				  if(nproductGroup[j].PrdGrpAssociation__c == 8){
                  			   ncntryscorecard.Product_Group_8__c = nproductGroup[j].name;                   
		              	       break;
               			  }
               			  j++;
            			 }     
          			 j = 0; 
      				  for(Product_Group__c prdgrp : nproductGroup){ 
               				  if(nproductGroup[j].PrdGrpAssociation__c == 9){
                  			   ncntryscorecard.Product_Group_9__c = nproductGroup[j].name;                   
		              	       break;
               			  }
               			  j++;
            			 }   
     			 	 j = 0; 
      				  for(Product_Group__c prdgrp : nproductGroup){ 
               				  if(nproductGroup[j].PrdGrpAssociation__c == 10){
                  			   ncntryscorecard.Product_Group_10__c = nproductGroup[j].name;                   
		              	       break;
               			  }
               			  j++;
            			 }     
         // Add country score card record to output table  

            system.debug('Country id  ' + ncntryscorecard.Country__c);
       //     system.debug('Audit Score Card ' + ncntryscorecard.Audit_Score_Card__c);
            system.debug('Product Group 1 ' + ncntryscorecard.Product_Group_1__c);
       		  scorecardlist.add(ncntryscorecard);
                 
            
              k++;

             }  
            i++;

        }

        
        system.debug('Number of elements ' + scorecardlist.size());
        
  // Output CountryScoreCards      
            try {
            Database.upsert(scorecardlist);
              }
            catch(DmlException e) {
                return e.getMessage();
          }
        
      return 'Country Score Card Created';
        
    }
  
    

    
}