
	<%@ include file="header.jsp" %>
		<div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
		<h2>Gestion des Administrateurs</h2>
		<form method="post" action="">
		<table>
				<tr><td>Nom : </td><td><input style="margin:10px;" type="text" min="10" name="nom" placeholder="Rentrez un nom"></td></tr>
				<tr><td>Prénom : </td><td><input style="margin:10px;" type="text" name="prenom" placeholder="Rentrez un prénom"></td></tr>
				<tr><td>Identifiant : </td><td><input style="margin:10px;" type="text" name="identifiant" placeholder="Rentrez un identifiant"></td></tr>
				<tr><td>Mot de passe : </td><td><input style="margin:10px;" type="text" name="mdp" placeholder="Rentrez un mot de passe"></td></tr>
				<tr>
					<td><label for="role-select">Rôle :</label></td>
						<td>
							<select style='margin : 10px' name="role" id="role-select">
								<option value="groupe" disabled selected hidden>Choisir un rôle</option>
								<option value="groupe">Groupe</option>
								<option value="super">Super</option>
							</select>
						</td>
				</tr>
				
				<tr><td><input type="submit" style="margin:10px;" id="bouton1" name="enregistrer" value="Enregistrer"></td>
				<td><input type="reset" style="margin:10px;" name="annuler" value="annuler"></td></tr>
				<tr><td><input type="submit" style="margin:10px;" name="retour" value="Retour"></td></tr>
		</table>
		</form>
		<br/>
		<br/></div></div></div>
		<%!
		//partie déclaration
		Administrateur unAdministrateur = new Administrateur();
		%>
		<div class="white-box">
       	<h3 class="box-title">Table des Admins</h3>
		<%
		//partie éxecution
		
		ArrayList<Administrateur> lesAdministrateurs = Controller.selectAllAdministrateur();
		//parcourir les compte
		out.print("<div class='table-responsive'><table class='table'><thead><tr><th>ID</th><th>Nom</th><th>Prénom</th><th>Identifiant</th><th>Mot de passe</th><th>Rôle</th></tr></thead><tbody>");
		for (Administrateur unAdministrateur : lesAdministrateurs)
        {
            out.print("<tr><td>" + unAdministrateur.getId()
            + "</td><td>" + unAdministrateur.getNom_admin()
            + "</td><td>" + unAdministrateur.getPrenom_admin()
            + "</td><td>" + unAdministrateur.getIdentifiant()
            + "</td><td>" + unAdministrateur.getMdp()
            + "</td><td>" + unAdministrateur.getRole()
            
            + "</td><td><a href='administrateur.jsp?edit=E&id=" + unAdministrateur.getId() + "'> EDITER </a></td>"
        	+ "</td><td><a href='administrateur.jsp?supp=X&id=" + unAdministrateur.getId() + "'> SUPPRIMER </a></td></tr>");
        }
		out.print("</table>");
		
		if ( request.getParameter("id") != null && request.getParameter("edit") != null )
		{
			int id = Integer.parseInt(request.getParameter("id"));
			
			//response.sendRedirect("update.jsp");
			
			uneSession.setAttribute("id_a", id);
			response.sendRedirect("administrateur_edit.jsp");
		}
		
		if ( request.getParameter("id") != null && request.getParameter("supp") != null )
		{
			int id = Integer.parseInt(request.getParameter("id"));
			
			Controller.deleteAdministrateur(id);
			response.sendRedirect("administrateur.jsp");
		}
		
		if ( request.getParameter("enregistrer") != null )
		{
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String identifiant = request.getParameter("identifiant");
			String mdp = request.getParameter("mdp");
			String role = request.getParameter("role");
			
			unAdministrateur = new Administrateur( nom, prenom, identifiant, mdp, role );
			
			//insertion de ce compte dans la bdd
			
			Controller.insertAdministrateur(unAdministrateur);
			
			out.print("Insertion dans la bdd réussie");
			out.print( "<br/> Nouveau Trajet : " );
			out.print( "" + unAdministrateur.consulter() );
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