function getBotResponse(input) {
    //rock paper scissors
    if (input == "1") {
        let text = "For Medicine Click this Link";
        let result = text.link("./med.html")
        return result;
    } else if (input == "2") {
        let text = "For Labs Click this Link";
        let result = text.link("./labs.html")
        return result;
    } else if (input == "3") {
        let text = "For Doctors Click this Link";
        let result = text.link("./team.html")
        return result;
    }
    else if(input == '4')
    {
        let text = "For Appointment Click this Link";
        let result = text.link('./team.html')
        return result;
    }

    else if (input == '5'){
        let text = "For Call Click this Link";
        let result = text.link('tel:0324-6228527')
        return result;
    }

    // Simple responses
    if (input == "hello") {
        return "Hello there!";
    } else if (input == "goodbye") {
        return "Talk to you later!";
    } else {
        return "Try asking something else!";
    }
}