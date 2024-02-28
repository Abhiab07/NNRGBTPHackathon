const cds = require('@sap/cds');

function calcDesc(code) {
    var state_description;
    console.log(code);
    if(code === "TN"){
        state_description="TAMIL NADU";
    }
    else if(code === "TS"){
        state_description="TELANGANA";
    }
    else if(code === "KN"){
        state_description="KARNATAKA";
    }
    else if(code === "KE"){
        state_description="KERALA";
    }
    else if(code === "AP"){
        state_description="ANDHRA PRADESH";
    }
    return state_description;
    
}

module.exports = cds.service.impl(function () {

    const { BusinessPartner, Store, States} = this.entities();



    this.before(['CREATE'], BusinessPartner, async(req) => {
        state_description = calcDesc(req.data.state);
        console.log(state_description);
        req.data.state=state_description;
    });


    
    this.before(['CREATE'], Store, async(req) => {
        state_description = calcDesc(req.data.state);
        console.log(state_description);
        req.data.state=state_description;
    });



    this.on('READ', States, async(req) => {
        states = [
            {"code":"TN", "description":"TAMIL NADU"},
            {"code":"TS", "description":"TELANGANA"},
            {"code":"AP", "description":"ANDHRA PRADESH"},
            {"code":"KA", "description":"KARNATAKA"},
            {"code":"KE", "description":"KERALA"},

        ]
        states.$count=states.length;
        return states;
    })

    

});