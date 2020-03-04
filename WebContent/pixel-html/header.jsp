<%@ page import="controller.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="../plugins/images/favicon.png">
    <title>Fly</title>
    <!-- Bootstrap Core CSS -->
    <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="../plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!-- toast CSS -->
    <link href="../plugins/bower_components/toast-master/css/jquery.toast.css" rel="stylesheet">
    <!-- morris CSS -->
    <link href="../plugins/bower_components/morrisjs/morris.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="css/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="css/colors/blue-dark.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>

    <!-- Preloader -->
    <div class="preloader">
        <div class="cssload-speeding-wheel"></div>
    </div>
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top m-b-0">
            <div class="navbar-header"> <a class="navbar-toggle hidden-sm hidden-md hidden-lg " href="javascript:void(0)" data-toggle="collapse" data-target=".navbar-collapse"><i class="fa fa-bars"></i></a>
                <div class="top-left-part"><a class="logo" href="menu.jsp"><b><img src="../plugins/images/flylogo.png" alt="home" style="width: 40px;margin-bottom: 3px;"/></b><span class="hidden-xs">
                <img src="../plugins/images/textfly.png" alt="home" style="width: 110px;"/></span></a></div>
                
                <ul class="nav navbar-top-links navbar-right pull-right">
                    <li>
                        
                        <% 
                        HttpSession uneSession = request.getSession(false);
                        
                        if(uneSession.isNew())
                        { 
                        	uneSession = request.getSession();
                        }
                        else
                        {
                        	if (uneSession.getAttribute("identifiant") != null && uneSession.getAttribute("mdp") != null && uneSession.getAttribute("role") != null)
                			{
                				String identifiant = (String) uneSession.getAttribute("identifiant");
                				String mdp = (String) uneSession.getAttribute("mdp");
                				String role = (String) uneSession.getAttribute("role");
                				
                				out.print("<a class='profile-pic' href='deconnexion.jsp'><b class='hidden-xs'><i class='fa fa-sign-out fa-fw' aria-hidden='true'></i>"+ (String) uneSession.getAttribute("nom") + " " + (String) uneSession.getAttribute("prenom"));
                			}
                        }
                        %>
                        </b> </a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-header -->
            <!-- /.navbar-top-links -->
            <!-- /.navbar-static-side -->
        </nav>
        
        <%
        	if (uneSession.getAttribute("identifiant") != null && uneSession.getAttribute("mdp") != null && uneSession.getAttribute("role").equals("super"))
        	{
        		%>
        		<div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse slimscrollsidebar">
                <ul class="nav" id="side-menu">
                    <li style="padding: 10px 0 0;">
                        <a href="menu.jsp" class="waves-effect"><i class="fa fa-home fa-fw" aria-hidden="true"></i><span class="hide-menu">Accueil</span></a>

                    </li>
                    <li style="padding: 10px 0 0;">
                        <a href="trajet.jsp" class="waves-effect"><i class="fa fa-plane fa-fw" aria-hidden="true"></i><span class="hide-menu">Trajets</span></a>
                    </li>
                    <li style="padding: 10px 0 0;">
                        <a href="groupe.jsp" class="waves-effect"><i class="fa fa-group fa-fw" aria-hidden="true"></i><span class="hide-menu">Groupes</span></a>
                    </li>
                    <li style="padding: 10px 0 0;">
                        <a href="reservation.jsp" class="waves-effect"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i><span class="hide-menu">Reservation</span></a>
                    </li>
                    <li style="padding: 10px 0 0;">
                        <a href="administrateur.jsp" class="waves-effect"><i class="fa fa-shield fa-fw" aria-hidden="true"></i><span class="hide-menu">Administrateur</span></a>
                    </li>
                </ul>
                
            </div>
        </div>
        <%
        	}
        	else if (uneSession.getAttribute("identifiant") != null && uneSession.getAttribute("mdp") != null)
        	{
        		%>
        		<div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse slimscrollsidebar">
                <ul class="nav" id="side-menu">
                    <li style="padding: 10px 0 0;">
                        <a href="index.jsp" class="waves-effect"><i class="fa fa-home fa-fw" aria-hidden="true"></i><span class="hide-menu">Accueil</span></a>
                    </li>
                    <li style="padding: 10px 0 0;">
                        <a href="trajet.jsp" class="waves-effect"><i class="fa fa-plane fa-fw" aria-hidden="true"></i><span class="hide-menu">Trajets</span></a>
                    </li>
                    <li style="padding: 10px 0 0;">
                        <a href="groupe.jsp" class="waves-effect"><i class="fa fa-group fa-fw" aria-hidden="true"></i><span class="hide-menu">Groupes</span></a>
                    </li>
                    <li style="padding: 10px 0 0;">
                        <a href="reservation.jsp" class="waves-effect"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i><span class="hide-menu">Reservation</span></a>
                    </li>
                </ul>
                
            </div>
        </div>
        <%
        	}
        	else
        	{
        %>
         <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse slimscrollsidebar">
                <ul class="nav" id="side-menu">
                    <li style="padding: 10px 0 0;">
                        <a href="index.jsp" class="waves-effect"><i class="fa fa-home fa-fw" aria-hidden="true"></i><span class="hide-menu">Accueil</span></a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- Left navbar-header -->
        <%} %>
        <!-- Left navbar-header end -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <a href='index.jsp'><h2 class="page-title">Gestion @Fly</h2></a> </div>
                    
                    <!-- /.col-lg-12 -->
                </div>
        <!-- contenu page -->