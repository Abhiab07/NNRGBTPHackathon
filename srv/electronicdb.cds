using { com.abhi.store as db } from '../db/schema';

service Electronics {

    entity BusinessPartner as projection on db.BusinessPartner;
    entity States as projection on db.States;
    entity Product as projection on db.Product{
         @UI.Hidden : true
        ID,
        *
    };
    entity Store as projection on db.Store{
        @UI.Hidden : true
        ID,
        *
    };
    entity Stock as projection on db.Stock{
        @UI.Hidden : true
        ID,
        *
    };
    entity Purchase as projection on db.Purchase;
    // entity Items as projection on db.Items;
}

annotate Electronics.BusinessPartner with @odata.draft.enabled ;
annotate Electronics.Store with @odata.draft.enabled ;
annotate Electronics.Product with @odata.draft.enabled ;
annotate Electronics.Stock with @odata.draft.enabled ;
annotate Electronics.Purchase with @odata.draft.enabled;
// annotate Electronics.Items with @odata.draft.enabled;


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
        {
            Label: 'Vendor',
            Value: Is_vendor
        },{
            Label: 'Customer',
            Value: Is_customer
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
        {
            Label: 'Vendor',
            Value: Is_vendor
        },{
            Label: 'Customer',
            Value: Is_customer
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
        Label : 'Store Info',
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
        Label : 'Product Info',
        Target: '@UI.FieldGroup#product'
    }, ],

);

annotate Electronics.Stock with @(
    UI.LineItem:[
        {
            Label:'Store Id',
            Value:storeId_ID
        },
         {
            Label:'Product Id',
            Value:productId_ID
        },
        {
            Label:'Stock Quantity',
            Value: qunt
        }
    ],
    UI.FieldGroup #stock :{
        $Type:'UI.FieldGroupType',
        Data:[
             {
            Label:'Store Id',
            Value:storeId_ID
        },
         {
            Label:'Product Id',
            Value:productId_ID
        },
         {
            Label:'Stock Quantity',
            Value:qunt
        }
        ],
    },
      UI.Facets:[
        {
            $Type:'UI.ReferenceFacet',
            ID:'stockFacet',
            Label:'StockInfo',
            Target:'@UI.FieldGroup#stock'
        },
    ],
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



annotate Electronics.Stock with {
    storeId @(
        Common.Text: storeId.name,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Store id',
            CollectionPath : 'Store',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : storeId_ID,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                },

            ]
        }
    );
productId @(
        Common.Text: productId.name,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {

            Label: 'Product id',
            CollectionPath : 'Product',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : productId_ID,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                },

            ]
        }
    );
}

// annotate Electronics.Items with @(
//     UI.LineItem         : [
//         {
//             Label: 'Store Id',
//             Value: storeId.store_id
//         },
//         {
//             Label: 'Product Id',
//             Value: productId.p_id
//         },
//         {
//             Label: 'Quantity',
//             Value: qnt
//         },
//         {
//             Label: 'Price',
//             Value: price
//         },

//     ],

//     UI.FieldGroup #items: {
//         $Type: 'UI.FieldGroupType',
//         Data : [
//             {
//                 Label: 'Store Id',
//                 Value: storeId_ID
//             },
//             {
//                 Label: 'Product Id',
//                 Value: productId_ID
//             },
//             {
//                 Label: 'Quantity',
//                 Value: qnt
//             },
//             {
//                 Label: 'Price',
//                 Value: price
//             },
//         ],
//     },
//     UI.Facets           : [{
//         $Type : 'UI.ReferenceFacet',
//         ID    : 'itemsFacet',
//         Label : 'items',
//         Target: '@UI.FieldGroup#items',
//     }, ],
// );

annotate Electronics.Purchase with @(
    UI.LineItem          : [
        {
            Label: 'Purchase Order Number',
            Value: pu_id
        },
        {
            Label: 'Business Partner',
            Value: bp_ID
        },
        {
            Label: 'Product purchase Date',
            Value: pDate
        },
        {
            Label: 'store id',
            Value: stId_ID
        },
        // {
        //     Label: 'quantity',
        //     Value: Items.item.qnt
        // },
        // {
        //     Label: 'Product id',
        //     Value: Items.item.productId_ID
        // },
        // {
        //     Label: 'Price',
        //     Value: Items.item.price
        // },
    ],
    UI.FieldGroup #pur: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                Label: 'Purchase Order Number',
                Value: pu_id
            },
            {
                Label: 'Business Partner',
                Value: bp_ID
            },
            {
                Label: 'Product purchase Date',
                Value: pDate
            },
            {
                Label: 'Store ID',
                Value: stId_ID
            },
        ],
    },
    UI.Facets            : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'purFacet',
            Label : 'Purchase Facets',
            Target: '@UI.FieldGroup#pur'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'itemssFacet',
            Label : ' Item facets',
            Target: 'Items/@UI.LineItem'
        },
    ],
);

annotate Electronics.Purchase with {
    bp @(
        Common.Text: bp.name,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            Label         : 'Business Partner',
            CollectionPath: 'BusinessPartner',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: bp_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name'
                },

            ]
        }
    );
     stId  @(
        Common.Text: stId.name,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            Label         : 'Store id',
            CollectionPath: 'Store',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: stId_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name'
                },

            ]
        }
    );
};


// annotate Electronics.Purchase.Items with @(
//     UI.LineItem :[
//         {
//             Value: item_ID
//         },

//     ],
//     UI.FieldGroup #purchitems: {
//         $Type    : 'UI.FieldGroupType',
//         Data     : [
//             {
//                 Value: item_ID
//             },
            
//         ],
//     },
//         UI.Facets: [{
//             $Type : 'UI.ReferenceFacet',
//             ID    : 'puritemsFacet',
//             Label : 'Purchase Items',
//             Target: '@UI.FieldGroup#purchitems',
//         }, ]
    
// );

// annotate Electronics.Items with {
//     storeId  @(
//         Common.Text: storeId.name,
//         Common.TextArrangement: #TextOnly,
//         Common.ValueListWithFixedValues: true,
//         Common.ValueList               : {
//             Label         : 'Store id',
//             CollectionPath: 'Store',
//             Parameters    : [
//                 {
//                     $Type            : 'Common.ValueListParameterInOut',
//                     LocalDataProperty: storeId_ID,
//                     ValueListProperty: 'ID'
//                 },
//                 {
//                     $Type            : 'Common.ValueListParameterDisplayOnly',
//                     ValueListProperty: 'name'
//                 },

//             ]
//         }
//     );
//     productId @(
//         Common.Text: productId.name,
//         Common.TextArrangement: #TextOnly,
//         Common.ValueListWithFixedValues: true,
//         Common.ValueList               : {
//             Label         : 'Product id',
//             CollectionPath: 'Product',
//             Parameters    : [
//                 {
//                     $Type            : 'Common.ValueListParameterInOut',
//                     LocalDataProperty: productId_ID,
//                     ValueListProperty: 'ID'
//                 },
//                 {
//                     $Type            : 'Common.ValueListParameterDisplayOnly',
//                     ValueListProperty: 'name'
//                 },

//             ]
//         }
//     );
//     // qnt  @(
//     //     Common.Text: qnt.qunt,
//     //     Common.TextArrangement: #TextOnly,
//     //     Common.ValueListWithFixedValues: true,
//     //     Common.ValueList               : {
//     //         Label         : 'Quantity',
//     //         CollectionPath: 'Stock',
//     //         Parameters    : [
//     //             {
//     //                 $Type            : 'Common.ValueListParameterInOut',
//     //                 LocalDataProperty: qnt_ID,
//     //                 ValueListProperty: 'ID'
//     //             },
//     //             {
//     //                 $Type            : 'Common.ValueListParameterDisplayOnly',
//     //                 ValueListProperty: 'qunt'
//     //             },

//     //         ]
//     //     }
//     // );
//     // price     @(
//     //     Common.Text: price.sellPrice,
//     //     Common.TextArrangement: #TextOnly,
//     //     Common.ValueListWithFixedValues: true,
//     //     Common.ValueList               : {
//     //         Label         : 'Price',
//     //         CollectionPath: 'Product',
//     //         Parameters    : [
//     //             {
//     //                 $Type            : 'Common.ValueListParameterInOut',
//     //                 LocalDataProperty: price_ID,
//     //                 ValueListProperty: 'ID'
//     //             },
//     //             {
//     //                 $Type            : 'Common.ValueListParameterDisplayOnly',
//     //                 ValueListProperty: 'sellPrice'
//     //             },

//     //         ]
//     //     }
//     // );
// };


annotate Electronics.Purchase.Items with {
     item @(
        Common.Text: item.productId.name,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Items',
            CollectionPath : 'Items',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : item_ID,
                    ValueListProperty : 'productId_ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'productId.name'
                },
            ]
        }
    )
};


annotate Electronics.Product with {
    @Common.Text:'{Product}'
    @Core.IsURL:true
    @Core.MediaType:'image/jpg' 
    imageURL
};