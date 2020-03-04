
<%@ include file="header.jsp" %>
		<div class="row">
                    <div class="col-sm-12">
                        <div class="white-box" style="display: inline-block; width: 450px; vertical-align: top; text-align: center; max-width: 100%;height: 300px;">
		<h2>Edition des Groupes</h2>
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

		out.print("<form method='post' style='font-size:14px;margin-left: 40px;' action='' id='form'>");
		out.print("<table>");
		
		out.print("<tr><td>ID Groupe : </td><td><input type='number' name='id_g' style='margin:10px;' value=" + unGroupe.getId() + " disabled></td></tr>");
		
		ArrayList<Administrateur> lesAdministrateurs = Controller.selectAllAdministrateur();
		
		out.print("<tr>");
			out.print("<td><label style='margin-bottom: 0px;' for='admin-select'>ID Admin :</label></td>");
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
		
		out.print("<tr><td>Nombre de personnes : </td><td><input type='number' min='1' name='nb_personnes' style='margin:10px;' value=" + unGroupe.getNb_personnes() + "></td></tr>");
		
		ArrayList<Trajet> lesTrajets = Controller.selectAllTrajets();
		
		out.print("<tr>");
			out.print("<td><label style='margin-bottom: 0px;' for='trajet-select'>Trajet :</label></td>");
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
			out.print("<td><label style='margin-bottom: 0px;' for='statut-select'>Statut :</label></td>");
				out.print("<td>");
					out.print("<select style='margin : 10px;width: 171px;' name='statut' id='statut-select'>");
						out.print("<option value='" + unGroupe.getStatut() + "' selected hidden> " + unGroupe.getStatut() + " </option>");
						out.print("<option value='en cours'>En cours</option>");
						out.print("<option value='valide'>Validé</option>");
					out.print("</select>");
				out.print("</td>");
		out.print("</tr>");
	
		out.print("<tr><td><input type='submit' name='modifier' style='margin:10px;' value='Modifier'></td>");
		out.print("<td><input type='reset' style='margin-left: 90px;' name='rétablir' value='Annuler' onclick='reset();'></td></tr>");
		out.print("</table>");
		out.print("<tr><td><input type='submit' name='retour' style='margin-right:90px;' value='Retour'></td></tr><br><br>");
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
	
			%>
			</div></div></div>
			<div class="white-box">
			<%
			out.print("Modification réussie");
			out.print( "<br/> Groupe modifié : <br/>" );

			
			//parcourir les compte
			out.print("<div style='font-family: Rubik,sans-serif;' class='table-responsive'><table class='table'><thead><tr><th>ID</th><th>Admin ID</th><th>Destination</th><th>Date</th><th>ID Trajet</th><th>Statut</th></tr></thead><tbody>");
			
	            out.print("<tr><td>" + unGroupe.getId() 
	            + "</td><td>" + unGroupe.getAdministrateur_id()
	            + "</td><td>" + unGroupe.getDestination() 
	            + "</td><td>" + unGroupe.getDate() 
	            + "</td><td>" + unGroupe.getId_trajet()
	            + "</td><td>" + unGroupe.getStatut());
	        
			out.print("</table>");
			}

		if ( request.getParameter("retour") != null )
		{
			response.sendRedirect("groupe.jsp");
		}
		%>
		</div>
		<script type="text/javascript">
		function reset()
		{
			document.getElementById('form').reset();
		}
		</script>
		
	<%@ include file="footer.jsp" %>
</body>
</html>