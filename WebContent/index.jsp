<%@ page import="controller.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>R�seau @Fly</title>
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
		//partie d�claration
		Administrateur unAdministrateur;
		%>
		
		<%
		//partie �xecution
		ArrayList<Administrateur> lesAdministrateurs = Controller.selectAllAdministrateurs();
		//parcourir les compte
		out.print("<table border =1> <tr><td>ID</td><td>Prix</td><td>Heure d�part</td><td>Heure arriv�e</td><td>A�roport</td><td>Date</td><td>Destination</td><td>Image</td><td>Supprimer</td></tr>");
		for (Trajet unTrajet : lesTrajets)
        {
            out.print("<tr><td>" + unTrajet.getId() 
            + "</td><td>" + unTrajet.getPrix() 
            + "</td><td>" + unTrajet.getHeure_dep() 
            + "</td><td>" + unTrajet.getHeure_arr() 
            + "</td><td>" + unTrajet.getAeroport() 
            + "</td><td>" + unTrajet.getDate() 
            + "</td><td>" + unTrajet.getDestination() 
            + "</td><td>" + unTrajet.getImage() 
        	+ "</td><td><a href='index.jsp?id='" + unTrajet.getId() + "> X </a></td></tr>");
        }
		out.print("</table>");
		if ( request.getParameter("id") != null )
		{
			int id = Integer.parseInt(request.getParameter("id"));
			Controller.deleteTrajet(id);
		}
		if ( request.getParameter("enregistrer") != null )
		{
			int id = Integer.parseInt(request.getParameter("id"));
			int prix = Integer.parseInt(request.getParameter("prix"));
			
			String heure_dep = request.getParameter("heure_dep");
			String heure_arr = request.getParameter("heure_arr");
			String aeroport = request.getParameter("aeroport");
			String date = request.getParameter("date");
			String destination = request.getParameter("destination");
			String image = request.getParameter("image");
			
			unTrajet = new Trajet( id, prix, heure_dep, heure_arr, aeroport, date, destination, image );
			
			//insertion de ce compte dans la bdd
			Controller.insertTrajet(unTrajet);
			out.print("Insertion dans la bdd r�ussie");
			out.print( "<br/> Nouveau Trajet : " );
			out.print( "" + unTrajet.consulter() );
		}
		%>
	<%@ include file="footer.jsp" %>
</body>
</html>