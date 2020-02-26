
	<%@ include file="header.jsp" %>
		<h1>Gestion des Trajets</h1>
		<form method="post" action="">
		<table>
				<tr><td> Prix : </td><td><input type="text" name="prix" placeholder="Rentrez un prix"></td></tr>
				<tr><td>Heure de d�part : </td><td><input type="text" name="heure_dep"></td></tr>
				<tr><td>Heure d'arriv�e : </td><td><input type="text" name="heure_arr"></td></tr>
				<tr><td>A�roport de d�part : </td><td><input type="text" name="aeroport"></td></tr>
				<tr><td>Date : </td><td><input type="date" name="date"></td></tr>
				<tr><td>Destination : </td><td><input type="text" name="destination"></td></tr>
				<tr><td>Image : </td><td><input type="text" name="image"></td></tr>
				<tr><td><input type="submit" id="bouton1" name="enregistrer" value="enregistrer"></td>
				<td><input type="submit" name="retour" value="retour"></td></tr>
		</table>
		</form>
		<br/>
		<br/>
		<%!
		//partie d�claration
		Trajet unTrajet = new Trajet();
		%>
		
		<%
		//partie �xecution
		
		ArrayList<Trajet> lesTrajets = Controller.selectAllTrajets();
		//parcourir les compte
		out.print("<div class='table-responsive'><table class='table'><thead><tr><th>ID</th><th>Heure d�part</th><th>Heure arriv�e</th><th>A�roport</th><th>Date</th><th>Destination</th><th>Image</th><th>Prix</th></tr></thead><tbody>");
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
			
			out.print("Insertion dans la bdd r�ussie");
			out.print( "<br/> Nouveau Trajet : " );
			out.print( "" + unTrajet.consulter() );
		}
		if ( request.getParameter("retour") != null )
		{
			response.sendRedirect("index.jsp");
		}
		%>
		
	<%@ include file="footer.jsp" %>
</body>
</html>