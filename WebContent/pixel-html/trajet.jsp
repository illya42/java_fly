
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

	<%@ include file="header.jsp" %>
		<div class="row">
                    <div class="col-sm-12">
                        <div class="white-box" style="display: inline-block; width: 480px; vertical-align: top; text-align: center; max-width: 100%;height: 480px;">
		<h2>Gestion des Trajets</h2>
		<form method="post" style="font-size:14px;margin-left: 40px;" action="">
		<table>
				<tr><td style="font-size: 14px;font-weight: 500;">Tarif : </td><td><input style="margin:10px;" type="number" min="30" name="prix" required placeholder="Rentrez un prix"></td></tr>
				<tr><td style="font-size: 14px;font-weight: 500;">Heure de depart : </td><td><input style="margin:10px;" type="time" name="heure_dep" required ></td></tr>
				<tr><td style="font-size: 14px;font-weight: 500;">Heure d'arrivee : </td><td><input style="margin:10px;" type="time" name="heure_arr" required ></td></tr>
				<tr><td style="font-size: 14px;font-weight: 500;">Date : </td><td><input type="date" style="margin:10px; margin:10px;width: 200px;height: 25px;" required name="date"></td></tr>
				<tr><td style="font-size: 14px;font-weight: 500;">Aeroport de depart : </td><td><input style="margin:10px;" type="text" name="aeroport" required placeholder="Rentrez un aeroport"></td></tr>
				<tr><td style="font-size: 14px;font-weight: 500;">Destination : </td><td><input style="margin:10px;" type="text" name="destination" required placeholder="Rentrez la destination"></td></tr>
				<tr><td style="font-size: 14px;font-weight: 500;">Image : </td><td><input style="margin:10px;" type="text" name="image" required placeholder="Rentrez le nom de l'image"></td></tr>
				<tr><td><input type="submit" style="margin:10px;" id="bouton1" onclick="verif()" name="enregistrer" value="Enregistrer"></td>
				<td><input type="reset" style="margin-left:50px" name="annuler" value="Annuler"></td></tr>
		</table>
		</form>
		<br/>
		<br/></div>
				
		</div>
		</div>
		<%!
		//partie déclaration
		Trajet unTrajet = new Trajet();
		%>
		<div class="white-box">
                            <h3 class="box-title">Trajets</h3>
                            
        	<form method="post" style="margin-left:286px;text-align:center;" action="">
				<table>
                           <tr><td> Recherche : <input style="width:250px; " type="text" name="recherche"></td>
                           <td><input type="submit" style="margin:10px;"  name="rech" value="Rechercher"></td>
                           </tr>
       			</table>
			</form>
		<%
	//	partie Execution
	
		if ( request.getParameter("recherche") != null )
		{
			
			String mot = request.getParameter("recherche");
			
			ArrayList<Trajet> lesTrajetsrech = Controller.selectWhereTrajets(mot);
			out.print("<div class='table-responsive'><table class='table'><thead><tr><th>ID</th><th>Heure depart</th><th>Heure arrivee</th><th>Date</th><th>Aeroport</th><th>Destination</th><th>Image</th><th>Prix</th></tr></thead><tbody>");
			for (Trajet unTrajet : lesTrajetsrech)
	        {
	            out.print("<tr><td>" + unTrajet.getId() 
	            + "</td><td>" + unTrajet.getHeure_dep() 
	            + "</td><td>" + unTrajet.getHeure_arr() 
	            + "</td><td>" + unTrajet.getDate() 
	            + "</td><td>" + unTrajet.getAeroport() 
	            + "</td><td>" + unTrajet.getDestination() 
	            + "</td><td>" + unTrajet.getImage() 
	            + "</td><td>" + unTrajet.getPrix() 
	            
	            + "</td><td><a href='trajet.jsp?edit=E&id=" + unTrajet.getId() + "'> EDITER </a></td>"
	        	+ "</td><td><a href='trajet.jsp?supp=X&id=" + unTrajet.getId() + "'> SUPPRIMER </a></td></tr>");
	        }
			out.print("</table>");
		}
		else
		{
		ArrayList<Trajet> lesTrajets = Controller.selectAllTrajets();
		//parcourir les compte
		out.print("<div class='table-responsive'><table class='table'><thead><tr><th>ID</th><th>Heure depart</th><th>Heure arrivee</th><th>Date</th><th>Aeroport</th><th>Destination</th><th>Image</th><th>Prix</th></tr></thead><tbody>");
		for (Trajet unTrajet : lesTrajets)
        {
            out.print("<tr><td>" + unTrajet.getId() 
            + "</td><td>" + unTrajet.getHeure_dep() 
            + "</td><td>" + unTrajet.getHeure_arr() 
            + "</td><td>" + unTrajet.getDate() 
            + "</td><td>" + unTrajet.getAeroport() 
            + "</td><td>" + unTrajet.getDestination() 
            + "</td><td>" + unTrajet.getImage() 
            + "</td><td>" + unTrajet.getPrix() 
            
            + "</td><td><a href='trajet.jsp?edit=E&id=" + unTrajet.getId() + "'> EDITER </a></td>"
        	+ "</td><td><a href='trajet.jsp?supp=X&id=" + unTrajet.getId() + "'> SUPPRIMER </a></td></tr>");
        }
		out.print("</table>");
		}
		
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
			response.sendRedirect("trajet.jsp");
		}
		if ( request.getParameter("retour") != null )
		{
			response.sendRedirect("menu.jsp");
		}
		%>
		</div>
		</div>
		
	<%@ include file="footer.jsp" %>
</body>
</html>