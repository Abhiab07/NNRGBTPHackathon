namespace com.abhi.store;
using { cuid,managed } from '@sap/cds/common';

@assert.unique:{
   businesspartner_number  :[ businesspartner_number]
}


entity BusinessPartner : cuid,managed {
    @title : 'Business Partner Number'
    businesspartner_number : String(10);
    @title : 'Name'
    name : String(10) @mandatory;
    @title : 'Address 1'
    address1 : String(20) @mandatory;
    @title : 'Address 2'
    address2 : String(20) @mandatory;
     @title : 'City'
    city : String(20) @mandatory;
    @title:'State'
    state:String(3);
    virtual state_description : String(10) @Core.Computed;
    @title : 'PIN Code'
    pincode : String(20) @mandatory;
    @title : 'Do you Registerd for GSTN '
    is_gstn_reg : Boolean ;
    @title : 'GSTIN Number'
    gstin_number : String(20) @mandatory;
     @title : 'Is Vendor'
    Is_vendor: Boolean default false;
     @title : 'Is Customer'
    Is_customer: Boolean default false;
    
}

entity Store {
    key ID: UUID;
    @title : 'Store ID'
    store_id :String(10);
    @title : 'Name'
    name : String(100);
    @title : 'Address-1'
    add1 : String(255);
    @title : 'Address-2'
    add2     : String(255);
    @title : 'City'
    city         : String(100);
    @title:'State'
    state:String(3);
    virtual state_description : String(10) @Core.Computed;
    @title : 'PINCode'
    PinCode : String(10);
}

entity Product {
    key ID: UUID;
    @title : 'Product ID'
    p_id : String(20); 
    @title : 'Product Name'
    name : String(100);
    @title : 'Image URL' 
    imageURL : String(255);
    @title : 'Cost Price'
    costPrice : String(10); 
    @title : 'Selling price'
    sellPrice : String(10); 
}



@cds.persistence.skip
entity States {
    @title:'code'
    key code: String(3);
    @title:'description'
    description:String(20);
    
}

entity Stock {
    key ID : UUID;
    @title:'Store ID'
    storeId : Association to Store;
    @title:'Product ID'
    productId : Association to Product;
    @title:'Quantity'
    qunt: Integer;
}