
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

	<%@ include file="header.jsp" %>
		<div class="row">
                    <div class="col-sm-12">
                        <div class="white-box" style="display: inline-block; width: 450px; vertical-align: top; text-align: center; max-width: 100%;">
		<h2>Gestion des Trajets</h2>
		<form method="post" style="margin-left: 40px;" action="">
		<table>
				<tr><td>Prix : </td><td><input style="margin:10px;" type="number" min="10" name="prix" placeholder="Rentrez un prix"></td></tr>
				<tr><td>Heure de départ : </td><td><input style="margin:10px;" type="text" name="heure_dep"></td></tr>
				<tr><td>Heure d'arrivée : </td><td><input style="margin:10px;" type="text" name="heure_arr"></td></tr>
				<tr><td>Aéroport de départ : </td><td><input style="margin:10px;" type="text" name="aeroport"></td></tr>
				<tr><td>Date : </td><td><input type="date" style="margin:10px;" name="date"></td></tr>
				<tr><td>Destination : </td><td><input style="margin:10px;" type="text" name="destination"></td></tr>
				<tr><td>Image : </td><td><input style="margin:10px;" type="text" name="image"></td></tr>
				<tr><td><input type="submit" style="margin:10px;" id="bouton1" name="enregistrer" value="Enregistrer"></td>
				<td><input type="reset" style="margin:10px;" name="annuler" value="annuler"></td></tr>
				<tr><td><input type="submit" style="margin:10px;" name="retour" value="Retour"></td></tr>
		</table>
		</form>
		<br/>
		<br/></div>
		
		<div class="white-box" style=" display: inline-block;">
		<canvas id="myChart" width="400" height="400"></canvas>
		<% ArrayList<Tstat> lesTstat = Controller.selectTstat(); 
		for (Tstat unTstat : lesTstat)
        {
		out.print(unTstat.getNbtrajet()+unTstat.getDestination());
        }
		%>
<script>
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'pie',
    data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
</script>
		</div>
		
		</div>
		</div>
		<%!
		//partie déclaration
		Trajet unTrajet = new Trajet();
		%>
		<div class="white-box">
                            <h3 class="box-title">Trajets</h3>
                            
        	<form method="post" style="margin-left:286px;text-align:center;" action="">
				<table>
                           <tr><td> Recherche : <input style="width:250px; " type="text" name="recherche"></td>
                           <td><input type="submit" style="margin:10px;"  name="rech" value="Rechercher"></td>
                           </tr>
       			</table>
			</form>
		<%
	//	partie éxecution
		
	
		if ( request.getParameter("recherche") != null )
		{
			
			String mot = request.getParameter("recherche");
			
			ArrayList<Trajet> lesTrajetsrech = Controller.selectWhereTrajets(mot);
			out.print("<div class='table-responsive'><table class='table'><thead><tr><th>ID</th><th>Heure départ</th><th>Heure arrivée</th><th>Aéroport</th><th>Date</th><th>Destination</th><th>Image</th><th>Prix</th></tr></thead><tbody>");
			for (Trajet unTrajet : lesTrajetsrech)
	        {
	            out.print("<tr><td>" + unTrajet.getId() 
	            + "</td><td>" + unTrajet.getHeure_dep() 
	            + "</td><td>" + unTrajet.getHeure_arr() 
	            + "</td><td>" + unTrajet.getAeroport() 
	            + "</td><td>" + unTrajet.getDate() 
	            + "</td><td>" + unTrajet.getDestination() 
	            + "</td><td>" + unTrajet.getImage() 
	            + "</td><td>" + unTrajet.getPrix() 
	            
	            + "</td><td><a href='trajet.jsp?edit=E&id=" + unTrajet.getId() + "'> EDITER </a></td>"
	        	+ "</td><td><a href='trajet.jsp?supp=X&id=" + unTrajet.getId() + "'> SUPPRIMER </a></td></tr>");
	        }
			out.print("</table>");
		}
		else
		{
		ArrayList<Trajet> lesTrajets = Controller.selectAllTrajets();
		//parcourir les compte
		out.print("<div class='table-responsive'><table class='table'><thead><tr><th>ID</th><th>Heure départ</th><th>Heure arrivée</th><th>Aéroport</th><th>Date</th><th>Destination</th><th>Image</th><th>Prix</th></tr></thead><tbody>");
		for (Trajet unTrajet : lesTrajets)
        {
            out.print("<tr><td>" + unTrajet.getId() 
            + "</td><td>" + unTrajet.getHeure_dep() 
            + "</td><td>" + unTrajet.getHeure_arr() 
            + "</td><td>" + unTrajet.getAeroport() 
            + "</td><td>" + unTrajet.getDate() 
            + "</td><td>" + unTrajet.getDestination() 
            + "</td><td>" + unTrajet.getImage() 
            + "</td><td>" + unTrajet.getPrix() 
            
            + "</td><td><a href='trajet.jsp?edit=E&id=" + unTrajet.getId() + "'> EDITER </a></td>"
        	+ "</td><td><a href='trajet.jsp?supp=X&id=" + unTrajet.getId() + "'> SUPPRIMER </a></td></tr>");
        }
		out.print("</table>");
		}
		
	
		
		
		
		if ( request.getParameter("id") != null && request.getParameter("edit") != null )
		{
			int id = Integer.parseInt(request.getParameter("id"));
			
			//response.sendRedirect("update.jsp");
			
			uneSession.setAttribute("id", id);
			response.sendRedirect("editer.jsp");
		}
		
		if ( request.getParameter("id") != null && request.getParameter("supp") != null )
		{
			int id = Integer.parseInt(request.getParameter("id"));
			
			Controller.deleteTrajet(id);
			response.sendRedirect("trajet.jsp");
		}
		
		if ( request.getParameter("enregistrer") != null )
		{
			String heure_dep = request.getParameter("heure_dep");
			String heure_arr = request.getParameter("heure_arr");
			String aeroport = request.getParameter("aeroport");
			String date = request.getParameter("date");
			String destination = request.getParameter("destination");
			String image = request.getParameter("image");
			int prix = Integer.parseInt(request.getParameter("prix"));
			
			unTrajet = new Trajet( heure_dep, heure_arr, aeroport, date, destination, image, prix );
			
			//insertion de ce compte dans la bdd
			
			Controller.insertTrajet(unTrajet);
			
			out.print("Insertion dans la bdd réussie");
			out.print( "<br/> Nouveau Trajet : " );
			out.print( "" + unTrajet.consulter() );
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