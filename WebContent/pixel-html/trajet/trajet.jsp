<%@page import="java.rmi.UnexpectedException"%>
<%@ page import="controller.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gestion des Trajets</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
		<h1>Gestion des Trajets</h1>
		<form method="post" action="">
			Prix : <input type="text" name="prix"><br/>
			Heure de départ : <input type="text" name="heure_dep"><br/>
			Heure d'arrivée : <input type="text" name="heure_arr"><br/>
			Aéroport de départ : <input type="text" name="aeroport"><br/>
			Date : <input type="date" name="date"><br/>
			Destination : <input type="text" name="destination"><br/>
			Image : <input type="text" name="image"><br/>
			<input type="submit" id="bouton1" name="enregistrer" value="enregistrer"><br/>
			<input type="submit" name="retour" value="retour"><br/>
		</form>
		<br/>
		<br/>
		<%!
		//partie déclaration
		Trajet unTrajet = new Trajet();
		%>
		
		<%
		//partie éxecution
		
		ArrayList<Trajet> lesTrajets = Controller.selectAllTrajets();
		//parcourir les compte
		out.print("<table border =1> <tr><td>ID</td><td>Prix</td><td>Heure départ</td><td>Heure arrivée</td><td>Aéroport</td><td>Date</td><td>Destination</td><td>Image</td><td>Editer</td><td>Supprimer</td></tr>");
		for (Trajet unTrajet : lesTrajets)
        {
            out.print("<tr><td>" + unTrajet.getId() 
            + "</td><td>" + unTrajet.getHeure_dep() 
            + "</td><td>" + unTrajet.getHeure_arr() 
            + "</td><td>" + unTrajet.getAeroport() 
            + "</td><td>" + unTrajet.getDate() 
            + "</td><td>" + unTrajet.getDestination() 
            + "</td><td>" + unTrajet.getImage() 
            + "</td><td>" + unTrajet.getPrix() 
            
            + "</td><td><a href='trajet.jsp?edit=E&id=" + unTrajet.getId() + "'> EDITER </a></td>"
        	+ "</td><td><a href='trajet.jsp?supp=X&id=" + unTrajet.getId() + "'> SUPPRIMER </a></td></tr>");
        }
		out.print("</table>");
		
		if ( request.getParameter("id") != null && request.getParameter("edit") != null )
		{
			int id = Integer.parseInt(request.getParameter("id"));
			
			//response.sendRedirect("update.jsp");
			
			uneSession.setAttribute("id", id);
			response.sendRedirect("editer.jsp");
		}
		
		if ( request.getParameter("id") != null && request.getParameter("supp") != null )
		{
			int id = Integer.parseInt(request.getParameter("id"));
			
			Controller.deleteTrajet(id);
			response.sendRedirect("trajet.jsp");
		}
		
		if ( request.getParameter("enregistrer") != null )
		{
			String heure_dep = request.getParameter("heure_dep");
			String heure_arr = request.getParameter("heure_arr");
			String aeroport = request.getParameter("aeroport");
			String date = request.getParameter("date");
			String destination = request.getParameter("destination");
			String image = request.getParameter("image");
			int prix = Integer.parseInt(request.getParameter("prix"));
			
			unTrajet = new Trajet( heure_dep, heure_arr, aeroport, date, destination, image, prix );
			
			//insertion de ce compte dans la bdd
			
			Controller.insertTrajet(unTrajet);
			
			out.print("Insertion dans la bdd réussie");
			out.print( "<br/> Nouveau Trajet : " );
			out.print( "" + unTrajet.consulter() );
		}
		if ( request.getParameter("retour") != null )
		{
			response.sendRedirect("../index.jsp");
		}
		%>
		
	<%@ include file="../footer.jsp" %>
</body>
</html>