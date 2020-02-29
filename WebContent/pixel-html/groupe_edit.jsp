
<%@ include file="header.jsp" %>
		<h1>Edition</h1><a href="groupe_edit_safe.jsp"><h2>Mode administrateur de groupe</h2></a>
		<br/>
		<br/>
		<%!
		//partie déclaration
		Groupe unGroupe = new Groupe();
		
		Trajet unTrajet = new Trajet();
		
		Administrateur unAdministrateur = new Administrateur();
		%>
		
		<%
		//partie éxecution
		
		int id = (Integer) uneSession.getAttribute("id_g");
		
		unGroupe = Controller.returnGroupe(id);

		out.print("<form method='post' action='' id='form'>");
		out.print("<table>");
		
		ArrayList<Administrateur> lesAdministrateurs = Controller.selectAllAdministrateur();
		
		out.print("<tr>");
			out.print("<td><label for='admin-select'>ID Admin :</label></td>");
				out.print("<td>");
					out.print("<select style='margin : 10px' name='admin_id' id='admin-select'>");
						out.print("<option value=" + unGroupe.getAdministrateur_id() + " selected hidden> " + unGroupe.getAdministrateur_id() + " </option>");
						for (Administrateur unAdministrateur : lesAdministrateurs)
						{
							out.print("<option value=" + unAdministrateur.getId() + ">" + unAdministrateur.getId() + " -- " + unAdministrateur.getNom_admin() + "</option>");
						}
					out.print("</select>");
				out.print("</td>");
		out.print("</tr>");

		ArrayList<Trajet> lesTrajets = Controller.selectAllTrajets();
		
		out.print("<tr>");
			out.print("<td><label for='trajet-select'>ID Trajet :</label></td>");
				out.print("<td>");
					out.print("<select style='margin : 10px' name='id_trajet' id='trajet-select'>");
						out.print("<option value=" + unGroupe.getId_trajet() + " selected hidden> " + unGroupe.getId_trajet() + " </option>");
						for (Trajet unTrajet : lesTrajets)
						{
							out.print("<option value=" + unTrajet.getId() + ">" + unTrajet.getId() + "</option>");
						}
					out.print("</select>");
				out.print("</td>");
		out.print("</tr>");
		
		out.print("<tr>");
			out.print("<td><label for='destination-select'>Destination :</label></td>");
				out.print("<td>");
					out.print("<select style='margin : 10px' name='destination' id='destination-select'>");
						out.print("<option value=" + unGroupe.getDestination() + " selected hidden> " + unGroupe.getDestination() + " </option>");
						for (Trajet unTrajet : lesTrajets)
						{
							out.print("<option value=" + unTrajet.getDestination() + ">" + unTrajet.getDestination() + " -- " + unTrajet.getDate() + "</option>");
						}
					out.print("</select>");
				out.print("</td>");
		out.print("</tr>");
		
		out.print("<tr>");
		out.print("<td><label for='date-select'>Date :</label></td>");
			out.print("<td>");
				out.print("<select style='margin : 10px' name='date' id='date-select'>");
					out.print("<option value=" + unGroupe.getDate() + " selected hidden> " + unGroupe.getDate() + " </option>");
					for (Trajet unTrajet : lesTrajets)
					{
						out.print("<option value=" + unTrajet.getDate() + ">" + unTrajet.getDate() + "</option>");
					}
				out.print("</select>");
			out.print("</td>");
		out.print("</tr>");
		
		out.print("<tr>");
			out.print("<td><label for='statut-select'>Statut :</label></td>");
				out.print("<td>");
					out.print("<select style='margin : 10px' name='statut' id='statut-select'>");
						out.print("<option value=" + unGroupe.getStatut() + " selected hidden>" + unGroupe.getStatut() + "</option>");
						out.print("<option value='en cours'>En cours</option>");
						out.print("<option value='valide'>Validé</option>");
					out.print("</select>");
				out.print("</td>");
		out.print("</tr>");
		out.print("<tr><td><input type='submit' name='modifier' style='margin:10px;' value='modifier'></td>");
		out.print("<td><input type='reset' name='rétablir' value='rétablir' onclick='reset();'></td></tr>");
		out.print("<tr><td><input type='submit' name='retour' style='margin:10px;' value='retour'></td></tr>");
		out.print("</table>");
		out.print("</form>");
		
		if ( request.getParameter("modifier") != null )
		{
			int admin_id = Integer.parseInt(request.getParameter("admin_id"));
			String destination = request.getParameter("destination");
			String date = request.getParameter("date");
			int id_trajet = Integer.parseInt(request.getParameter("id_trajet"));
			String statut = request.getParameter("statut");
			
			unGroupe = new Groupe( id, admin_id, destination, date, id_trajet, statut );
			
			Controller.updateGroupe(unGroupe);
			
			out.print("Modification réussie");
			out.print( "<br/> Groupe modifié : " );
			out.print( "" + unGroupe.consulter() );
		}
		if ( request.getParameter("retour") != null )
		{
			response.sendRedirect("groupe.jsp");
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