<%@ page import="controller.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<%!
		//partie déclaration
		Administrateur unAdministrateur = new Administrateur();
		%>
		
		<%
		//partie éxecution
		
		HttpSession uneSession = request.getSession();
		
		out.print("<div id='connected'><h3>Bienvenue " + uneSession.getAttribute("nom") + " " + uneSession.getAttribute("prenom") + "</div>");
				
		String redirect = "trajet/trajet.jsp";
		out.print("<h2><a href=" + redirect + ">Menu des Trajets</a></h2>");
		%>
</body>
</html>