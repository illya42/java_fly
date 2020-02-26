
	<%@ include file="header.jsp" %>
		<div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
		<h2>Gestion des Reservations</h2>
		<form method="post" action="">
		<table>
				<tr><td>ID Groupe : </td><td><input type="number" name="groupe_id"></td></tr>
				<tr><td>Tarif : </td><td><input type="text" name="tarif"></td></tr>
				<tr><td>ID Trajet : </td><td><input type="number" name="id_trajet"></td></tr>
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
                            <h3 class="box-title">Basic Table</h3>
		<%
		//partie éxecution
		
		ArrayList<Reservation> lesReservations = Controller.selectAllReservations();
		//parcourir les compte
		out.print("<div class='table-responsive'><table class='table'><thead><tr><th>ID</th><th>Admin ID</th><th>Destination</th><th>Date</th><th>ID Trajet</th></tr></thead><tbody>");
		for (Reservation uneReservation : lesReservations)
        {
            out.print("<tr><td>" + uneReservation.getId() 
            + "</td><td>" + uneReservation.getGroupe_id()
            + "</td><td>" + uneReservation.getTarif() 
            + "</td><td>" + uneReservation.getTrajet_id()
            
            + "</td><td><a href='reservation.jsp?edit=E&id=" + uneReservation.getId() + "'> EDITER </a></td>"
        	+ "</td><td><a href='reservation.jsp?supp=X&id=" + uneReservation.getId() + "'> SUPPRIMER </a></td></tr>");
        }
		out.print("</table>");
		
		if ( request.getParameter("id") != null && request.getParameter("edit") != null )
		{
			int id = Integer.parseInt(request.getParameter("id"));
			
			//response.sendRedirect("update.jsp");
			
			uneSession.setAttribute("id", id);
			response.sendRedirect("reservation_edit.jsp");
		}
		
		if ( request.getParameter("id") != null && request.getParameter("supp") != null )
		{
			int id = Integer.parseInt(request.getParameter("id"));
			
			Controller.deleteGroupe(id);
			response.sendRedirect("reservation.jsp");
		}
		
		if ( request.getParameter("enregistrer") != null )
		{
			int groupe_id = Integer.parseInt(request.getParameter("groupe_id"));
			String tarif = request.getParameter("tarif");
			int trajet_id = Integer.parseInt(request.getParameter("trajet_id"));
			
			uneReservation = new Reservation( groupe_id, tarif, trajet_id );
			
			//insertion
			
			Controller.insertReservation(uneReservation);
			
			out.print("Insertion dans la bdd réussie");
			out.print( "<br/> Nouveau Trajet : " );
			out.print( "" + uneReservation.consulter() );
		}
		if ( request.getParameter("retour") != null )
		{
			response.sendRedirect("index.jsp");
		}
		%>
		</div>
		</div>
		
	<%@ include file="footer.jsp" %>
</body>
</html>