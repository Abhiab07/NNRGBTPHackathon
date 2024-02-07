using { com.abhi.store as db } from '../db/schema';

service Electronics {

    entity BusinessPartner as projection on db.BusinessPartner;
    entity States as projection on db.States;
    entity Product as projection on db.Product;
    entity Store as projection on db.Store{
        @UI.Hidden : true
        ID,
        *
    };

}
annotate Electronics.BusinessPartner with @odata.draft.enabled ;
annotate Electronics.Store with @odata.draft.enabled ;
annotate Electronics.Product with @odata.draft.enabled ;



annotate Electronics.BusinessPartner with {
   pincode     @assert.format: '^[1-9]{1}[0-9]{5}$';
   gstin_number @assert.format:'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9A-Z]{1}[0-9A-Z]{1}$'
}


annotate Electronics.BusinessPartner with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value: businesspartner_number
        },
        {
            $Type : 'UI.DataField',
            Value: name
        },
        {
            $Type : 'UI.DataField',
            Value: address1
        },
        {
            $Type : 'UI.DataField',
            Value: address2
        },
        {
            $Type : 'UI.DataField',
            Value: city
        },
        {
            $Type : 'UI.DataField',
            Value: pincode
        },
        {
            $Type : 'UI.DataField',
            Value: gstin_number
        },
        {
            $Type : 'UI.DataField',
            Value: is_gstn_reg
        },
        {
            Label: 'State',
            Value: state_description
        },
    ],
    UI.FieldGroup #BusinessPartnerInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            Value: businesspartner_number,
        },
         {
            $Type : 'UI.DataField',
            Value: name,
        },
         {
            $Type : 'UI.DataField',
            Value: address1,
        },
         {
            $Type : 'UI.DataField',
            Value: address2,
        },
         {
            $Type : 'UI.DataField',
            Value: city,
        },
         {
            $Type : 'UI.DataField',
            Value: pincode,
        },
         {
            $Type : 'UI.DataField',
            Value: gstin_number,
        },
        {
            $Type : 'UI.DataField',
            Value: is_gstn_reg,
        },
        {
            Label: 'State',
            Value: state,
        },
        ]
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'BusinessP',
            Label: 'Business Partner Information',
            Target: '@UI.FieldGroup#BusinessPartnerInformation',
        }
    ]
      
) ;

annotate Electronics.Store with @(
    UI.LineItem         : [
        {
            Label: 'Store Id',
            Value: store_id
        },
        {
            Label: 'Store name',
            Value: name
        },
        {
            Label: 'Address 1',
            Value: add1
        },
        {
            Label: 'Address 2',
            Value: add2
        },
        {
            Label: 'City',
            Value: city
        },
        {
            Label: 'State',
            Value: state
        },
        {
            Label: 'Pin code',
            Value: PinCode 
        },
    ],
    UI.FieldGroup #store: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                Label: 'Store Id',
                Value: store_id
            },
            {
                Label: 'Store name',
                Value: name
            },
            {
                Label: 'Address 1',
                Value: add1
            },
            {
                Label: 'Address 2',
                Value: add2
            },
            {
                Label: 'City',
                Value: city
            },
            {
                Label: 'State',
                Value: state
            },
            {
                Label: 'Pin code',
                Value: PinCode
            },
        ],
    },
    UI.Facets           : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'storeFacet',
        Label : 'store facets',
        Target: '@UI.FieldGroup#store'
    }, ],
);


annotate Electronics.Product with @(
    UI.LineItem           : [
        {
            Label: 'Product id',
            Value: p_id
        },
        {
            Label: 'Product Name',
            Value: name
        },
        {
            Label: 'Product Image URL',
            Value: imageURL
        },
        {
            Label: 'Cost Price',
            Value: costPrice
        },
        {
            Label: 'Sell Price',
            Value: sellPrice
        },
    ],
    UI.FieldGroup #product: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                Label: 'Product id',
                Value: p_id
            },
            {
                Label: 'Product Name',
                Value: name
            },
            {
                Label: 'Product Image URL',
                Value: imageURL
            },
            {
                Label: 'Cost Price',
                Value: costPrice
            },
            {
                Label: 'Sell Price',
                Value: sellPrice
            },
        ],
    },
    UI.Facets             : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'productFacet',
        Label : 'product facets',
        Target: '@UI.FieldGroup#product'
    }, ],

);

annotate Electronics.Store with  {
    state @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            Label         : 'State',
            CollectionPath: 'States',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: state,
                    ValueListProperty: 'code'
                },

                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description'
                },
            ]
        }
    );
};



annotate Electronics.BusinessPartner with {
    state @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            Label         : 'State',
            CollectionPath: 'States',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: state,
                    ValueListProperty: 'code'
                },

                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description'
                },
            ]
        }
    );
};

