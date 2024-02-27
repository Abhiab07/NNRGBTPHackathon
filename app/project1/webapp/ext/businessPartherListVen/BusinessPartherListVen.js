sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        is_Vendor: function(oBindingContext,aSelectedContexts) {       
            aSelectedContexts.forEach(element => {
               MessageToast.show(element.sPath);
               var aData = jQuery.ajax({
                   type: "PATCH",
                   contentType: "application/json",
                   url: "/odata/v4/electronics/"+element.sPath,
                   data: JSON.stringify({Is_vendor:true})
               }).then(element.requestRefresh());
            });
        },
	is_notVen: function(oBindingContext,aSelectedContexts) {       
        aSelectedContexts.forEach(element => {
           MessageToast.show(element.sPath);
           var aData = jQuery.ajax({
               type: "PATCH",
               contentType: "application/json",
               url: "/odata/v4/electronics/"+element.sPath,
               data: JSON.stringify({Is_vendor:false})
           }).then(element.requestRefresh());
        });
    },
}
})
