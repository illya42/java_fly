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
		Identifiant : <input type="text" name="identifiant"><br/>
		Mot de passe : <input type="text" name="mdp"><br/>
		<input type="submit" name="valider" value="valider"><br/>
		<input type="reset" name="annuler" value="annuler"><br/>
		</form>
		<br/>
		<br/>
		<%!
		//partie déclaration
		Administrateur unAdministrateur = new Administrateur();
		%>
		
		<%
		//partie éxecution
		HttpSession uneSession = request.getSession();
		
		if( request.getParameter("valider") != null )
		{
			String identifiant = request.getParameter("identifiant");
			String mdp = request.getParameter("mdp");
			
			if( Controller.verifConnexion(identifiant, mdp) == true )
			{
				unAdministrateur = Controller.returnAdmin(identifiant, mdp);
				
				uneSession.setAttribute("nom", unAdministrateur.getNom_admin());
				uneSession.setAttribute("prenom", unAdministrateur.getPrenom_admin());
				
				String redirect = "trajet.jsp";
				
				out.print("<h3>Bienvenue " + uneSession.getAttribute("nom") + " " + uneSession.getAttribute("prenom"));
				
				out.print("<h2><a href=" + redirect + ">Menu des Trajets</a></h2>");
			}
		}
		%>
	<%@ include file="footer.jsp" %>
</body>
</html>