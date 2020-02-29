
	<%@ include file="header.jsp" %>
	
	<div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
		<%!
		//partie déclaration
		Administrateur unAdministrateur = new Administrateur();
		%>
		
		<%
		//partie éxecution
		
		out.print("<div id='connected'><h3>Bienvenue " + uneSession.getAttribute("nom") + " " + uneSession.getAttribute("prenom") + "</div>");
				
		out.print("<h2><a href='trajet.jsp'>Menu des Trajets</a></h2>");
		out.print("<h2><a href='groupe.jsp'>Menu des Groupes</a></h2>");
		out.print("<h2><a href='reservation.jsp'>Menu des Réservations</a></h2>");
		
		String role = (String) uneSession.getAttribute("role");
		
		if( role.equals("super") )
		{
			out.print("<h2><a href='administrateur.jsp'>Menu des Administrateurs</a></h2>");
		}
		%>
</div></div></div>
		<%@ include file="footer.jsp" %>