global class ScorePrdGrpAssociation{


    
    
    webservice static String setScorePrdGrp(String Country) {
         
      integer i = 0;
      integer k = 0;

    
   List<Product_Group__c> nproductGroup = [Select i.Name, i.PrdGrpAssociation__c
                                                  From Product_Group__c i];
    
              

 //  Update all countries with product groups
     List<Audit_Score_Card__c> nscorecard = [Select i.Name, i.Product_Group_1__c, i.Product_Group_2__c,
                                     i.Product_Group_3__c, i.Product_Group_4__c, i.Product_Group_5__c,
                                     i.Product_Group_6__c, i.Product_Group_7__c, i.Product_Group_8__c,
                                     i.Product_Group_9__c, i.Product_Group_10__c
                                                  From Audit_Score_Card__c i];
    
  List<Audit_Score_Card__c> scorecardlist = new List<Audit_Score_Card__c>();
        
   for(Audit_Score_Card__c scorecrd : nscorecard){
        
        k = 0;
        for(Product_Group__c prdgrp : nproductGroup){ 
                 if(nproductGroup[k].PrdGrpAssociation__c == 1){
                     nscorecard[i].Product_Group_1__c = nproductGroup[k].name;                   
                     break;
                 }
                 k++;
             }
        k = 0; 
            for(Product_Group__c prdgrp : nproductGroup){ 
                if(nproductGroup[k].PrdGrpAssociation__c == 2){
                     nscorecard[i].Product_Group_2__c = nproductGroup[k].name;
                    break;
                 }
                k++;
            } 
        
        k = 0; 
            for(Product_Group__c prdgrp : nproductGroup){ 
                 if(nproductGroup[k].PrdGrpAssociation__c == 3){
                     nscorecard[i].Product_Group_3__c = nproductGroup[k].name;
                     break;
                 }
                k++;
            }
       
          k = 0; 
            for(Product_Group__c prdgrp : nproductGroup){ 
                 if(nproductGroup[k].PrdGrpAssociation__c == 4){
                     nscorecard[i].Product_Group_4__c = nproductGroup[k].name;
                     break;
                 }
                k++;
            }     
         k = 0; 
            for(Product_Group__c prdgrp : nproductGroup){ 
                 if(nproductGroup[k].PrdGrpAssociation__c == 5){
                     nscorecard[i].Product_Group_5__c = nproductGroup[k].name;
                     break;
                 }
                k++;
            } 
       
           k = 0; 
            for(Product_Group__c prdgrp : nproductGroup){ 
                 if(nproductGroup[k].PrdGrpAssociation__c == 6){
                     nscorecard[i].Product_Group_6__c = nproductGroup[k].name;
                     break;
                 }
                k++;
            }      
            k = 0; 
            for(Product_Group__c prdgrp : nproductGroup){ 
                 if(nproductGroup[k].PrdGrpAssociation__c == 7){
                     nscorecard[i].Product_Group_7__c = nproductGroup[k].name;
                     break;
                 }
                k++;
            } 
          k = 0; 
            for(Product_Group__c prdgrp : nproductGroup){ 
                 if(nproductGroup[k].PrdGrpAssociation__c == 8){
                     nscorecard[i].Product_Group_8__c = nproductGroup[k].name;
                     break;
                 }
                k++;
            }      
           k = 0; 
            for(Product_Group__c prdgrp : nproductGroup){ 
                 if(nproductGroup[k].PrdGrpAssociation__c == 9){
                     nscorecard[i].Product_Group_9__c = nproductGroup[k].name;
                     break;
                 }
                k++;
            }  
       k = 0; 
            for(Product_Group__c prdgrp : nproductGroup){ 
                 if(nproductGroup[k].PrdGrpAssociation__c == 10){
                     nscorecard[i].Product_Group_10__c = nproductGroup[k].name;
                     break;
                 }
                k++;
            }      
       
       scorecardlist.add(nscorecard[i]);
       
       i++;
   }    
 
	 try {
                
            Database.update(scorecardlist);
          		    }
            catch(DmlException e) {
                return e.getMessage();
          }          
         
         
         
   //update all score cards with product groups
   //create the Country Score Card records with product groups
   //
   // Now calculate the audit stats for each country score card
   // Summarize audit stats for each country
   // Summarize audit stats for each score card
   //  
   Return 'Score Card for ' + Country + ' Calculated';
   }   

}