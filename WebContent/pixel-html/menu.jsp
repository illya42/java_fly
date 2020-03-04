
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
		
		out.print("<div style='text-align:center;' id='connected'><h3>Bienvenue " + uneSession.getAttribute("nom") + " " + uneSession.getAttribute("prenom") + "</div>");
		%>
		<br><br>
		<table style="margin: auto;">
		<tr>
			<td><a href="trajet.jsp" class="waves-effect"><img src='../plugins/images/iconetraj.png'></a></td>
			<td><a href="reservation.jsp" class="waves-effect"><img style="padding-right: 40px;padding-left: 40px;" src='../plugins/images/iconereserv.png'></a></td>
			<td><a href="groupe.jsp" class="waves-effect"><img src='../plugins/images/iconegrp.png'></a></td>
		
		
		
		<%
		String role = (String) uneSession.getAttribute("role");
		
		if( role.equals("super") )
		{
			out.print("<td><a href='administrateur.jsp' class='waves-effect'><img style='padding-left: 40px;' src='../plugins/images/iconeadmin.png'></a></td></tr>");
		}
		%>
		</table>
		<br>
		<br>
</div></div></div>
		<%@ include file="footer.jsp" %>