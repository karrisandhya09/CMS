<%@page import="com.java.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.commons.lang.RandomStringUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- css -->
        <link rel="icon" href="images/log.png" type="image/png" sizes="16x16">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- template skin -->
        <link id="t-colors" href="css/default.css" rel="stylesheet">
        <title>Hospital Management System</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    </head>

    <body id="page-top" data-spy="scroll" data-target=".navbar-custom" style="background:url('images/bg1.jpg') repeat left top;">
        <%
            String name = (String) session.getAttribute("name");
            if (name != null) {
        %>

        <%!
            Connection con;
            PreparedStatement ps;
            ResultSet rs;
            Statement st;
            String dname, email, gender, pass, cpass, age, contact, dob, dept, did, fees, address, degree;
            int deptid;
        %>
        <%
            try {
                String id = request.getParameter("id");
                con = DB.getConnection();
                st = con.createStatement();
                rs = st.executeQuery("select * from table_doctor where Did='" + id + "'");
                if (rs.next()) {
                    did = rs.getString("Did");
                    dname = rs.getString("Dname");
                    email = rs.getString("Email");
                    pass = rs.getString("Pass");
                    cpass = rs.getString("Pass");
                    gender = rs.getString("Gender");
                    dob = rs.getString("dob");
                    degree = rs.getString("Degree");
                    dept = rs.getString("Department");
                    fees = rs.getString("Fees");
                    contact = rs.getString("Contact");
                    address = rs.getString("Address");
                    age = rs.getString("age");
                    deptid = rs.getInt("deptid");
                }
        %>

        <div id="wrapper">

            <jsp:include page="AHeader.jsp"></jsp:include>
                <!-- Section: intro -->
                <section id="intro" class="intro" style="margin-top: -110px;">
                    <div class="intro-content">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="wow fadeInUp" data-wow-duration="2s" data-wow-delay="0.2s">
                                        <img src="images/img-1.png" class="img img-responsive" alt="" />
                                    </div><br>
                                </div>
                                <div class="col-lg-6">

                                    <div class="panel-body" style="">
                                        <center><h3>Doctor Update Form</h3></center><hr>
                                        <form action="EditDProcess.jsp" method="post" role="form" name="form" id="form" class="contactForm lead">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                    <div class="form-group">
                                                        <label>Doctor ID</label>
                                                        <input type="text"  readonly="" name="did" id="first_name" class="form-control input-md"   title="Docor ID" value="<%=did%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Doctor Name</label>
                                                    <input type="text" required="" name="name" id="last_name" class="form-control input-md" value="<%=dname%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <input type="password" name="pass" id="password" title="Password should contain at least 1 Uppercase ,1 Lowercase and digit and minimum of 6 character." required="" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"  class="form-control input-md" value="<%=pass%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Retype Password</label>
                                                    <input type="password" name="cpass" id="confirm_password" required="" title="Password should contain at least 1 Uppercase ,1 Lowercase and digit and minimum of 6 character." pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"  class="form-control input-md" value="<%=pass%>"/>
                                                    <span style="font-size: 12px;" id='message'></span>
                                                </div>

                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Doctor Gender</label>
                                                    <select name="gender" required="" class="form-control">
                                                        <option selected="" value="<%=gender%>"><%=gender%></option>
                                                        <option value="Male">Male</option>
                                                        <option value="Female">Female</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Doctor DOB</label>
                                                    <input type="text" value="<%=dob%>" placeholder="Select DOB" name="dob" id="dob" onchange="calculateAge();" required="" class="datepicker form-control input-md">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Doctor Age</label>
                                                    <input type="text" readonly="" value="<%=age%>" name="age" id="age" class="form-control input-md" required="">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Select Department</label>
                                                    <select name="department" id="department" required="" class="form-control">
                                                        <option selected="" value="<%=dept%>"><%=dept%></option>
                                                        <%
                                                            try {
                                                                String query = "select * from dept";
                                                                Connection con = DB.getConnection();
                                                                Statement st = con.createStatement();
                                                                ResultSet rs = st.executeQuery(query);
                                                                while (rs.next()) {
                                                        %>
                                                        <option value="<%=rs.getString("deptName")%>"><%=rs.getString("deptName")%></option>
                                                        <%
                                                                }

                                                            } catch (Exception e) {
                                                                out.println(e);
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                            </div>        
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6" style="">
                                                <div class="form-group">
                                                    <label>Department ID</label>
                                                    <input type="text" readonly="" value="<%=deptid%>" name="deptId" id="deptId" class="form-control input-md" required="">
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6" style="">
                                                <div class="form-group">
                                                    <label>Doctor Fee</label>
                                                    <input type="text" readonly="" value="<%=fees%>" name="fee" id="fee" class="form-control input-md" required=""> 
                                                </div>
                                            </div>        
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Select Degree</label>
                                                    <select name="degree" class="form-control">
                                                        <option selected="" value="<%=degree%>"><%=degree%></option>
                                                        <option>M.B.B.S</option>
                                                        <option>B.D.S</option>
                                                        <option>B.P.T</option>
                                                        <option>B.Sc Nursing</option>
                                                        <option>B.H.M.S</option>
                                                        <option>B.A.M.S</option>
                                                        <option>RADIOGRAPHY</option>
                                                        <option>D.D.S</option>
                                                        <option>M.D</option>
                                                    </select>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Fee</label>
                                                    <input type="text" required="" name="fees" id="last_name" class="form-control input-md" value="<%=fees%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Contact No.</label>
                                                    <input type="text" name="phone" required="" id="phone" class="form-control input-md" title="Enter Contact No." value="<%=contact%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="text" required="" name="email" id="txtEmail" class="form-control input-md" value="<%=email%>">
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <textarea title="Enter your Address" class="form-control" required rows="3" cols="20" name="address"><%=address%></textarea>
                                                    <div class="validation"></div>
                                                </div>
                                            </div>
                                            <input type="submit" id="btnValidate" value="Update" class="btn btn-skin btn-block btn-lg">
                                        </div>
                                    </form>
                                </div>

                                <%
                                    } catch (Exception e) {
                                        out.println(e);
                                    }
                                %>

                            </div>

                        </div>
                    </div>
                </div>

            </section>
        </div>

        <%
            } else {
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $("#department").on("change", function () {
            var department = $("#department").val();//id of country select box of index.jsp page;
                $.ajax({
                    url: "DeptAndFee.jsp",//your jsp page name
                    data: {department: department},//sending request to state.jsp page.
                    method: "POST",//HTTP method.
                    success: function (data)
                    {
                        //alert($.trim(data));
                        var data=$.trim(data);
                        //alert(data);
                        var myarray = data.split(',');
                        $("#deptId").val(myarray[0]);
                        $("#fee").val(myarray[1]);
                    }
                });
        });
    });
</script>
<script>
                                                        $(document).ready(function() {
                                                            $("#form").submit(function(e) {
                                                                var pass = $('#password').val();
                                                                var cpass = $('#confirm_password').val();
                                                                if (pass === cpass)
                                                                {
                                                                    var phone = $('#phone').val().length;
                                                                    if (phone !== 10) {
                                                                        alert("Phone number should be 10 digit only.");
                                                                        e.preventDefault();
                                                                        return false;
                                                                    }
                                                                    else
                                                                    {
                                                                    }
                                                                }
                                                                else
                                                                {
                                                                    alert("Password does not match");
                                                                    e.preventDefault();
                                                                    return false;
                                                                }
                                                            });
                                                        });
</script>
<script>
    function calculateAge() {
        var today = new Date();
        var dateString = document.getElementById('dob').value;
        //alert(dateString);
        var birthDate = new Date(dateString);
        var age = today.getFullYear() - birthDate.getFullYear();
        var m = today.getMonth() - birthDate.getMonth();
        if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
            age--;
        }
        document.getElementById('age').value = age;
    }
</script>
<script>
    $(document).ready(function(e) {
        $('#btnValidate').click(function() {
            var sEmail = $('#txtEmail').val();
            if ($.trim(sEmail).length === 0) {
                alert('Please enter valid email address');
                e.preventDefault();
            }
            if (validateEmail(sEmail)) {
                //alert('Email is valid');
            }
            else {
                alert('Invalid Email Address');
                e.preventDefault();
            }
        });
    });

    function validateEmail(sEmail) {
        var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        if (filter.test(sEmail)) {
            return true;
        }
        else {
            return false;
        }
    }
</script>
<script>
    $('#password, #confirm_password').on('keyup', function() {
        if ($('#password').val() === $('#confirm_password').val()) {
            $('#message').html('Matching').css('color', 'green');
        } else
            $('#message').html('Not Matching').css('color', 'red');
    });
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>
<script>
    $(function() {
        $('.datepicker').datepicker({
            format: 'yyyy-mm-dd',
            endDate: '+0d',
            autoclose: true
        });
    });
</script>