
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
									ArrayList<Groupe> lesGroupes = Controller.selectFree_groupes();
									
									for (Groupe unGroupe : lesGroupes)
									{
										out.print("<option value=" + unGroupe.getId() + ">" + unGroupe.getId() + " -- " + unGroupe.getDestination() + "</option>");
									}
									%>
							</select>
						</td>
				</tr>
				<%
				if ( request.getParameter("personnaliser") != null )
				{
					out.print("<tr><td>Tarif : </td><td><input style='margin : 10px' type='number' min='0' name='tarif' placeholder='Rentrez un tarif'></td></tr>");
					out.print("<tr><td>Tarif (Réduction) : </td><td><input style='margin : 10px' type='number' min='0' name='tarif_reduc' placeholder='Rentrez un tarif réduit'></td></tr>");
					out.print("<tr><td>Taux réduction : </td><td><input style='margin : 10px' type='number' min='0' name='taux_reduc' placeholder='Rentrez un taux de réduction'></td></tr>");
				}
				if ( request.getParameter("annuler") != null )
				{
					out.print("<tr><td>Taux réduction : </td><td><input style='margin : 10px' type='number' min='1' name='taux_reduc' placeholder='Rentrez un taux de réduction'></td></tr>");
				}
				if ( request.getParameter("personnaliser") == null && request.getParameter("annuler") == null )
				{
					out.print("<tr><td>Taux réduction : </td><td><input style='margin : 10px' type='number' name='taux_reduc' placeholder='Rentrez un taux de réduction'></td></tr>");
				}
				%>
				
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
				
				<%
				if ( request.getParameter("personnaliser") != null )
				{
					out.print("<tr><td><input type='submit' style='margin:10px' id='bouton1' name='enregistrer_perso' value='Enregistrer'></td>");
					out.print("<td><input type='submit' style='margin:10px;' name='annuler' value='Annuler la personnalisation'></td></tr>");
				}
				if ( request.getParameter("annuler") != null )
				{
					out.print("<tr><td><input type='submit' style='margin:10px' id='bouton1' name='enregistrer' value='Enregistrer'></td>");
					out.print("<td><input type='submit' style='margin:10px;' name='personnaliser' value='Personnaliser les tarifs'></td></tr>");
				}
				if ( request.getParameter("personnaliser") == null && request.getParameter("annuler") == null )
				{
					out.print("<tr><td><input type='submit' style='margin:10px' id='bouton1' name='enregistrer' value='Enregistrer'></td>");
					out.print("<td><input type='submit' style='margin:10px;' name='personnaliser' value='Personnaliser les tarifs'></td></tr>");
				}
				%>
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

		out.print("<div class='table-responsive'><table class='table'><thead><tr><th>ID</th><th>Groupe ID</th><th>Destination</th><th>Tarif</th><th>Tarif (Réduction)</th><th>Taux réduction</th><th>Statut</th></tr></thead><tbody>");
		for (Reservation uneReservation : lesReservations)
        {
            out.print("<tr><td>" + uneReservation.getId() 
            + "</td><td>" + uneReservation.getGroupe_id()
            + "</td><td>" + uneReservation.getDestination()
            + "</td><td>" + uneReservation.getTarif() 
            + "</td><td>" + uneReservation.getTarif_reduc() 
            + "</td><td>" + uneReservation.getTaux_reduc() 
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
		
		if ( request.getParameter("enregistrer_perso") != null )
		{
			int groupe_id = Integer.parseInt(request.getParameter("groupe_id"));
			float tarif = Float.parseFloat(request.getParameter("tarif"));
			float tarif_reduc = Float.parseFloat(request.getParameter("tarif_reduc"));
			float taux_reduc = Float.parseFloat(request.getParameter("taux_reduc"));
			String statut = request.getParameter("statut");
			
			uneReservation = new Reservation( groupe_id, tarif, tarif_reduc, taux_reduc, statut );
			
			//insertion
			
			Controller.insertReservation(uneReservation);
		}
		if ( request.getParameter("enregistrer") != null )
		{
			int groupe_id = Integer.parseInt(request.getParameter("groupe_id"));
			
			float tarif = Controller.selectNb_personnes(groupe_id) * Controller.selectTarif(groupe_id);

			float taux_reduc = Float.parseFloat(request.getParameter("taux_reduc"));
			
			float tarif_reduc = tarif -( tarif * taux_reduc / 100 );
			String statut = request.getParameter("statut");
			
			uneReservation = new Reservation( groupe_id, tarif, tarif_reduc, taux_reduc, statut );
			
			//insertion
			
			Controller.insertReservation(uneReservation);
		}
		%>
		</div>
		</div>
		
	<%@ include file="footer.jsp" %>
</body>
</html>