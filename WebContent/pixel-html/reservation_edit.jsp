
<%@ include file="header.jsp" %>
		<div class="row">
                    <div class="col-sm-12">
                        <div class="white-box" style="display: inline-block; width: 430px; vertical-align: top; text-align: center; max-width: 100%;height: 400px;">
		<h2>Edition des Reservations</h2>
		<%!
		//partie dÃ©claration
		Reservation uneReservation = new Reservation();
		
		Groupe unGroupe = new Groupe();
		
		Trajet unTrajet = new Trajet();
		
		Administrateur unAdministrateur = new Administrateur();
		%>
		
		<%
		//partie Ã©xecution
		
		int id = (Integer) uneSession.getAttribute("id_r");
		
		uneReservation = Controller.returnReservation(id);

		out.print("<form method='post' style='font-size:14px;margin-left: 50px;' action='' id='form'>");
		out.print("<table>");
		
		ArrayList<Groupe> lesGroupes = Controller.selectFree_groupes();
		
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
	
		out.print("<tr><td style='font-size: 14px;font-weight: 500;'>Tarif : </td><td><input type='number' min='0' style='margin : 10px' name='tarif' value = " + uneReservation.getTarif() + "></td></tr>");
		out.print("<tr><td style='font-size: 14px;font-weight: 500;'>Tarif (Réduction) : </td><td><input type='number' min='0' style='margin : 10px' name='tarif_reduc' value = " + uneReservation.getTarif_reduc() + "></td></tr>");
		out.print("<tr><td style='font-size: 14px;font-weight: 500;'>Taux réduction : </td><td><input type='number' min='0' style='margin : 10px' name='taux_reduc' value = " + uneReservation.getTaux_reduc() + "></td></tr>");

		out.print("<tr>");
			out.print("<td><label style='margin-bottom: 0px;' for='statut-select'>Statut :</label></td>");
				out.print("<td>");
					out.print("<select style='margin : 10px;width: 171px;' name='statut' id='statut-select'>");
						out.print("<option value='" + uneReservation.getStatut() + "' selected hidden> " + uneReservation.getStatut() + " </option>");
						out.print("<option value='en cours'>En cours</option>");
						out.print("<option value='valide'>ValidÃ©</option>");
					out.print("</select>");
				out.print("</td>");
		out.print("</tr>");
		out.print("<tr><td><input type='submit' name='modifier' style='margin:10px;' value='Modifier'></td>");
		out.print("<td><input type='reset' style='margin-left: 90px;' name='rÃ©tablir' value='Annuler' onclick='reset();'></td></tr>");
		out.print("</table>");
		out.print("<tr><td><input type='submit' name='retour' style='margin-right:0px;' value='Retour'></td></tr><br><br>");
		out.print("</form>");
		
		if ( request.getParameter("modifier") != null )
		{
			int groupe_id = Integer.parseInt(request.getParameter("groupe_id"));
			float tarif = Float.parseFloat(request.getParameter("tarif"));
			float tarif_reduc = Float.parseFloat(request.getParameter("tarif_reduc"));
			float taux_reduc = Float.parseFloat(request.getParameter("taux_reduc"));
			String statut = request.getParameter("statut");
			
			uneReservation = new Reservation( id, groupe_id, tarif, tarif_reduc, taux_reduc, statut );
			
			Controller.updateReservation(uneReservation);

			%>
			</div></div></div>
			<div class="white-box">
			<%
			out.print("Modification rÃ©ussie");
			out.print( "<br/> RÃ©servation modifiÃ© : " );
			out.print("<div class='table-responsive'><table class='table'><thead><tr><th>ID</th><th>Groupe ID</th><th>Tarif</th><th>Tarif (Réduction)</th><th>Taux réduction</th><th>Statut</th></tr></thead><tbody>");
			
	            out.print("<tr><td>" + uneReservation.getId() 
	            + "</td><td>" + uneReservation.getGroupe_id()
	            + "</td><td>" + uneReservation.getTarif() 
	            + "</td><td>" + uneReservation.getTarif_reduc()
	            + "</td><td>" + uneReservation.getTaux_reduc()
	            + "</td><td>" + uneReservation.getStatut());
	            out.print("</table>");
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