
<%@ include file="header.jsp" %>
		<div class="row">
                    <div class="col-sm-12">

                        <div class="white-box" style="display: inline-block;width: 400px;vertical-align: top;text-align: center;max-width: 100%;height: 390px;">

		<a href="groupe_edit_safe.jsp"><h2>Edition des Administrateurs</h2></a>
		
		<%!
		//partie dÃ©claration
		Administrateur unAdministrateur = new Administrateur();
		%>
		
		<%
		//partie Ã©xecution
		
		int id = (Integer) uneSession.getAttribute("id_a");
		
		unAdministrateur = Controller.returnAdministrateur(id);

		out.print("<form method='post' style='font-size:14px;margin-left: 40px;' action='' id='form'>");
		out.print("<table>");
		out.print("<tr><td style='font-size: 14px;font-weight: 500;'>Nom : </td><td><input type='text' name='nom_admin' style='margin:10px;width: 159px;height: 26px;' value=" + unAdministrateur.getNom_admin() + "></td></tr>");
		out.print("<tr><td style='font-size: 14px;font-weight: 500;'>Prénom : </td><td><input type='text' name='prenom_admin' style='margin:10px;width: 159px;height: 26px;' value=" + unAdministrateur.getPrenom_admin() + "></td></tr>");
		out.print("<tr><td style='font-size: 14px;font-weight: 500;'>Identifiant : </td><td><input type='text' name='identifiant' style='margin:10px;width: 159px;height: 26px;' value=" + unAdministrateur.getIdentifiant() + "></td></tr>");
		out.print("<tr><td style='font-size: 14px;font-weight: 500;'>Mot de passe : </td><td><input type='text' name='mdp' style='margin:10px;width: 159px;height: 26px;' value=" + unAdministrateur.getMdp() + "></td></tr>");
		
		out.print("<tr>");
			out.print("<td><label style='margin-bottom: 0px;' for='role-select'>Rôle :</label></td>");
				out.print("<td>");
					out.print("<select style='margin:10px;width: 159px;height: 26px;' name='role' id='role-select'>");
						out.print("<option value='" + unAdministrateur.getRole() + "' selected hidden>" + unAdministrateur.getRole() + "</option>");
						out.print("<option value='groupe'>Administration des groupes -- groupe</option>");
						out.print("<option value='super'>Administration totale -- super</option>");
					out.print("</select>");
				out.print("</td>");
		out.print("</tr>");

		out.print("<tr><td><input type='submit' name='modifier' style='margin:10px;' value='Modifier'></td>");
		out.print("<td><input type='reset' name='retablir' value='Annuler' onclick='reset();'></td></tr>");
		out.print("</table>");

		out.print("<tr><td><input type='submit' style='margin-left: 90px;' name='retour' value='retour'></td></tr>");
		out.print("</form>");
		
		if ( request.getParameter("modifier") != null )
		{
			String nom_admin = request.getParameter("nom_admin");
			String prenom_admin = request.getParameter("prenom_admin");
			String identifiant = request.getParameter("identifiant");
			String mdp = request.getParameter("mdp");
			String role = request.getParameter("role");
			
			unAdministrateur = new Administrateur( id, nom_admin, prenom_admin, identifiant, mdp, role );
			
			//insertion de ce compte dans la bdd
			
			Controller.updateAdministrateur(unAdministrateur);

			%>
			</div></div></div>
			<div class="white-box">
			<%
			
			out.print("Modification réussie");
			out.print( "<br/> Admin modifié : " );
			out.print("<div class='table-responsive'><table class='table'><thead><tr><th>ID</th><th>Nom</th><th>PrÃ©nom</th><th>Identifiant</th><th>Mot de passe</th><th>RÃ´le</th></tr></thead><tbody>");
			
	            out.print("<tr><td>" + unAdministrateur.getId()
	            + "</td><td>" + unAdministrateur.getNom_admin()
	            + "</td><td>" + unAdministrateur.getPrenom_admin()
	            + "</td><td>" + unAdministrateur.getIdentifiant()
	            + "</td><td>" + unAdministrateur.getMdp()
	            + "</td><td>" + unAdministrateur.getRole());
	        }
			out.print("</table>");
		
		if ( request.getParameter("retour") != null )
		{
			response.sendRedirect("administrateur.jsp");
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