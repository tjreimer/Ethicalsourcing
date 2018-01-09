global class ESIntegrationServices {

//Account Groups 
//This is the only place where it needs to be changed if required
public static String acctgrpSupplier =  'Z012';
public static String acctgrpFacility= 'Z003';  
public static String acctgrpVndFacility= 'Z002'; 
public static String searchTrmVnd = 'BU'; 
public static String searchTrmFct = 'facility';  
public static Integer i = 0;
public static Integer k = 0;
public static String supplno;
public static String rltnStatus;
public static String rltnId;
    

     
//
// Definition of facility response object 
// 
   global class Facility {
          WebService string facilityId;
          WebService String facilityname;
          WebService String facilityname2;
          WebService String address1;
          WebService String address2;
          WebService String city;
          WebService String region;
          WebService String pstl;
          WebService String acctgrp;
          WebService String searchTrm;
          WebService String country;
          WebService String phone;
          WebService String fax;
          WebService String facilitystatus;
          WebService String blockstatus;
          WebService String supplierno;
          WebService String reltnstatus;
          WebService String reltnId;
      
          public Facility(Facility__c facility, String auditcountry, String regionname, String vndno, String rStatus, String reltnId) {
               this.facilityId = facility.facility_Number__c;
               this.facilityname = facility.name;
               this.facilityname2 = facility.facility_Name_2__c;
               this.address1 = facility.Address_Line_1__c;
               this.address2 = facility.Address_Line_2__c;
               this.city = facility.City__c;
               this.region = regionname;
               this.pstl = facility.PSTL_Code__c;
               this.country = auditcountry;
               this.phone = facility.Phone__c;
               this.fax = facility.Fax__c;
               this.acctgrp = acctgrpfacility;
               this.searchTrm = searchTrmFct;
               this.facilitystatus = facility.facility_Status__c;
               this.blockstatus = facility.Green_List_Status__c;
               this.supplierno = vndno;
               this.reltnstatus  = rStatus;
               this.reltnId = reltnId;
            
          }
     }

//
// Definition of facility response object 
// 
   global class Blockstatus {
          WebService string facilityId;
          WebService String facilityname;
          WebService String facilitystatus;
          WebService String blockstatus;

      
          public BlockStatus(facility__c facility) {
               this.facilityId = facility.facility_Number__c;
               this.facilityname = facility.name;
               this.facilitystatus = facility.facility_Status__c;
               this.blockstatus = facility.Green_List_Status__c;
            
          }
     }
       
    
//
// Definition of facility response object 
// 
   global class SupplierFacility{
          WebService String supplierno;
          WebService string factno;
          WebService String status;
          WebService String suppliername;
          WebService String facilityname;
          WebService String fctaddress1;
          WebService String fctaddress2;
          WebService String fctcity;
          Webservice String acctgrp;
  //      Webservice String searchterm;
          WebService String fctregion;
          WebService String fctpstl;
          WebService String fctcountry;
          WebService String fctphone;
          WebService String fctfax;
          WebService String type;
          WebService String reltnid;

 
          public Supplierfacility(Supplier_facility__c vndfacility, facility__c facility,String country, String region) {
               this.supplierno = vndfacility.Supplier_Number__c;
               this.factno = vndfacility.facility_Number__c;
               this.status = vndfacility.Relation_Status__c;
               this.reltnid = vndfacility.Name;
               this.suppliername = vndfacility.Supplier_Name__c;
               this.type = vndfacility.Supplier_Type__c;
               this.facilityname = facility.Name;
               this.fctaddress1 = facility.Address_Line_1__c;
               this.fctaddress2 = facility.Address_Line_2__c;
               this.fctcity = facility.City__c;
               this.fctregion = region;
               this.fctpstl = facility.PSTL_Code__c;
               this.fctcountry = country;
               this.acctgrp = acctgrpVndfacility;
               this.fctphone = facility.Phone__c;
               this.fctfax = facility.Fax__c;
          
          }
     }
//
// Definition of Supplier response object 
// 
    
    global class Supplier {
          WebService String supplierId;
          WebService String suppliername;
          WebService String suppliername2;
 //         WebService String address1;
 //         WebService String address2;
 //         WebService String city;
 //         WebService String region;
 //         WebService String pstl;
          WebService String acctgrp;
          WebService String searchTrm;
          WebService String country;
  //        WebService String phone;
 //         WebService String fax;
          WebService String suppliertype;
          WebService String supplierstatus;
 
        
          public Supplier() {}
 
          public Supplier(Supplier__c supplier, String auditcountry) {
               this.supplierId = supplier.Supplier_Number__c;
               this.suppliername = supplier.Name;
               this.suppliername2 = supplier.Supplier_Name_2__c;
               this.country = auditcountry;
               this.acctgrp = acctgrpSupplier;
               this.searchTrm = searchTrmVnd;
               this.suppliertype = supplier.Supplier_Type__c;
               this.supplierstatus = supplier.Supplier_Status__c;
            

          }
     }

 //
 // Web service to retrieve the FacilityBlock Status over a given time period
 // Input is either D,H,M for timeUnit and integer for timeValue
 // Example:
 // D,1 = Give me all changes from the last day
 // H,3 = Give me all changes from the last 3 hours
 // M,40 = Give me all changes from the last 40 minutes

 
    
 webService static List<Blockstatus> getBlockstatus(String timeUnit, integer timeValue){
        
    List<BlockStatus> blockstatus = new List<Blockstatus>();
        
        Datetime mydatetime;
        mydatetime = Datetime.now();
        
        if(timeUnit == 'D'){
            timeValue = timeValue * -1;
            mydatetime = mydatetime.addDays(timeValue);  
        } else {
            if(timeUnit == 'H'){
                 timeValue = timeValue * -1;
                 mydatetime = mydatetime.addHours(timeValue);
                
            } else {
               if(timeUnit == 'M'){
                 timeValue = timeValue * -1;
                 mydatetime = mydatetime.addMinutes(timeValue);  
            }
            }
        }
         
        String returndate = mydatetime.format();
        
        List<facility__c> nfacility = [Select i.Name, i.facility_Name_2__c, i.facility_Number__c, i.facility_Status__c,
                                    i.Address_Line_1__c, i.Address_Line_2__c,i.city__c,i.region__c,i.PSTL_Code__c,
                                    i.Country__c,i.phone__C,i.fax__c,i.Green_List_Status__c,
                             (Select facility_Number__c, 
                              Supplier_Number__c,Relation_Status__c, Organization__c, Name, Contract_Signed_Date__c  from Suppliers_Facilities__r order by Name) 
                                FROM Facility__c i                                         
                                  WHERE i.LastModifiedDate > :mydatetime];

  // Split up the vendorfacility relationship record  from facility
 //     
        
       List<Supplier_facility__c> vndfacility = new List<Supplier_facility__c>();
       List<Supplier_facility__c> nvndfacility = new List<Supplier_facility__c>();
       i = 0;
       k = 0;
              
        for(facility__c fctry : nfacility){
           vndfacility = nfacility[i].Suppliers_Facilities__r;
           
            k = 0;
            for(Supplier_facility__c vndfctry : vndfacility){
                nvndfacility.add(vndfacility[k]);
                k++;               
            }
         i++;
        }      
 
        i = 0;
        k = 0;
        boolean fndsts = false;
 
     
  // The purpose of this loop is to further check if the relationship records have some condition for which
  // the facility should be transferred. 
  //    
     
        for(facility__c fctry : nfacility)   {
             k = 0;
               for(Supplier_facility__c vndfctry : nvndfacility ){
 
                   blockstatus.add(new Blockstatus(fctry)); 
                   k++;
               }
            i++;        
        }
     return blockstatus;
    } 
     
 //
 // Web service to retrieve all changed factories over a given time period
 // Input is either D,H,M for timeUnit and integer for timeValue
 // Example:
 // D,1 = Give me all changes from the last day
 // H,3 = Give me all changes from the last 3 hours
 // M,40 = Give me all changes from the last 40 minutes

    
    webService static List<facility> getFacilities(String timeUnit, integer timeValue){
       
        List<facility> facility = new List<facility>();
        
        Datetime mydatetime;
        mydatetime = Datetime.now();
        
        if(timeUnit == 'D'){
            timeValue = timeValue * -1;
            mydatetime = mydatetime.addDays(timeValue);  
        } else {
            if(timeUnit == 'H'){
                 timeValue = timeValue * -1;
                 mydatetime = mydatetime.addHours(timeValue);
                
            } else {
               if(timeUnit == 'M'){
                 timeValue = timeValue * -1;
                 mydatetime = mydatetime.addMinutes(timeValue);  
            }
            }
        }
         
        String returndate = mydatetime.format();
        
        List<facility__c> nfacility = [Select i.Name, i.facility_Name_2__c, i.facility_Number__c, i.facility_Status__c,
                                    i.Address_Line_1__c, i.Address_Line_2__c,i.city__c,i.region__c,i.PSTL_Code__c,
                                    i.Country__c,i.phone__C,i.fax__c,i.Green_List_Status__c,i.LastModifiedDate,
                             (Select facility_Number__c,Supplier_Number__c,Relation_Status__c, Organization__c, Name, Contract_Signed_Date__c  from Suppliers_Facilities__r order by Name) 
                                FROM facility__c i                                         
                                  WHERE i.LastModifiedDate > :mydatetime];

        
 // Split up the vendorfacility relationship record  from facility
 //     
        
       List<Supplier_facility__c> vndfacility = new List<Supplier_facility__c>();
       List<Supplier_facility__c> nvndfacility = new List<Supplier_facility__c>();
       i = 0;
       k = 0;
              
        for(facility__c fctry : nfacility){
           vndfacility = nfacility[i].Suppliers_Facilities__r;
            k = 0;
            for(Supplier_facility__c vndfctry : vndfacility){
                nvndfacility.add(vndfacility[k]);
                k++;               
            }
         i++;
        }     
           
     
        i = 0;
        k = 0;
        boolean fndsts = false;
 
              
        List<Country__c> countryList = [Select i.id, i.Name From Country__c i];
        List<Region__c> regionList = [Select i.id, i.Name From Region__c i];
                                               
        Map<String, String> cntryMap = new Map<String, String>();
        Map<String, String> regionMap = new Map<String, String>();

        
// Load Countries into a map
       i = 0;
       for (Country__c cntry : countryList){ 
          cntryMap.put(countryList[i].id, countryList[i].Name);    
          i++;
          }   
        
 // Load Regions into a map       
        i = 0;
       for (Region__c regn : regionList){ 
          regionMap.put(regionList[i].id, regionList[i].Name);    
          i++;
        }
        
       i = 0; 
       for(facility__c fctry : nfacility)   {
           
                String countryname = cntryMap.get(nfacility[i].Country__c);
                String regionname = regionMap.get(nfacility[i].Region__c);
     
            k = 0;
            for(Supplier_facility__c vndfctry : nvndfacility ){
           
    
                fndsts = true;
                supplno = nvndfacility[k].Supplier_Number__c;
                rltnStatus = nvndfacility[k].Relation_Status__c; 
                rltnId = nvndfacility[k].Name;
                facility.add(new facility(nfacility[i],countryname,regionname,supplno,rltnStatus,rltnId));  
                    
                k++;
               }

     //       if(!fndsts){
     //             vendorno =  '  ';
     //             rltnStatus =  ' '; 
     //             rltnId =  ' '; 
     //             facility.add(new facility(nfacility[i],vendorno,rltnStatus,rltnId));  
             
     //       } 
            fndsts = false;
            i++;
        }     
              
        Return facility;               
    }
 
    

 //
 // Web service to retrieve all changed vendors over a given time period
 // Input it is either D,H,M for timeUnit and integer for timeValue
 // Example:
 // D,1 = Give me all changes from the last day
 // H,3 = Give me all changes from the last 3 hours
 // M,40 = Give me all changes from the last 40 minutes
    
  webService static List<Supplier> getSuppliers(String timeUnit, integer timeValue){
       
        List<Supplier> result = new List<Supplier>();
        
        Datetime mydatetime;
        mydatetime = Datetime.now();
        
        if(timeUnit == 'D'){
            timeValue = timeValue * -1;
            mydatetime = mydatetime.addDays(timeValue);  
        } else {
            if(timeUnit == 'H'){
                 timeValue = timeValue * -1;
                 mydatetime = mydatetime.addHours(timeValue);
                
            } else {
               if(timeUnit == 'M'){
                 timeValue = timeValue * -1;
                 mydatetime = mydatetime.addMinutes(timeValue);  
            }
            }
        }
         
        String returndate = mydatetime.format();
        String auditcountry;
      
        i = 0;
        List<Supplier__c> nvendor = [select Supplier_Number__c,
            Name, Supplier_Name_2__c, Address_Line_1__c, Address_Line_2__c, City__c,  Region__c,
            Country__c, PSTL_code__c, Phone__c, FAX__c, Supplier_Status__c, Supplier_Type__c, Organization__c,
            Contract_Signed_Date__c
            From Supplier__c i
            WHERE i.LastModifiedDate > :mydatetime AND i.Contract_Signed_Date__c != Null];
       
     
        i = 0;
        k = 0;
        boolean fndsts = false;
           
        List<Country__c> countryList = [Select i.id, i.Name From Country__c i];
                                                   
        Map<String, String> cntryMap = new Map<String, String>();
  

        
// Load Countries into a map
       i = 0;
       for (Country__c cntry : countryList){ 
          cntryMap.put(countryList[i].id, countryList[i].Name);    
          i++;
          }   
        
      i = 0;
      
        for(Supplier__c vendor: nvendor) 
        {
            
         if(nvendor[i].Country__c != null) {
            String countryname = cntryMap.get(nvendor[i].Country__c);   
            auditcountry = countryname;
         }else {
            auditcountry = '';
         }
        
         result.add(new Supplier(vendor,auditcountry));
         i++;
        }      
        Return result;
        
        
    }

 //
 // Web service to retrieve all changed vendor/facility relationship over a given time period
 // Input it is either D,H,M for timeUnit and integer for timeValue
 // Example:
 // D,1 = Give me all changes from the last day
 // H,3 = Give me all changes from the last 3 hours
 // M,40 = Give me all changes from the last 40 minutes

    
    webService static List<Supplierfacility> getSupplierfacility(String timeUnit, integer timeValue){
       
        List<Supplierfacility> result = new List<Supplierfacility>();
        
        Datetime mydatetime;
        mydatetime = Datetime.now();
        
        if(timeUnit == 'D'){
            timeValue = timeValue * -1;
            mydatetime = mydatetime.addDays(timeValue);  
        } else {
            if(timeUnit == 'H'){
                 timeValue = timeValue * -1;
                 mydatetime = mydatetime.addHours(timeValue);
                
            } else {
               if(timeUnit == 'M'){
                 timeValue = timeValue * -1;
                 mydatetime = mydatetime.addMinutes(timeValue);  
            }
            }
        }
         
        String returndate = mydatetime.format();
             
        List<Country__c> countryList = [Select i.id, i.Name From Country__c i];
        List<Region__c> regionList = [Select i.id, i.Name From Region__c i];
                                               
        Map<String, String> cntryMap = new Map<String, String>();
        Map<String, String> regionMap = new Map<String, String>();

        
// Load Countries into a map
       i = 0;
       for (Country__c cntry : countryList){ 
          cntryMap.put(countryList[i].id, countryList[i].Name);    
          i++;
          }   
        
 // Load Regions into a map       
        i = 0;
       for (Region__c regn : regionList){ 
          regionMap.put(regionList[i].id, regionList[i].Name);    
          i++;
        }
             
        
        for(Supplier_Facility__c vndfacility: [
            select i.facility_Number__c,
                   i.Supplier_Number__c,
                   i.Supplier_Type__c,
                   i.Relation_Status__c,
                   i.Name,
                   i.Supplier_Name__c
 
            From Supplier_facility__c i
            WHERE i.LastModifiedDate > :mydatetime AND i.Contract_Signed_Date__c != Null])  
        {
           String auditcountry;
           String regionname;
            
             facility__c facility = [Select i.Name,i.facility_Name_2__c, i.Address_Line_1__c, i.Address_Line_2__c, 
                 i.City__c, i.Region__c, i.Country__c, i.PSTL_Code__c, i.Phone__c, i.Fax__c 
                 from facility__c i
                 where i.facility_Number__c = :vndfacility.facility_Number__c Limit 1];
            
// Get the country
// 
          if(facility.Country__c != null) {
                String countryname = cntryMap.get(facility.Country__c);           
            auditcountry = countryname;
              }else {
            auditcountry = '';
          }
 
// Get the Region 
         if(facility.Region__c != null) {
              String region = regionMap.get(facility.Region__c);      
            regionname = region;
              }else {
            regionname = '';
          }         
            
                
            
            result.add(new Supplierfacility(vndfacility,facility,auditcountry,regionname));
        }     
            
        Return result;      
        
    }  
    

}