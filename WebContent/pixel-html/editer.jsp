
<%@ include file="header.jsp" %>
		<h1>Edition</h1>
		<br/>
		<br/>
		<%!
		//partie déclaration
		Trajet unTrajet = new Trajet();
		%>
		
		<%
		//partie éxecution
		
		int id = (Integer) uneSession.getAttribute("id");
		
		unTrajet = Controller.returnTrajet(id);

		out.print("<form method='post' action='' id='form'>");
		out.print("<table>");
		out.print("<tr><td>Heure de départ : </td><td><input type='text' name='heure_dep' style='margin:10px;' value=" + unTrajet.getHeure_dep() + "></td></tr>");
		out.print("<tr><td>Heure d'arrivée : </td><td><input type='text' name='heure_arr' style='margin:10px;' value=" + unTrajet.getHeure_arr() + "></td></tr>");
		out.print("<tr><td>Aéroport : </td><td><input type='text' name='aeroport' style='margin:10px;' value=" + unTrajet.getAeroport() + "></td></tr>");
		out.print("<tr><td>Date : </td><td><input type='text' name='date' style='margin:10px;' value=" + unTrajet.getDate() + "></td></tr>");
		out.print("<tr><td>Destination : </td><td><input type='text' name='destination' style='margin:10px;' value=" + unTrajet.getDestination() + "></td></tr>");
		out.print("<tr><td>Image : </td><td><input type='text' name='image' style='margin:10px;' value=" + unTrajet.getImage() + "></td></tr>");
		out.print("<tr><td>Prix : </td><td><input type='number' min='30' max='3000' name='prix' style='margin:10px;' value=" + unTrajet.getPrix() + "></td></tr>");
		out.print("<tr><td><input type='submit' name='modifier' style='margin:10px;' value='modifier'></td>");
		out.print("<td><input type='reset' name='rétablir' value='rétablir' onclick='reset();'></td></tr>");
		out.print("<tr><td><input type='submit' name='retour' style='margin:10px;' value='retour'></td></tr>");
		out.print("</table>");
		out.print("</form>");
		
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
		
	<%@ include file="footer.jsp" %>
</body>
</html>