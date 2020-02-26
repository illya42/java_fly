<%@page import="java.rmi.UnexpectedException"%>
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
<%@ include file="../entete.jsp" %>
		<h1>Edition</h1>
		<br/>
		<br/>
		<%!
		//partie déclaration
		Trajet unTrajet = new Trajet();
		%>
		
		<%
		//partie éxecution
		HttpSession uneSession = request.getSession();
		
		int id = (Integer) uneSession.getAttribute("id");
		
		unTrajet = Controller.returnTrajet(id);

		out.print("<form method='post' action='' id='form'>");
		out.print("Heure de départ : <input type='text' name='heure_dep' value=" + unTrajet.getHeure_dep() + "></br>");
		out.print("Heure d'arrivée : <input type='text' name='heure_arr' value=" + unTrajet.getHeure_arr() + "></br>");
		out.print("Aéroport : <input type='text' name='aeroport' value=" + unTrajet.getAeroport() + "></br>");
		out.print("Date : <input type='text' name='date' value=" + unTrajet.getDate() + "></br>");
		out.print("Destination : <input type='text' name='destination' value=" + unTrajet.getDestination() + "></br>");
		out.print("Image : <input type='text' name='image' value=" + unTrajet.getImage() + "></br>");
		out.print("Prix : <input type='number' min='30' max='3000' name='prix' value=" + unTrajet.getPrix() + "></br>");
		out.print("<input type='submit' name='modifier' value='modifier'><br/>");
		out.print("<input type='reset' name='rétablir' value='rétablir' onclick='reset();'><br/>");
		out.print("<input type='submit' name='retour' value='retour'><br/>");
		
		if ( request.getParameter("modifier") != null )
		{
			String heure_dep = request.getParameter("heure_dep");
			String heure_arr = request.getParameter("heure_arr");
			String aeroport = request.getParameter("aeroport");
			String date = request.getParameter("date");
			String destination = request.getParameter("destination");
			String image = request.getParameter("image");
			int prix = Integer.parseInt(request.getParameter("prix"));
			
			unTrajet = new Trajet( id, heure_dep, heure_arr, aeroport, date, destination, image, prix );
			
			//insertion de ce compte dans la bdd
			
			Controller.updateTrajet(unTrajet);
			
			out.print("Modification réussie");
			out.print( "<br/> Trajet modifié : " );
			out.print( "" + unTrajet.consulter() );
		}
		if ( request.getParameter("retour") != null )
		{
			response.sendRedirect("trajet.jsp");
		}
		%>
		
		<script type="text/javascript">
		function reset()
		{
			document.getElementById('form').reset();
		}
		</script>
		
	<%@ include file="../footer.jsp" %>
</body>
</html>