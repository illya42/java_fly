
<%@ include file="header.jsp" %>
		<div class="row">
                    <div class="col-sm-12">
                        <div class="white-box" style="display: inline-block; width: 450px; vertical-align: top; text-align: center; max-width: 100%;height: 475px;">
		<h2>Edition des Trajets</h2>
		<%!
		//partie déclaration
		Trajet unTrajet = new Trajet();
		%>
		
		<%
		//partie éxecution
		
		int id = (Integer) uneSession.getAttribute("id");
		
		unTrajet = Controller.returnTrajet(id);

		out.print("<form method='post' style='font-size:14px;margin-left: 40px;' action='' id='form'>");
		out.print("<table>");
		out.print("<tr><td style='font-weight: 500;'>Heure de départ : </td><td><input type='time' name='heure_dep' style='margin:10px;' value=" + unTrajet.getHeure_dep() + "></td></tr>");
		out.print("<tr><td style='font-weight: 500;'>Heure d'arrivée : </td><td><input type='time' name='heure_arr' style='margin:10px;' value=" + unTrajet.getHeure_arr() + "></td></tr>");
		out.print("<tr><td style='font-weight: 500;'>Aéroport : </td><td><input type='text' name='aeroport' style='margin:10px;' value=" + unTrajet.getAeroport() + "></td></tr>");
		out.print("<tr><td style='font-weight: 500;'>Date : </td><td><input type='date' name='date' style='margin:10px;' value=" + unTrajet.getDate() + "></td></tr>");
		out.print("<tr><td style='font-weight: 500;'>Destination : </td><td><input type='text' name='destination' style='margin:10px;' value=" + unTrajet.getDestination() + "></td></tr>");
		out.print("<tr><td style='font-weight: 500;'>Image : </td><td><input type='text' name='image' style='margin:10px;' value=" + unTrajet.getImage() + "></td></tr>");
		out.print("<tr><td style='font-weight: 500;'>Prix : </td><td><input type='number' min='30' max='3000' name='prix' style='margin:10px;' value=" + unTrajet.getPrix() + "></td></tr>");
		out.print("<tr><td><input type='submit' name='modifier' style='margin:10px;' value='Modifier'></td>");
		out.print("<td><input type='reset' name='rétablir' value='Annuler' onclick='reset();'></td></tr>");
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
			response.sendRedirect("trajet.jsp");
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
		</div></div></div>
	<%@ include file="footer.jsp" %>
</body>
</html>