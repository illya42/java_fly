<%@ page import="controller.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Réseau @Fly</title>
</head>
<body>
	<%@ include file="entete.jsp" %>
		<h1>Accueil</h1>
		<h3>Identification</h3>
		<form method="post" action="">
		Identifiant : <input type="text" name="prix"><br/>
		Mot de passe : <input type="text" name="heure_dep"><br/>
		<input type="submit" name="valider" value="valider"><br/>
		</form>
		<br/>
		<br/>
		<%!
		//partie déclaration
		
		%>
		
		<%
		//partie éxecution
		
		%>
	<%@ include file="footer.jsp" %>
</body>
</html>