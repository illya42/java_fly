
	<%@ include file="header.jsp" %>
		<div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
		<h2>Gestion des Reservations</h2>
		
		<%!
		Groupe unGroupe = new Groupe();
		
		Trajet unTrajet = new Trajet();
		%>
		
		<form method="post" action="">
		<table>
				<!-- <tr><td>ID Groupe : </td><td><input type="number" name="groupe_id"></td></tr> -->
				
				<tr>
					<td><label for="groupe-select">ID Groupe :</label></td>
						<td>
							<select style='margin : 10px' name="groupe_id" id="groupe-select">
								<option value="" disabled selected hidden>Choisir un groupe</option>
									<%
									ArrayList<Groupe> lesGroupes = Controller.selectAllGroupes();
									
									for (Groupe unGroupe : lesGroupes)
									{
										out.print("<option value=" + unGroupe.getId() + ">" + unGroupe.getId() + " -- " + unGroupe.getDestination() + "</option>");
									}
									%>
							</select>
						</td>
				</tr>
				<tr><td>Tarif : </td><td><input style='margin : 10px' type="text" name="tarif" placeholder="Rentrez un tarif"></td></tr>
				<!--  <tr><td>ID Trajet : </td><td><input type="number" name="trajet_id"></td></tr> -->
				
				<tr>
					<td><label for="trajet-select">ID Trajet :</label></td>
						<td>
							<select style='margin : 10px' name="trajet_id" id="trajet-select">
								<option value="" disabled selected hidden>Choisir un trajet</option>
									<%
									ArrayList<Trajet> lesTrajets = Controller.selectAllTrajets();
									
									for (Trajet unTrajet : lesTrajets)
									{
										out.print("<option value=" + unTrajet.getId() + ">" + unTrajet.getId() + " -- " + unTrajet.getDestination() + "</option>");
									}
									%>
							</select>
						</td>
				</tr>
				<tr>
					<td><label for="statut-select">Statut :</label></td>
						<td>
							<select style='margin : 10px' name="statut" id="statut-select">
								<option value="en cours" selected hidden>Choisir un statut</option>
								<option value="en cours">En cours</option>
								<option value="valide">Validé</option>
							</select>
						</td>
				</tr>
				<tr><td><input type="submit" style="margin:10px;" id="bouton1" name="enregistrer" value="Enregistrer"></td>
				<td><input type="submit" style="margin:10px;" name="retour" value="Retour"></td></tr>
		</table>
		</form>
		<br/>
		<br/></div></div></div>
		<%!
		//partie déclaration
		Reservation uneReservation = new Reservation();
		%>
		<div class="white-box">
        <h3 class="box-title">Table des réservations</h3>
		<%
		//partie éxecution
		
		ArrayList<Reservation> lesReservations = Controller.selectAllReservations();

		out.print("<div class='table-responsive'><table class='table'><thead><tr><th>ID</th><th>Groupe ID</th><th>Tarif</th><th>Trajet ID</th><th>Statut</th></tr></thead><tbody>");
		for (Reservation uneReservation : lesReservations)
        {
            out.print("<tr><td>" + uneReservation.getId() 
            + "</td><td>" + uneReservation.getGroupe_id()
            + "</td><td>" + uneReservation.getTarif() 
            + "</td><td>" + uneReservation.getTrajet_id()
            + "</td><td>" + uneReservation.getStatut()
            + "</td><td><a href='reservation.jsp?edit=E&id=" + uneReservation.getId() + "'> EDITER </a></td>"
        	+ "</td><td><a href='reservation.jsp?supp=X&id=" + uneReservation.getId() + "'> SUPPRIMER </a></td></tr>");
        }
		out.print("</table>");
		
		if ( request.getParameter("id") != null && request.getParameter("edit") != null )
		{
			int id = Integer.parseInt(request.getParameter("id"));
			
			//response.sendRedirect("update.jsp");
			
			uneSession.setAttribute("id_r", id);
			response.sendRedirect("reservation_edit.jsp");
		}
		
		if ( request.getParameter("id") != null && request.getParameter("supp") != null )
		{
			int id = Integer.parseInt(request.getParameter("id"));
			
			Controller.deleteReservation(id);
			response.sendRedirect("reservation.jsp");
		}
		
		if ( request.getParameter("enregistrer") != null )
		{
			int groupe_id = Integer.parseInt(request.getParameter("groupe_id"));
			String tarif = request.getParameter("tarif");
			int trajet_id = Integer.parseInt(request.getParameter("trajet_id"));
			String statut = request.getParameter("statut");
			
			uneReservation = new Reservation( groupe_id, tarif, trajet_id, statut );
			
			//insertion
			
			Controller.insertReservation(uneReservation);
			
			out.print("Insertion dans la bdd réussie");
			out.print( "<br/> Nouveau Trajet : " );
			out.print( "" + uneReservation.consulter() );
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