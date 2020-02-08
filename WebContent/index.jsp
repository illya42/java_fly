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
	<%@ include file="entete.jsp" %>
		<h1>Gestion des Trajets</h1>
		<form method="post" action="">
		Prix : <input type="text" name="prix"><br/>
		Heure de d�part : <input type="text" name="heure_dep"><br/>
		Heure d'arriv�e : <input type="number" name="heure_arr"><br/>
		A�roport de d�part : <input type="number" name="aeroport"><br/>
		Date : <input type="number" name="date"><br/>
		Destination : <input type="number" name="destination"><br/>
		Image : <input type="number" name="image"><br/>
		<input type="submit" name="enregistrer" value="enregistrer"><br/>
		</form>
		<br/>
		<br/>
		<%!
		//partie d�claration
		Trajet unTrajet;
		%>
		
		<%
		//partie �xecution
		ArrayList<Trajet> lesTrajets = Controller.selectAllTrajets();
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
        	+ "</td><td><a href='index.jsp?numero='" + unTrajet.getId() + "> X </a></td></tr>");
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