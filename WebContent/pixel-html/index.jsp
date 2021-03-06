
	<%@ include file="header.jsp" %>
	<link href="css/main.css" rel="stylesheet">
	<link href="css/util.css" rel="stylesheet">
	
	<div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
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
			
			%>
			<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100 p-t-0 p-b-80">
			<form class="login100-form validate-form flex-sb flex-w">
				<span class="login100-form-title p-b-51" style="font-family: rubik;">
					Login
				</span>

				<div class="wrap-input100 validate-input m-b-16">
					<input class="input100" type="text" name="identifiant" style="font-family: rubik;" required placeholder="Identifiant">
					<span class="focus-input100"></span>
				</div>
				
				<div class="wrap-input100 validate-input m-b-16">
					<input class="input100" type="password" name="mdp" style="font-family: rubik;" required placeholder="Mot de passe">
					<span class="focus-input100"></span>
				</div>

				<div class="container-login100-form-btn m-t-17">
					<input class="login100-form-btn" type='submit' style="font-family: rubik;" name='valider' value='valider'>
				</div>
				<div class="container-login100-form-btn m-t-17">
						<input class="login100-form-btn" type='submit' style="font-family: rubik;" name='annuler' value='annuler'>
				</div>

			</form>
		</div>
	</div>
</div><%
		}
		else 
		{
			if (uneSession.getAttribute("identifiant") != null && uneSession.getAttribute("mdp") != null)
			{
				String identifiant = (String) uneSession.getAttribute("identifiant");
				String mdp = (String) uneSession.getAttribute("mdp");
				
			    //Session déjà créée
%>
			    <div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-0 p-b-80">
				<form class="login100-form validate-form flex-sb flex-w">
					<span class="login100-form-title p-b-51" style="font-family: rubik;">
						Login
					</span>

					
					<div class="wrap-input100 validate-input m-b-16">
					<%
						out.print("<input class='input100' style='font-family: rubik;'  type='text' name='identifiant' required placeholder='Identifiant' value=" + identifiant + ">");
					%>
						<span class="focus-input100"></span>
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-16">
					<%
						out.print("<input class='input100' style='font-family: rubik;' type='password' name='mdp' required placeholder='Mot de passe' value=" + mdp + ">");
					%>
						<span class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn m-t-17">
						<input class="login100-form-btn" type='submit' style="font-family: rubik;" name='valider' value='menu'>
					</div>
					<div class="container-login100-form-btn m-t-17">
						<input class="login100-form-btn" type='submit' style="font-family: rubik;" name='deconnection' value='deconnexion'>
					</div>

				</form>
			</div>
		</div>
	</div>
			<%	
			}
			else
			{
				%>
				
				<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-0 p-b-80">
				<form class="login100-form validate-form flex-sb flex-w">
					<span class="login100-form-title p-b-51" style="font-family: rubik;">
						Login
					</span>
					
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" style="font-family: rubik;" name="identifiant" required placeholder="Identifiant">
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="password" style="font-family: rubik;" name="mdp" required placeholder="Mot de passe">
						<span class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn m-t-17">
						<input class="login100-form-btn" type='submit' style="font-family: rubik;" name='valider' value='valider'>
					</div>
					<div class="container-login100-form-btn m-t-17">
						<input class="login100-form-btn" type='submit' style="font-family: rubik;" name='annuler' value='annuler'>
					</div>

				</form>
			</div>
		</div>
	</div>
				
				
				<%
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
				uneSession.setAttribute("role", unAdministrateur.getRole());
				
				response.sendRedirect("menu.jsp");
			}
			else
			{
				out.print("<h3 style= 'font-family:rubik; color:red; text-align: center;'>Veuillez v�rifier les champs</h3>");
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