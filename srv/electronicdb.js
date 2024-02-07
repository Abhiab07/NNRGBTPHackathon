const cds = require('@sap/cds');

function calcDesc(code) {
    var sta_des;
    console.log(code);
    if(code === "TN"){
        sta_des="TAMIL NADU";
    }
    else if(code === "TS"){
        sta_des="TELANGANA";
    }
    else if(code === "KN"){
        sta_des="KARNATAKA";
    }
    else if(code === "KE"){
        sta_des="KERALA";
    }
    else if(code === "AP"){
        sta_des="ANDHRA PRADESH";
    }
    return sta_des;
    
}

module.exports = cds.service.impl(function () {

    const { Business_partner, States} = this.entities();

    



    this.before(['CREATE'], Business_partner, async(req) => {
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