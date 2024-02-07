using { com.abhi.store as db } from '../db/schema';

service Electronics {

    entity BusinessPartner as projection on db.BusinessPartner;
    entity States as projection on db.States;

}
annotate Electronics.BusinessPartner with @odata.draft.enabled ;



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
            Value: state
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