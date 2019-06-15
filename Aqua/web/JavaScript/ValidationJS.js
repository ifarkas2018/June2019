/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function valalert(){
    alert("Alert1!");
    return false;
}

function myFunction() {
 document.getElementById("title_span").innerHTML = "Paragraph changed.";
}
            
// valLetters: checks whether in the control input_field there are only letters ( or apostrophe ). Otherwise in the message_span message is shown.
// returns TRUE if in the input_field there are only letters otherwise it returns FALSE
function valLetters(input_field, message_span){
    var regex = /^[a-zA-Z\x27\x20]+$/;
    if (!input_field.value == '') {
        if (!regex.test(input_field.value)) { // if the user entered some characters which are not letters ( in the input_field )
            message_span.innerHTML = "* Can contain only letters, apostrophes and space";
            NAME_VALIDATION = 'false';
            // set the focus in the input field where the user entered characters other than letters
            // document.upd_del_book.prev_author.focus();
            document.forms["upd_del_book"][inputfield].focus();
        } else { // the user entered characters which are letters ( in the input_field )
            NAME_VALIDATION = 'true';
            message_span.innerHTML = "";
        }
    } else {
        NAME_VALIDATION = 'true';
        message_span.innerHTML = "";
    }
}



