
<%@ include file="header.jsp" %>
		<h1>Edition</h1>
		<br/>
		<br/>
		<%!
		//partie déclaration
		Groupe unGroupe = new Groupe();
		%>
		
		<%
		//partie éxecution
		
		int id = (Integer) uneSession.getAttribute("id_g");
		
		unGroupe = Controller.returnGroupe(id);

		out.print("<form method='post' action='' id='form'>");
		out.print("<table>");
		out.print("<tr><td>Admin ID : </td><td><input type='number' name='admin_id' style='margin:10px;' value=" + unGroupe.getAdministrateur_id() + "></td></tr>");
		out.print("<tr><td>Destination : </td><td><input type='text' name='destination' style='margin:10px;' value=" + unGroupe.getDestination() + "></td></tr>");
		out.print("<tr><td>Date : </td><td><input type='date' name='date' style='margin:10px;' value=" + unGroupe.getDate() + "></td></tr>");
		out.print("<tr><td>ID Trajet : </td><td><input type='text' name='id_trajet' style='margin:10px;' value=" + unGroupe.getId_trajet() + "></td></tr>");
		out.print("<tr><td><input type='submit' name='modifier' style='margin:10px;' value='modifier'></td>");
		out.print("<td><input type='reset' name='rétablir' value='rétablir' onclick='reset();'></td></tr>");
		out.print("<tr><td><input type='submit' name='retour' style='margin:10px;' value='retour'></td></tr>");
		out.print("</table>");
		out.print("</form>");
		
		if ( request.getParameter("modifier") != null )
		{
			int admin_id = Integer.parseInt(request.getParameter("admin_id"));
			String destination = request.getParameter("destination");
			String date = request.getParameter("date");
			int id_trajet = Integer.parseInt(request.getParameter("id_trajet"));
			
			unGroupe = new Groupe( id, admin_id, destination, date, id_trajet );
			
			//insertion de ce compte dans la bdd
			
			Controller.updateGroupe(unGroupe);
			
			out.print("Modification réussie");
			out.print( "<br/> Trajet modifié : " );
			out.print( "" + unGroupe.consulter() );
		}
		if ( request.getParameter("retour") != null )
		{
			response.sendRedirect("groupe.jsp");
		}
		%>
		
		<script type="text/javascript">
		function reset()
		{
			document.getElementById('form').reset();
		}
		</script>
		
	<%@ include file="footer.jsp" %>
</body>
</html>