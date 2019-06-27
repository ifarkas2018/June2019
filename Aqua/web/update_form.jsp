<%-- 
    Document   : update_form
    Created on : 13-Mar-2019, 11:36:48
    Author     : Ingrid Farkas
--%>

<!-- update_form.jsp - adds the form to the page Update Book -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="miscellaneous.AquaMethods"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aqua Books - Update Books</title>
        
        <script src="JavaScript/ValidationJS.js"></script>
       
        <script>
            
            NUM_FIELDS = 11; // maximum number of the input fields on this and the previous forms             
            START = 3; 
           
            // setCookie: creates cookie inputI = value in the input field ; ( I - number 3..11 )
            function setCookie() {
                var i;
                var inp_names = new Array( 'title', 'author', 'isbn', 'price', 'pages', 'category', 'descr', 'publisher', 'yrpublished' ); // names of the input fields
                // cookies named input0, input1, input2 were created in upd_del_title.jsp
                for ( i = START; i <= NUM_FIELDS; i++ ) {
                    document.cookie = "input" + i + "=" + document.getElementById(inp_names[i-3]).value + ";"; // creating a cookie
                } 
            }
            
            // setDefaults : sets the values of the cookies ( input0, input1, input2 ) to the default
            function setDefaults() {              
                var i;
                
                for ( i = START; i <= NUM_FIELDS; i++ ) {
                    document.cookie = "input" + i + "= "; // setting the VALUE of the cookie to EMPTY
                }
                setCookie(); // go through every input field and write its content to the cookie
            }
        </script>
    </head>
    
    <body onload="setDefaults()">
        <%
            final String PAGE_NAME = "update_page.jsp"; // page which is shown now 
        %>
        <%  
            HttpSession hSession2 = AquaMethods.returnSession(request);
            
                                            
            String input3 = ""; // read the value which was before in the input field title to show it again
            String input4 = "";
            String input5 = "";
            String input6 = "";
            String input7 = "";
            String input8 = "";
            String input9 = "";
            String input10 = "";
            String input11 = "";
            
            // IDEA : fill_in variable is set in SubscrServl.java - true if some of the input session variables were set,
            // and they need to be added to the form here - this true if the user BEFORE LOADED THIS PAGE and after that he entered
            // the email to subscribe ( in the footer ) and on the next page he clicked on Close
            if (AquaMethods.sessVarExists(hSession2, "fill_in")) { 
                String fill_in = String.valueOf(hSession2.getAttribute("fill_in")); 
                
                // session variable page_name is set below. It is used if the user clicks on the Subscribe button and after that on
                // the page subscrres_content if the user clicks on the Close button then this page will be shown again
                if (AquaMethods.sessVarExists(hSession2, "page_name")) { 
                    String page_name = String.valueOf(hSession2.getAttribute("page_name"));
                    
                    // if the user clicked on the Close button on the page subscrres_content and this page was shown before (page_name)
                    // and if something is stored in session variables input 
                    // then retrieve the session variable input3..input11 to show it in the input field title ( and other fields )
                    if ((page_name.equalsIgnoreCase(PAGE_NAME)) && (fill_in.equalsIgnoreCase("true"))) {
                        if (AquaMethods.sessVarExists(hSession2, "input3")) {
                            input3 = String.valueOf(hSession2.getAttribute("input3")); // the value that was in this input field
                        } 
                        if (AquaMethods.sessVarExists(hSession2, "input4")) {
                            input4 = String.valueOf(hSession2.getAttribute("input4"));
                        } 
                        if (AquaMethods.sessVarExists(hSession2, "input5")) {
                            input5 = String.valueOf(hSession2.getAttribute("input5"));
                        }
                        if (AquaMethods.sessVarExists(hSession2, "input6")) {
                            input6 = String.valueOf(hSession2.getAttribute("input6")); // the value that was in this input field
                        } 
                        if (AquaMethods.sessVarExists(hSession2, "input7")) {
                            input7 = String.valueOf(hSession2.getAttribute("input7"));
                        } 
                        if (AquaMethods.sessVarExists(hSession2, "input8")) {
                            input8 = String.valueOf(hSession2.getAttribute("input8"));
                        } 
                        if (AquaMethods.sessVarExists(hSession2, "input9")) {
                            input9 = String.valueOf(hSession2.getAttribute("input9")); // the value that was in this input field
                        } 
                        if (AquaMethods.sessVarExists(hSession2, "input10")) {
                            input10 = String.valueOf(hSession2.getAttribute("input10"));
                        } 
                        if (AquaMethods.sessVarExists(hSession2, "input11")) {
                            input11 = String.valueOf(hSession2.getAttribute("input11"));
                        } 
                        AquaMethods.setToEmptyInput( hSession2 ); // setToEmpty: set the session variable values to "" for the variables named input3, input4, ...
                    }
                }
                hSession2.setAttribute("fill_in", "false"); // the input fields don't need to be filled in
            }
            AquaMethods.setToEmptyInput( hSession2 ); // setToEmptyInput: set the session variable values to "" for the variables named input0, input1, ...
            hSession2.setAttribute("page_name", PAGE_NAME);
        %>
        
        <%
            hSession2.setAttribute("webpg_name", "update_page.jsp");
            // if the user just did do the subscribe, the form on the NEXT web page DOESN'T NEED to show the previous values
            hSession2.setAttribute("subscribe", "false");
        %>    
        <!-- adding a new row to the Bootstrap grid; class whitebckgr is for setting the background to white -->
        <div class="whitebckgr">
            <div class="row"> <!-- adding a new row to the Bootstrap grid -->
                <!-- the Bootstrap column takes 6 columns on the large desktops and 6 columns on the medium sized desktops -->
                <div class="col-lg-6 col-md-6"> 
                    <br /><br />
                    <div> 
                        <!-- horizontally centering the picture using center-image, img-fluid is for responsive image -->
                        <img src="images/books.png" class="img-fluid center-image" alt="picture of books" title="picture of books"> 
                    </div>
                </div>
                
                <!-- the Bootstrap column takes 5 columns on the large desktops and 5 columns on the medium sized desktops -->
                <div class="col-lg-5 col-md-5"> 
                    <div class="container"> <!-- adding the container to the Bootstrap grid -->
                        <div class="row"> <!-- adding a new row to the Bootstrap grid -->
                            <div class="col">
                                &nbsp; &nbsp;
                                <br />
                                <h3>Update a Book</h3>
                                <br/> 
                                Please enter the new information about the book 
                                <br />
                                <br />
                                <!-- after clicking on the button updateDB.jsp is shown -->
                                <form id="update_book" name="update_book" action="updateDB.jsp" onsubmit="return checkForm();" method="post">
                                    <!-- creating the input element for the title -->
                                    <div class="form-group">
                                        <label for="title">Title</label> <!-- title label -->
                                        <input type="text" class="form-control form-control-sm" name="title" id="title" maxlength="60" onchange="setCookie()" value="<%= input3 %>"> <!-- title input field -->
                                    </div>
                                        
                                    <!-- creating the input element for the author -->
                                    <div class="form-group">
                                        <label for="author">Author's Name</label> <!-- author's name label -->
                                        <input type="text" class="form-control form-control-sm" name="author" id="author" maxlength="70" onchange="setCookie()" onfocusout="valLetters(document.update_book.author, author_message, 'false');" value="<%= input4 %>"> <!-- author input field -->
                                        <span id="author_message" class="text_color"></span>
                                    </div>
                
                                    <!-- creating the input element for the ISBN -->
                                    <div class="form-group">
                                        <label for="isbn">ISBN</label> <!-- ISBN label -->
                                        <!-- isbn input field : up to 13 characters can be entered -->
                                        <input type="text" class="form-control form-control-sm" maxlength="13" name="isbn" id="isbn" maxlength="13" onchange="setCookie()" onfocusout='isNumber("update_book", "isbn", "is_isbn", "isbn_message", document.update_book.isbn)' value="<%= input5 %>"> 
                                        <span id="isbn_message" class="text_color"></span>
                                    </div>
                                        
                                    <!-- creating the input element for price -->
                                    <div class="form-group">
                                        <label for="price">Price</label> <!-- Price label -->
                                        <input type="text" class="form-control form-control-sm" name="price" id="price" maxlength="6" onchange="setCookie()" onfocusout='isNumber("update_book", "price", "is_price", "price_message", document.update_book.price)' value="<%= input6 %>"> 
                                        <span id="price_message" class="text_color"></span>
                                    </div>
                                        
                                    <!-- creating the input element for number of pages -->
                                    <div class="form-group">
                                        <label for="pages">Pages</label> <!-- Pages label -->
                                        <input type="text" class="form-control form-control-sm" name="pages" id="pages" maxlength="4" onchange="setCookie()" onfocusout='isNumber("update_book", "pages", "is_pages", "pages_message", document.update_book.pages)' value="<%= input7 %>"> 
                                        <span id="pages_message" class="text_color"></span>
                                    </div>
                                        
                                    <!-- creating the drop down list for the Category -->
                                    <div class="form-group"> 
                                        <label for="category">Category</label> <!-- category label -->
                                        <!-- creating a drop down list; form-control-sm is used for narrower control -->
                                        <select class="form-control form-control-sm" name="category" id="category" onchange="setCookie()">
                                            <% if (input8.equalsIgnoreCase("all")){ %>
                                                <option value="all" selected>All Categories</option> <!-- options shown in the drop down list -->
                                            <% } else { %>
                                                <option value="all">All Categories</option>
                                            <% } %>
                                            
                                            <% if (input8.equalsIgnoreCase("fict")){ %>
                                                <option value="fict" selected>Fiction &amp; Poetry</option> 
                                            <% } else { %>
                                                <option value="fict">Fiction &amp; Poetry</option>   
                                            <% } %>
                                            
                                            <% if (input8.equalsIgnoreCase("bus")){ %>
                                                <option value="bus" selected>Business</option> 
                                            <% } else { %>
                                                <option value="bus">Business</option>      
                                            <% } %>
                                            
                                            <% if (input8.equalsIgnoreCase("comp")){ %>
                                                <option value="comp" selected>Computing &amp; IT</option> 
                                            <% } else { %>
                                                <option value="comp">Computing &amp; IT</option>  
                                            <% } %>
                                            
                                            <% if (input8.equalsIgnoreCase("edu")){ %>
                                                <option value="edu" selected>Education</option> 
                                            <% } else { %>
                                                <option value="edu">Education</option>   
                                            <% } %>
                                            
                                            <% if (input8.equalsIgnoreCase("child")){ %>
                                                <option value="child" selected>Children's</option> 
                                            <% } else { %>
                                                <option value="child">Children's</option>  
                                            <% } %>
                                        </select>
                                    </div>
                                        
                                    <!-- creating the textarea for the book description -->
                                    <div class="form-group">
                                        <label for="descr">Description</label> <!-- Description label --> 
                                        <textarea class="form-control" name="descr" id="descr" rows="4" onchange="setCookie()"><%= input9 %></textarea>
                                    </div>
                                        
                                    <!-- creating the input element for the publisher -->
                                    <div class="form-group">
                                        <label for="publisher">Publisher</label> <!-- publisher label -->
                                        <!-- filling in the publisher is required -->
                                        <input type="text" class="form-control form-control-sm" name="publisher" id="publisher" maxlength="40" onchange="setCookie()" value="<%= input10 %>"> 
                                    </div>
                                    
                                    <!-- creating the input element for year the book was published -->
                                    <div class="form-group">
                                        <label for="yrpublished">Publication Year</label> <!-- the label the book got published -->
                                        <input type="text" class="form-control form-control-sm" name="yrpublished" id="yrpublished" maxlength="4" onchange="setCookie()" onfocusout='isNumber("update_book", "yrpublished", "is_yrpubl", "yrpubl_message", document.update_book.yrpublished)' value="<%= input11 %>"> 
                                        <span id="yrpubl_message" class="text_color"></span>
                                    </div> 
                                        
                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                &nbsp; &nbsp; <!-- adding some empty space -->
                                            </div>
                                        </div>    
                                    </div>
                                        
                                    <!-- adding the Search button to the form; btn-sm is used for smaller ( narrower ) size of the control -->
                                    <button type="submit" id="btnSubmit" class="btn btn-info btn-sm">Update</button>
                                    
                                    <!-- adding a new container -->
                                    <div class="container">
                                        <div class="row">
                                            <div class="col"
                                    <div class="container">
                                        <div class="row">
                                            <div class="col">
                                                &nbsp; &nbsp; <!-- adding some empty space -->
                                            </div>
                                        </div>    
                                    </div> 
                                </form>  
                            </div> <!-- end of class="col" -->
                        </div> <!-- end of class="row" --> 
                    </div> <!-- end of class="container" -->
                </div> <!-- end of class="col-lg-5 col-md-5" -->
            </div> <!-- end of class="row" -->
        </div> <!-- end of class="whitebckgr" -->
            
        <!-- adding a new row; class whitebckgr is for setting the background to white -->
        <div class="whitebckgr">
            <div class="col">
                &nbsp; &nbsp;
            </div>
        </div> 
    </div>
             
    </body>
</html>