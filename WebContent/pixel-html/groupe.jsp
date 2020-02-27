
	<%@ include file="header.jsp" %>
		<div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
		<h2>Gestion des Groupes</h2>
		</div></div></div>
		<%!
		//partie déclaration
		Groupe unGroupe = new Groupe();
		%>
		<div class="white-box">
        <h3 class="box-title">Table des groupes</h3>
		<%
		//partie éxecution
		
		ArrayList<Groupe> lesGroupes = Controller.selectAllGroupes();
		//parcourir les compte
		out.print("<div class='table-responsive'><table class='table'><thead><tr><th>ID</th><th>Admin ID</th><th>Destination</th><th>Date</th><th>ID Trajet</th></tr></thead><tbody>");
		for (Groupe unGroupe : lesGroupes)
        {
            out.print("<tr><td>" + unGroupe.getId() 
            + "</td><td>" + unGroupe.getAdministrateur_id()
            + "</td><td>" + unGroupe.getDestination() 
            + "</td><td>" + unGroupe.getDate() 
            + "</td><td>" + unGroupe.getId_trajet()
            
            + "</td><td><a href='groupe.jsp?edit=E&id=" + unGroupe.getId() + "'> EDITER </a></td>"
        	+ "</td><td><a href='groupe.jsp?supp=X&id=" + unGroupe.getId() + "'> SUPPRIMER </a></td></tr>");
        }
		out.print("</table>");
		
		if ( request.getParameter("id") != null && request.getParameter("edit") != null )
		{
			int id = Integer.parseInt(request.getParameter("id"));
			
			uneSession.setAttribute("id_g", id);
			response.sendRedirect("groupe_edit.jsp");
		}
		
		if ( request.getParameter("id") != null && request.getParameter("supp") != null )
		{
			int id = Integer.parseInt(request.getParameter("id"));
			
			Controller.deleteGroupe(id);
			response.sendRedirect("groupe.jsp");
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