
<%@ include file="header.jsp" %>
		<h1>Edition</h1>
		<br/>
		<br/>
		<%!
		//partie d�claration
		Groupe unGroupe = new Groupe();
		
		Trajet unTrajet = new Trajet();
		
		Administrateur unAdministrateur = new Administrateur();
		%>
		
		<%
		//partie �xecution
		
		int id = (Integer) uneSession.getAttribute("id_g");
		
		unGroupe = Controller.returnGroupe(id);

		out.print("<form method='post' action='' id='form'>");
		out.print("<table>");
		
		out.print("<tr><td>ID Groupe : </td><td><input type='number' name='id_g' style='margin:10px;' value=" + unGroupe.getId() + " disabled></td></tr>");
		
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
		
		out.print("<tr><td>Nombre de personnes : </td><td><input type='number' min='1' name='nb_personnes' style='margin:10px;' value=" + unGroupe.getNb_personnes() + "></td></tr>");
		
		ArrayList<Trajet> lesTrajets = Controller.selectAllTrajets();
		
		out.print("<tr>");
			out.print("<td><label for='trajet-select'>Trajet :</label></td>");
				out.print("<td>");
					out.print("<select style='margin : 10px' name='id_trajet' id='trajet-select'>");
						out.print("<option value=" + unGroupe.getId_trajet() + " selected hidden> " + unGroupe.getDestination() + " -- " + unGroupe.getDate() + " </option>");
						for (Trajet unTrajet : lesTrajets)
						{
							out.print("<option value=" + unTrajet.getId() + ">" + unTrajet.getDestination() +" -- " + unTrajet.getDate() + "</option>");
						}
					out.print("</select>");
				out.print("</td>");
		out.print("</tr>");
		
		out.print("<tr>");
			out.print("<td><label for='statut-select'>Statut :</label></td>");
				out.print("<td>");
					out.print("<select style='margin : 10px' name='statut' id='statut-select'>");
						out.print("<option value='" + unGroupe.getStatut() + "' selected hidden> " + unGroupe.getStatut() + " </option>");
						out.print("<option value='en cours'>En cours</option>");
						out.print("<option value='valide'>Valid�</option>");
					out.print("</select>");
				out.print("</td>");
		out.print("</tr>");
	
		out.print("<tr><td><input type='submit' name='modifier' style='margin:10px;' value='modifier'></td>");
		out.print("<td><input type='reset' name='r�tablir' value='r�tablir' onclick='reset();'></td></tr>");
		out.print("<tr><td><input type='submit' name='retour' style='margin:10px;' value='retour'></td></tr>");
		out.print("</table>");
		out.print("</form>");
		
		if ( request.getParameter("modifier") != null )
		{	
			int id_t = Integer.parseInt(request.getParameter("id_trajet"));
			
			int admin_id = Integer.parseInt(request.getParameter("admin_id"));
			int nb_personnes = Integer.parseInt(request.getParameter("nb_personnes"));
			int id_trajet = Integer.parseInt(request.getParameter("id_trajet"));

			String statut = request.getParameter("statut");
			
			unGroupe = new Groupe( id, admin_id, nb_personnes, id_trajet, statut );
			
			Controller.updateGroupe(unGroupe);
			
			response.sendRedirect("groupe_edit_safe.jsp");
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