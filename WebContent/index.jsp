<%@ page import="controller.Compte"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="entete.jsp" %>
	<h1>Gestion de trajet / réservation / groupe</h1>
	<h2>Insertion de trajet</h2>
	<form method="post" action="">
	Nom : <input type="text" name="nom"><br/>
	Prénom : <input type="text" name="prenom"><br/>
	Numéro : <input type="number" name="numero"><br/>
	<input type="submit" name="ouvrir" value="ouvrir"><br/>
	</form>
	<br/>
	<br/>
	<form method="post" action="">
	Dépot : <input type="number" name="depot">
	<input type="submit" name="deposer" value="deposer"><br/>
	</form>
	<br/>
	<br/>
	<form method="post" action="">
	Retrait : <input type="number" name="retrait">
	<input type="submit" name="retirer" value="retirer">
	</form>
	<%!
	//partie déclaration
	Compte unCompte;
	%>
	
	<%
	//partie éxecution
	if ( request.getParameter("ouvrir") != null )
	{
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		int numero = Integer.parseInt(request.getParameter("numero"));
		unCompte = new Compte( nom, prenom, numero, 80 );
		
		out.print( "<br/> Votre compte : " );
		out.print( "" + unCompte.consulter() );
	}
	if ( request.getParameter("deposer") != null )
	{
		float depot = Float.parseFloat(request.getParameter("depot"));
		unCompte.deposer(depot);
		
		out.print("<br/> Votre solde : " + unCompte.getSolde());
	}
	if ( request.getParameter("retirer") != null )
	{
		float retrait = Float.parseFloat(request.getParameter("retrait"));
		unCompte.retirer(retrait);
		
		out.print("<br/> Votre solde : " + unCompte.getSolde());
	}
	%>
	<%@ include file="footer.jsp" %>
</body>
</html>