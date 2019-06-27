/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* Project : Aqua
 * Author : Ingrid Farkas
 * myScript.js: functions used for validation
 */

NAME_VALIDATION = 'true'; // does the Author's Name input field contain only letters ( and apostrophe )
ISBN_VAL = 'true'; // does the ISBN input field contain only digits
PRICE_VAL = 'true'; // does the Price input field contain only digits
PG_VAL = 'true'; // does the Pages input field contain only digits
YRPUBL_VAL = 'true'; // does the Publication Year input field contain only digits

// setFocus: sets the focus on the input field inputfield ( for instance "title" ) on the form with id formid ( if the user didn't
// enter a value in the input field )
function setFocus(formid, inputfield){
    if ( document.forms[formid][inputfield].value == "" ){ 
        document.getElementById(inputfield).focus();
    } 
}

// isNumber: shows a message ( in the msg_field ) if the user entered a value that is a non numeric value ( in the input field named input_field )
// fieldFocus - the input field where the focus need to be set ( document.search_book.isbn )
// num_type - is the input in the field an isbn, price, pages or a year
// formid: id of te form
function isNumber( formid, input_field, num_type, msg_field, fieldFocus ) {
    var number; // the ISBN number

    // Get the value of the input field with id="isbn"
    number = document.getElementById(input_field).value;
    
    // if the value entered in a isbn is not a nuumber 
    
    if (isNaN(number)) {
        //alert("NOT a number");
        document.getElementById(msg_field).innerHTML = "* Can contain only digits"; // show the message
        if ( num_type == 'is_isbn' ) {
            ISBN_VAL  = 'false';
        } else if ( num_type == 'is_pages' ) {
            PG_VAL = 'false';
        } else if ( num_type == 'is_price' ) {
            PRICE_VAL = 'false';
        } else if ( num_type == 'is_yrpubl' ) {
            YRPUBL_VAL = 'false';
        }
        fieldFocus.focus(); // @@@@@@@@@@@@@@ document.search_book.isbn
    } else {
        //alert("a number");
        if ( num_type == 'is_isbn' ) {
            ISBN_VAL  = 'true';
        } else if ( num_type == 'is_pages' ) {
            PG_VAL = 'true';
        } else if ( num_type == 'is_price' ) {
            PRICE_VAL = 'true';
        } else if ( num_type == 'is_yrpubl' ) {
            YRPUBL_VAL = 'true';
        }
        document.getElementById(msg_field).innerHTML = ""; // show the message 
    }
    //alert("ISBN_VAL" + ISBN_VAL);
    //alert("PG_VAL" + PG_VAL);
}

// valLetters: checks whether in the control input_field there are only letters ( or apostrophe ). If not in the message_span the message is shown.
// required - if the input field was required to be filled in before showing the message, when the user corrects the mistake, below
// is shown again that the input field is required ( to be filled in )
// returns TRUE if in the input_field there are only letters otherwise it returns FALSE
function valLetters( input_field, message_span, required ){
    var regex = /^[a-zA-Z\x27\x20]+$/;
    if (!input_field.value == '') {
        if (!regex.test(input_field.value)) { // if the user entered some characters which are not letters ( in the input_field )
            message_span.innerHTML = "* Can contain only letters, apostrophes and space";
            NAME_VALIDATION = 'false';
            // set the focus in the input field where the user entered characters other than letters
            input_field.focus();
        } else { // the user entered characters which are letters ( in the input_field )
            NAME_VALIDATION = 'true';
            if ( required == 'true' ) {
                message_span.innerHTML = "* Required Field";
            } else {
                message_span.innerHTML = "";
            }
        }
    } else {
        if ( required == 'true' ) {
            NAME_VALIDATION = 'false';
            message_span.innerHTML = "* Required Field";
            input_field.focus();
        } else {
            NAME_VALIDATION = 'true';
            message_span.innerHTML = "";
        }
    }
}

// checkForm: if the validation was successful then return TRUE otherwise return FALSE
function checkForm(){
    //alert("NAME_VALIDATION" + NAME_VALIDATION );
    //alert("submit:ISBN_VAL" + ISBN_VAL);
    //alert("submit:PG_VAL" + PG_VAL);
    //alert("submit:PRICE_VAL" + PRICE_VAL);
    //alert("submit:YRPUBL_VAL" + YRPUBL_VAL);
    if ((NAME_VALIDATION === 'true') && (ISBN_VAL === 'true') && (PRICE_VAL === 'true') && (PG_VAL === 'true' ) && (YRPUBL_VAL === 'true')) { 
        return true;
    } else {
        return false;
    }
}

