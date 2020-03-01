
<%@ include file="header.jsp" %>
		<div class="row">
                    <div class="col-sm-12">
                        <div class="white-box" style="display: inline-block; width: 450px; vertical-align: top; text-align: center; max-width: 100%;height: 300px;">
		<h2>Edition des Groupes</h2>
		<%!
		//partie déclaration
		Groupe unGroupe = new Groupe();
		
		Trajet unTrajet = new Trajet();
		
		Trajet leTrajet = new Trajet();
		
		Administrateur unAdministrateur = new Administrateur();
		%>
		
		
		<%
		//partie éxecution
		
		int id = (Integer) uneSession.getAttribute("id_g");
		
		unGroupe = Controller.returnGroupe(id);

		out.print("<form method='post' style='font-size:14px;margin-left: 40px;' action='' id='form'>");
		out.print("<table>");
		
		ArrayList<Administrateur> lesAdministrateurs = Controller.selectAllAdministrateur();
		
		out.print("<tr>");
			out.print("<td><label for='admin-select'>ID Admin :</label></td>");
				out.print("<td>");
					out.print("<select style='margin : 10px;width: 171px;' name='admin_id' id='admin-select'>");
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
			out.print("<td><label for='trajet-select'>Trajet :</label></td>");
				out.print("<td>");
					out.print("<select style='margin : 10px;width: 171px;' name='id_trajet' id='trajet-select'>");
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
					out.print("<select style='margin : 10px;width: 171px;' name='statut' id='statut-select'>");
						out.print("<option value='" + unGroupe.getStatut() + "' selected hidden> " + unGroupe.getStatut() + " </option>");
						out.print("<option value='en cours'>En cours</option>");
						out.print("<option value='valide'>Validé</option>");
					out.print("</select>");
				out.print("</td>");
		out.print("</tr>");
	
		out.print("<tr><td><input type='submit' name='modifier' style='margin:10px;' value='Modifier'></td>");
		out.print("<td><input type='reset' name='annuler' value='Annuler' onclick='reset();'></td></tr>");
		out.print("</table>");
		out.print("</form>");
		
		if ( request.getParameter("modifier") != null )
		{
			int id_t = Integer.parseInt(request.getParameter("id_trajet"));
			
			leTrajet = Controller.returnTrajet(id_t);
			
			int admin_id = Integer.parseInt(request.getParameter("admin_id"));
			int id_trajet = Integer.parseInt(request.getParameter("id_trajet"));
			
			String destination = leTrajet.getDestination();
			String date = leTrajet.getDate();

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
		</div></div></div>
		<script type="text/javascript">
		function reset()
		{
			document.getElementById('form').reset();
		}
		</script>
		
	<%@ include file="footer.jsp" %>
</body>
</html>