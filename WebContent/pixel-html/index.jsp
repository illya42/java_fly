
	<%@ include file="header.jsp" %>
	
	<h1>Accueil</h1>
			
		<h3>Identification</h3>

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
			out.print("Identifiant : <input type='text' name='identifiant'><br/>");
			out.print("Mot de passe : <input type='password' name='mdp'><br/>");
			out.print("<input type='submit' name='valider' value='valider'><br/>");
			out.print("<input type='reset' name='annuler' value='annuler'><br/>");
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
				out.print("Identifiant : <input type='text' name='identifiant' value=" + identifiant + "><br/>");
				out.print("Mot de passe : <input type='password' name='mdp' value=" + mdp + "><br/>");
				out.print("<input type='submit' name='valider' value='valider'><br/>");
				out.print("<input type='submit' name='déconnection' value='déconnection'><br/>");
				out.print("</form>");
			}
			else
			{
				out.print("<form method='post' action=''>");
				out.print("Identifiant : <input type='text' name='identifiant'><br/>");
				out.print("Mot de passe : <input type='password' name='mdp'><br/>");
				out.print("<input type='submit' name='valider' value='valider'><br/>");
				out.print("<input type='reset' name='annuler' value='annuler'><br/>");
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
		if( request.getParameter("déconnection") != null )
		{
			if(!uneSession.isNew())
			{
				uneSession.invalidate();
			}
			response.sendRedirect("index.jsp");
		}
		%>
		
		<%@ include file="footer.jsp" %>