
<%@ include file="header.jsp" %>
		<div class="row">
                    <div class="col-sm-12">
                        <div class="white-box" style="display: inline-block; width: 430px; vertical-align: top; text-align: center; max-width: 100%;height: 325px;">
		<h2>Edition des Reservations</h2>
		<%!
		//partie déclaration
		Reservation uneReservation = new Reservation();
		
		Groupe unGroupe = new Groupe();
		
		Trajet unTrajet = new Trajet();
		
		Administrateur unAdministrateur = new Administrateur();
		%>
		
		<%
		//partie éxecution
		
		int id = (Integer) uneSession.getAttribute("id_r");
		
		uneReservation = Controller.returnReservation(id);

		out.print("<form method='post' style='font-size:14px;margin-left: 50px;' action='' id='form'>");
		out.print("<table>");
		
		ArrayList<Groupe> lesGroupes = Controller.selectAllGroupes();
		
		out.print("<tr>");
			out.print("<td><label style='margin-bottom: 0px;' for='groupe-select'>ID Groupe :</label></td>");
				out.print("<td>");
					out.print("<select style='margin : 10px;width: 171px;' name='groupe_id' id='groupe-select'>");
						out.print("<option value=" + uneReservation.getGroupe_id() + " selected hidden> " + uneReservation.getGroupe_id() + " </option>");
						for (Groupe unGroupe : lesGroupes)
						{
							out.print("<option value=" + unGroupe.getId() + ">" + unGroupe.getId() + " -- " + unGroupe.getDestination() + " -- " + unGroupe.getDate() + "</option>");
						}
					out.print("</select>");
				out.print("</td>");
		out.print("</tr>");
		
		out.print("<tr><td style='font-weight: 500;'>Tarif : </td><td><input type='number' style='margin : 10px; width: 171px;height: 23px;' name='tarif' value = " + uneReservation.getTarif() + "></td></tr>");
		
		ArrayList<Trajet> lesTrajets = Controller.selectAllTrajets();
		
		out.print("<tr>");
			out.print("<td><label style='margin-bottom: 0px;' for='trajet-select'>ID Trajet :</label></td>");
				out.print("<td>");
					out.print("<select style='margin : 10px;width: 171px;' name='trajet_id' id='trajet-select'>");
						out.print("<option value=" + uneReservation.getTrajet_id() + " selected hidden> " + uneReservation.getTrajet_id() + " </option>");
						for (Trajet unTrajet : lesTrajets)
						{
							out.print("<option value=" + unTrajet.getId() + ">" + unTrajet.getId() + " -- " + unTrajet.getDestination() + " -- " + unTrajet.getDate() + "</option>");
						}
					out.print("</select>");
				out.print("</td>");
		out.print("</tr>");
		
		out.print("<tr>");
			out.print("<td><label style='margin-bottom: 0px;' for='statut-select'>Statut :</label></td>");
				out.print("<td>");
					out.print("<select style='margin : 10px;width: 171px;' name='statut' id='statut-select'>");
						out.print("<option value='" + uneReservation.getStatut() + "' selected hidden> " + uneReservation.getStatut() + " </option>");
						out.print("<option value='en cours'>En cours</option>");
						out.print("<option value='valide'>Validé</option>");
					out.print("</select>");
				out.print("</td>");
		out.print("</tr>");
		out.print("<tr><td><input type='submit' name='modifier' style='margin:10px;' value='Modifier'></td>");
		out.print("<td><input type='reset' name='rétablir' value='Annuler' onclick='reset();'></td></tr>");
		out.print("</table>");
		out.print("</form>");
		
		if ( request.getParameter("modifier") != null )
		{
			int groupe_id = Integer.parseInt(request.getParameter("groupe_id"));
			String tarif = request.getParameter("tarif");
			int trajet_id = Integer.parseInt(request.getParameter("trajet_id"));
			String statut = request.getParameter("statut");
			
			uneReservation = new Reservation( id, groupe_id, tarif, trajet_id, statut );
			
			Controller.updateReservation(uneReservation);
			
			out.print("Modification réussie");
			out.print( "<br/> Réservation modifié : " );
			out.print( "" + uneReservation.consulter() );
			response.sendRedirect("reservation.jsp");
		}
		if ( request.getParameter("retour") != null )
		{
			response.sendRedirect("reservation.jsp");
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