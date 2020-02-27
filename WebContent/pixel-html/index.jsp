
	<%@ include file="header.jsp" %>
	
	<div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
		<h2>Identification</h2>
		<%!
		//partie déclaration
		Administrateur unAdministrateur = new Administrateur();
		%>
		
		<%
		//partie éxecution
		
		if (uneSession.isNew()) 
		{
			//Nouvelle Session
		    uneSession = request.getSession();
			
			
			out.print("<form method='post' action=''>");
			out.print("<table>");
			out.print("<tr><td>Identifiant : </td><td><input type='text' style='margin:10px;' name='identifiant'></td></tr>");
			out.print("<tr><td>Mot de passe : </td><td><input type='password' style='margin:10px;' name='mdp'></td></tr>");
			out.print("<tr><td><input type='submit' class='button1' name='valider'  style='margin:10px;' value='valider'></td>");
			out.print("<td><input type='reset' class='button2' name='annuler' style='margin:10px;' value='annuler'></td></tr>");
			out.print("</table>");
			out.print("</form>");
		}
		else 
		{
			if (uneSession.getAttribute("identifiant") != null && uneSession.getAttribute("mdp") != null)
			{
				String identifiant = (String) uneSession.getAttribute("identifiant");
				String mdp = (String) uneSession.getAttribute("mdp");
				
			    //Session déjà créée
				
				out.print("<form method='post' action=''>");
				out.print("<table>");
				out.print("<tr><td>Identifiant : </td><td><input type='text' style='margin:10px;' name='identifiant' value=" + identifiant + "></td></tr>");
				out.print("<tr><td>Mot de passe : </td><td><input type='password' style='margin:10px;' name='mdp'value=" + mdp + "></td></tr>");
				out.print("<tr><td><input class='button1' type='submit' name='valider'  style='margin:10px;' value='valider'></td>");
				out.print("<td><input type='submit' name='deconnection' style='margin:10px;' value='deconnection'></td></tr>");
				out.print("</table>");
				out.print("</form>");
			}
			else
			{
				out.print("<form method='post' action=''>");
				out.print("<table>");
				out.print("<tr><td>Identifiant : </td><td><input type='text' style='margin:10px;' name='identifiant'></td></tr>");
				out.print("<tr><td>Mot de passe : </td><td><input type='password' style='margin:10px;' name='mdp'></td></tr>");
				out.print("<tr><td><input type='submit' class='button1' name='valider'  style='margin:10px;' value='valider'></td>");
				out.print("<td><input type='reset' class='button2' name='annuler' style='margin:10px;' value='annuler'></td></tr>");
				out.print("</table>");
				out.print("</form>");
			}
		}
		
		if( request.getParameter("valider") != null )
		{
			String identifiant = request.getParameter("identifiant");
			String mdp = request.getParameter("mdp");
			
			if( Controller.verifConnexion(identifiant, mdp) == true )
			{
				unAdministrateur = Controller.returnAdmin(identifiant, mdp);
				
				uneSession.setAttribute("nom", unAdministrateur.getNom_admin());
				uneSession.setAttribute("prenom", unAdministrateur.getPrenom_admin());
				uneSession.setAttribute("identifiant", unAdministrateur.getIdentifiant());
				uneSession.setAttribute("mdp", unAdministrateur.getMdp());
				
				response.sendRedirect("menu.jsp");
			}
		}
		if( request.getParameter("deconnection") != null )
		{
			if(!uneSession.isNew())
			{
				uneSession.invalidate();
			}
			response.sendRedirect("index.jsp");
		}
		%>
		</div></div></div>
		<%@ include file="footer.jsp" %>