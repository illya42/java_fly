
	<%@ include file="header.jsp" %>
		
		
		
		<%!
		Groupe unGroupe = new Groupe();
		
		Trajet unTrajet = new Trajet();
		%>
		
		<div class="row">
                    <div class="col-sm-12">
                        <div class="white-box" style="display: inline-block;width: 450px;vertical-align: top;text-align: center;max-width: 100%;height: 330px;">
		<h2>Gestion des Reservations</h2>
		<form method="post" style="margin-left: 40px;" action="">
		<table>				
				<tr><td><label style="margin-bottom: 0px;" for="groupe-select">ID Groupe :</label></td>
						<td>
							<select style='margin : 10px;width: 171px;' name="groupe_id" id="groupe-select">
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
				<tr><td style="font-weight: 500;">Tarif : </td><td><input style='margin : 10px; width: 171px;height: 23px;' type="number" min="10" name="tarif" placeholder="Rentrez un tarif"></td></tr>
				<!--  <tr><td>ID Trajet : </td><td><input type="number" name="trajet_id"></td></tr> -->
				
				<tr>
					<td><label style="margin-bottom: 0px;" for="trajet-select">ID Trajet :</label></td>
						<td>
							<select style='margin : 10px;width: 171px;' name="trajet_id" id="trajet-select">
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
					<td><label style="margin-bottom: 0px;" for="statut-select">Statut :</label></td>
						<td>
							<select style='margin : 10px;width: 171px;' name="statut" id="statut-select">
								<option value="en cours" selected hidden>Choisir un statut</option>
								<option value="en cours">En cours</option>
								<option value="valide">Validé</option>
							</select>
						</td>
				</tr>
				<tr><td><input type="submit" style="margin:10px;" id="bouton1" name="enregistrer" value="Enregistrer"></td>
				<td><input type="reset" style="margin:10px;" name="annuler" value="Annuler"></td></tr>
		</table>
		</form>
		<br/>
		<br/></div></div></div>
		<%!
		//partie déclaration
		Reservation uneReservation = new Reservation();
		%>
		<div class="white-box">
                            <h3 class="box-title">Reservations</h3>
                            
        	<form method="post" style="margin-left:286px;text-align:center;" action="">
				<table>
                           <tr><td> Recherche : <input style="width:250px; " type="text" name="recherche"></td>
                           <td><input type="submit" style="margin:10px;"  name="rech" value="Rechercher"></td>
                           </tr>
       			</table>
			</form>
		<%
		//partie éxecution
		
		if ( request.getParameter("recherche") != null )
		{
			
			String mot = request.getParameter("recherche");
			
			ArrayList<Reservation> lesReservationsrech = Controller.selectWhereReservations(mot);

			out.print("<div class='table-responsive'><table class='table'><thead><tr><th>ID</th><th>Groupe ID</th><th>Tarif</th><th>Trajet ID</th><th>Statut</th></tr></thead><tbody>");
			for (Reservation uneReservation : lesReservationsrech)
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
		}
		else
		{
			
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
		}
		
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