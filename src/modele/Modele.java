package modele;

import java.sql.Statement;
import java.util.ArrayList;

import java.sql.ResultSet;
import java.sql.SQLException;

import controller.Administrateur;
import controller.Groupe;
import controller.Reservation;
import controller.Trajet;


public class Modele 
{
	private static Bdd uneBdd = new Bdd("localhost", "dbfly", "root", "root");
	
	public static void executer(String requete)
	{
		try
		{
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			unStat.execute(requete);
			unStat.close();
			uneBdd.seDeconnecter();
		}
		catch( SQLException exp )
		{
			System.out.println("Erreur d'execution :" + requete);
		}
	}
	
	//FONCTIONS ADMINISTRATEUR
	
	public static Administrateur selectWhereAdministrateur(String identifiant, String mdp) 
    {
	    Administrateur unAdministrateur = null;
	    
	    String requete = "select * from administrateur where identifiant = '" + identifiant + 
	            "' and mdp = '" 
	            + mdp + "';";
	            
	    uneBdd.seConnecter();
	
	    try
	    {
	        Statement unStat = uneBdd.getMaConnexion().createStatement();
	        ResultSet unRes = unStat.executeQuery(requete);
	        if(unRes.next())
	        {
	            unAdministrateur = new Administrateur(
	                    unRes.getInt("id"),
	                    unRes.getString("nom_admin"),
	                    unRes.getString("prenom_admin"),
	                    unRes.getString("identifiant"),
	                    unRes.getString("mdp"),
	                    unRes.getString("role")
	                    );
	        }
	    }
	    catch(SQLException exp)
	    {
	        System.out.println("Erreur execution : " + requete);
	    }
	    uneBdd.seDeconnecter();
	    
	    return unAdministrateur;
	}
	
	public static ArrayList<Administrateur> selectAllAdministrateurs()
	{
		ArrayList<Administrateur> lesAdministrateurs = new ArrayList<Administrateur>();
		
		String requete = "select * from administrateur;";
		
		try 
		{
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet unRes = unStat.executeQuery(requete);
			
			while(unRes.next())
			{
			Administrateur unAdministrateur = new Administrateur(
						unRes.getInt("id"),
						unRes.getString("nom_admin"),
						unRes.getString("prenom_admin"),
						unRes.getString("identifiant"),
						unRes.getString("mdp"),
						unRes.getString("role")
						);
				lesAdministrateurs.add(unAdministrateur);
			}
			
			uneBdd.seDeconnecter();
		}
		catch(SQLException exp)
		{
			exp.printStackTrace();
		}
		
		return lesAdministrateurs;
	}
	
	public static void insertAdministrateur( Administrateur unAdministrateur )
	{
		String requete="insert into administrateur values (null, '" 
				+ unAdministrateur.getNom_admin()
		+"','" + unAdministrateur.getPrenom_admin() 
		+"','" + unAdministrateur.getIdentifiant()
		+"','" + unAdministrateur.getMdp()
		+"');";
		
		executer (requete);
	}
	
	public static void deleteAdministrateur( int id )
	{
		String requete ="delete from administrateur where id = " + id + ";";
		
		executer (requete);
	}
	
	public static void updateAdministrateur( Administrateur unAdministrateur )
	{
		String requete="update administrateur set nom_admin = '" + unAdministrateur.getNom_admin()
		+ "', prenom_admin = '" + unAdministrateur.getPrenom_admin()
		+ "', identifiant = '" + unAdministrateur.getIdentifiant()
		+ "', mdp = '" + unAdministrateur.getMdp()
		+ "', role = '" + unAdministrateur.getRole()
		+ "' where id = '" 
		+ unAdministrateur.getId() + "';";
		
		System.out.println(requete);
		
		executer (requete);
	}
	
	public static Administrateur selectAdministrateur(int id)
	{
		Administrateur unAdministrateur = new Administrateur();
		
		String requete = "select * from administrateur where id = " + id + ";";
	            
	    uneBdd.seConnecter();
	
	    try
	    {
	        Statement unStat = uneBdd.getMaConnexion().createStatement();
	        ResultSet unRes = unStat.executeQuery(requete);
	        if(unRes.next())
	        {
	            unAdministrateur = new Administrateur(
	                    unRes.getInt("id"),
	                    unRes.getString("nom_admin"),
	                    unRes.getString("prenom_admin"),
	                    unRes.getString("identifiant"),
	                    unRes.getString("mdp"),
	                    unRes.getString("role")
	                    );
	        }
	    }
	    catch(SQLException exp)
	    {
	        System.out.println("Erreur execution : " + requete);
	    }
	    uneBdd.seDeconnecter();
		
		return unAdministrateur;
	}
	
	//FIN FONCTIONS ADMINISTRATEUR
	
	//FONCTIONS TRAJET
	
	public static ArrayList<Trajet> selectAllTrajets()
	{
		ArrayList<Trajet> lesTrajets = new ArrayList<Trajet>();
		String requete = "select * from trajet;";
		try 
		{
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desRes = unStat.executeQuery(requete);
			while(desRes.next())
			{
				Trajet unTrajet = new Trajet(
						desRes.getInt("id"),
						desRes.getString("heure_dep"),
						desRes.getString("heure_arr"),
						desRes.getString("aeroport"),
						desRes.getString("date"),
						desRes.getString("destination"),
						desRes.getString("image"),
						desRes.getInt("prix")
						);
				lesTrajets.add(unTrajet);
			}
			uneBdd.seDeconnecter();
		}
		catch(SQLException exp)
		{
			exp.printStackTrace();
		}
		return lesTrajets;
	}
	

	public static ArrayList<Trajet> selectWhereTrajets (String mot){
		ArrayList<Trajet> lesTrajetsrech = new ArrayList<Trajet>();
		String requete = "select * from trajet where id like '%"+mot+"%'"
				+ " or heure_dep like '%" + mot +"%'"
				+ " or heure_arr like '%" + mot +"%'"
				+ " or aeroport like '%" + mot +"%'"
				+ " or date like '%" + mot +"%'"
				+ " or destination like '%" + mot +"%'"
				+ " or image like '%" + mot +"%'"
				+ " or prix like '%" + mot +"%'"
				+ ";";
		try 
		{
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desRes = unStat.executeQuery(requete);

			System.out.println(" " + requete);
			while(desRes.next())
			{
				Trajet unTrajet = new Trajet(
						desRes.getInt("id"),
						desRes.getString("heure_dep"),
						desRes.getString("heure_arr"),
						desRes.getString("aeroport"),
						desRes.getString("date"),
						desRes.getString("destination"),
						desRes.getString("image"),
						desRes.getInt("prix")
						);
				lesTrajetsrech.add(unTrajet);
			}
			uneBdd.seDeconnecter();
		}
		catch(SQLException exp)
		{
			exp.printStackTrace();
		}
		return lesTrajetsrech;
	}
	
	
	public static void insertTrajet( Trajet unTrajet )
	{
		String requete="insert into trajet values (null, '" 
				+ unTrajet.getHeure_dep() 
		+"','" + unTrajet.getHeure_arr()
		+"','" + unTrajet.getAeroport()
		+"','" + unTrajet.getDate()
		+"','" + unTrajet.getDestination()
		+"','" + unTrajet.getImage()
		+"'," + unTrajet.getPrix()
		+");";
		
		System.out.println(" " + requete);
		executer (requete);
	}
	
	public static void deleteTrajet( int id )
	{
		String requete ="delete from trajet where id = " + id + ";";
		System.out.println(" " + requete);
		executer (requete);
	}
	
	public static void updateTrajet( Trajet unTrajet )
	{
		String requete="update trajet set prix = '" + unTrajet.getPrix()
		+ "', heure_dep = '" + unTrajet.getHeure_dep()
		+ "', heure_arr = '" + unTrajet.getHeure_arr()
		+ "', aeroport = '" + unTrajet.getAeroport()
		+ "', date = '" + unTrajet.getDate()
		+ "', destination = '" + unTrajet.getDestination()
		+ "', image = '" + unTrajet.getImage() + "' where id = '" + unTrajet.getId() + "';";
		
		executer (requete);
	}
	
	public static Trajet selectTrajet(int id)
	{
		Trajet unTrajet = new Trajet();
		
		String requete = "select * from trajet where id = " + id + ";";
	            
	    uneBdd.seConnecter();
	
	    try
	    {
	        Statement unStat = uneBdd.getMaConnexion().createStatement();
	        ResultSet unRes = unStat.executeQuery(requete);
	        if(unRes.next())
	        {
	            unTrajet = new Trajet(
	                    unRes.getInt("id"),
	                    unRes.getString("heure_dep"),
	                    unRes.getString("heure_arr"),
	                    unRes.getString("aeroport"),
	                    unRes.getString("date"),
	                    unRes.getString("destination"),
	                    unRes.getString("image"),
	                    unRes.getInt("prix")
	                    );
	        }
	    }
	    catch(SQLException exp)
	    {
	        System.out.println("Erreur execution : " + requete);
	    }
	    uneBdd.seDeconnecter();
		
		return unTrajet;
	}
	
	//FIN FONCTIONS TRAJET
	
	//FONCTIONS GROUPE
	
	public static ArrayList<Groupe> selectAllGroupes()
	{
		ArrayList<Groupe> lesGroupes = new ArrayList<Groupe>();
		
		String requete = "select g.id, g.administrateur_id, g.nb_personnes, t.destination, t.date, g.id_trajet, g.statut from groupe g, trajet t where g.id_trajet = t.id;";
		try 
		{
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desRes = unStat.executeQuery(requete);
			while(desRes.next())
			{
				Groupe unGroupe = new Groupe(
						desRes.getInt("id"),
						desRes.getInt("administrateur_id"),
						desRes.getInt("nb_personnes"),
						desRes.getInt("id_trajet"),
						desRes.getString("destination"),
						desRes.getString("date"),
						desRes.getString("statut")
						);
				lesGroupes.add(unGroupe);
			}
			uneBdd.seDeconnecter();
		}
		catch(SQLException exp)
		{
			exp.printStackTrace();
		}
		return lesGroupes;
	}
	
	public static ArrayList<Groupe> selectWhereGroupes(String mot)
	{
		ArrayList<Groupe> lesGroupesrech = new ArrayList<Groupe>();
		
		String requete = "select * from groupe where id like '%"+mot+"%'"
				+ " or administrateur_id like '%" + mot +"%'"
				+ " or id_trajet like '%" + mot +"%'"
				+ " or nb_personnes like '%" + mot +"%'"
				+ " or statut like '%" + mot +"%'"
				+ ";";
		try 
		{
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desRes = unStat.executeQuery(requete);
			
			System.out.println(" " + requete);
			while(desRes.next())
			{
				Groupe unGroupe = new Groupe(
						desRes.getInt("id"),
						desRes.getInt("administrateur_id"),
						desRes.getInt("id_trajet"),
						desRes.getInt("nb_personnes"),
						desRes.getString("statut")
						);
				lesGroupesrech.add(unGroupe);
			}
			uneBdd.seDeconnecter();
		}
		catch(SQLException exp)
		{
			exp.printStackTrace();
		}
		return lesGroupesrech;
	}
	
	
	public static void deleteGroupe( int id )
	{
		String requete ="delete from groupe where id = " + id + ";";
		
		executer (requete);
	}
	
	public static void updateGroupe( Groupe unGroupe )
	{
		String requete="update groupe set administrateur_id = '" + unGroupe.getAdministrateur_id()
		+ "', nb_personnes = '" + unGroupe.getNb_personnes()
		+ "', id_trajet = '" + unGroupe.getId_trajet()
		+ "', statut = '" + unGroupe.getStatut()
		+ "' where id = '" 
		+ unGroupe.getId() + "';";
		
		System.out.println(requete);
		
		executer (requete);
	}
	
	public static Groupe selectGroupe(int id)
	{
		Groupe unGroupe = new Groupe();
		
		String requete = "select g.id, g.administrateur_id, g.nb_personnes, g.id_trajet, t.destination, t.date, g.statut from groupe g, trajet t where g.id_trajet = t.id and g.id = " + id + ";";
	            
	    uneBdd.seConnecter();
	
	    try
	    {
	        Statement unStat = uneBdd.getMaConnexion().createStatement();
	        ResultSet unRes = unStat.executeQuery(requete);
	        if(unRes.next())
	        {
	            unGroupe = new Groupe(
	                    unRes.getInt("id"),
	                    unRes.getInt("administrateur_id"),
	                    unRes.getInt("nb_personnes"),
	                    unRes.getInt("id_trajet"),
	                    unRes.getString("destination"),
	                    unRes.getString("date"),
	                    unRes.getString("statut")
	                    );
	        }
	    }
	    catch(SQLException exp)
	    {
	        System.out.println("Erreur execution : " + requete);
	    }
	    uneBdd.seDeconnecter();
	    
	    System.out.println(requete);
		
		return unGroupe;
	}
	
	//FIN FONCTIONS GROUPE
	
	//FONCTIONS RESERVATION
	
	public static ArrayList<Reservation> selectAllReservations()
	{
		ArrayList<Reservation> lesReservations = new ArrayList<Reservation>();
		
		//String requete = "select r.id, r.groupe_id, t.destination, (g.nb_personnes * t.prix) as tarif, (tarif * taux_reduc) as tarif_reduc, taux_reduc, r.statut from reservation r, groupe g, trajet t where r.groupe_id = g.id and g.id_trajet = t.id;";
		String requete = "select r.id, r.groupe_id, t.destination, tarif, tarif_reduc, taux_reduc, r.statut from reservation r, groupe g, trajet t where r.groupe_id = g.id and g.id_trajet = t.id;";
		try 
		{
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desRes = unStat.executeQuery(requete);
			while(desRes.next())
			{
				Reservation uneReservation = new Reservation(
						desRes.getInt("id"),
						desRes.getInt("groupe_id"),
						desRes.getString("destination"),
						desRes.getFloat("tarif"),
						desRes.getFloat("tarif_reduc"),
						desRes.getFloat("taux_reduc"),
						desRes.getString("statut")
						);
				lesReservations.add(uneReservation);
			}
			uneBdd.seDeconnecter();
		}
		catch(SQLException exp)
		{
			exp.printStackTrace();
		}
		return lesReservations;
	}
	
	public static ArrayList<Reservation> selectWhereReservations(String mot)
	{
		ArrayList<Reservation> lesReservationsrech = new ArrayList<Reservation>();
		
		String requete = "select * from reservation where id like '%"+mot+"%'"
				+ " or groupe_id like '%" + mot +"%'"
				+ " or tarif like '%" + mot +"%'"
				+ " or tarif_reduc like '%" + mot +"%'"
				+ " or taux_reduc like '%" + mot +"%'"
				+ " or statut like '%" + mot +"%'"
				+ ";";
		try 
		{
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desRes = unStat.executeQuery(requete);
			
			System.out.println(" " + requete);
			while(desRes.next())
			{
				Reservation uneReservation = new Reservation(
						desRes.getInt("id"),
						desRes.getInt("groupe_id"),
						desRes.getFloat("tarif"),
						desRes.getFloat("tarif_reduc"),
						desRes.getFloat("taux_reduc"),
						desRes.getString("statut")
						);
				lesReservationsrech.add(uneReservation);
			}
			uneBdd.seDeconnecter();
		}
		catch(SQLException exp)
		{
			exp.printStackTrace();
		}
		return lesReservationsrech;
	}
	
	public static void insertReservation( Reservation uneReservation )
	{
		String requete="insert into reservation values (null, '" 
				+ uneReservation.getGroupe_id()
		+"','" + uneReservation.getTarif() 
		+"','" + uneReservation.getTarif_reduc() 
		+"','" + uneReservation.getTaux_reduc() 
		+"','" + uneReservation.getStatut()
		+"');";
		
		System.out.println(" " + requete);
		executer (requete);
	}
	
	public static void deleteReservation( int id )
	{
		String requete ="delete from reservation where id = " + id + ";";
		
		executer (requete);
	}
	
	public static void updateReservation( Reservation uneReservation )
	{
		String requete="update reservation set groupe_id = '" + uneReservation.getGroupe_id()
		+ "', tarif = '" + uneReservation.getTarif()
		+ "', tarif_reduc = '" + uneReservation.getTarif_reduc()
		+ "', taux_reduc = '" + uneReservation.getTaux_reduc()
		+ "', statut = '" + uneReservation.getStatut()
		+ "' where id = '" 
		+ uneReservation.getId() + "';";
		
		System.out.println(requete);
		
		executer (requete);
	}
	
	public static Reservation selectReservation(int id)
	{
		Reservation uneReservation = null;
		//String requete = "select r.id, r.groupe_id, t.destination, (g.nb_personnes * t.prix) as tarif, (tarif * taux_reduc) as tarif_reduc, taux_reduc, r.statut from reservation r, groupe g, trajet t where r.groupe_id = g.id and g.id_trajet = t.id and r.id = " + id + ";";
		String requete = "select r.id, r.groupe_id, t.destination, tarif, tarif_reduc, taux_reduc, r.statut from reservation r, groupe g, trajet t where r.groupe_id = g.id and g.id_trajet = t.id and r.id = " + id + ";";
	            
	    uneBdd.seConnecter();
	
	    try
	    {
	        Statement unStat = uneBdd.getMaConnexion().createStatement();
	        ResultSet unRes = unStat.executeQuery(requete);
	        if(unRes.next())
	        {
	            uneReservation = new Reservation(
						unRes.getInt("id"),
						unRes.getInt("groupe_id"),
						unRes.getString("destination"),
						unRes.getFloat("tarif"),
						unRes.getFloat("tarif_reduc"),
						unRes.getFloat("taux_reduc"),
						unRes.getString("statut")
						);
	        }
	    }
	    catch(SQLException exp)
	    {
	        System.out.println("Erreur execution : " + requete);
	    }
	    uneBdd.seDeconnecter();
		
		return uneReservation;
	}
	
	public static int selectTarif(int id)
	{		
		int tarif = 0;
		
		String requete = "select nb_personnes * prix as tarif from groupe g, trajet t where g.id_trajet = t.id and g.id = " + id + ";";
        
	    uneBdd.seConnecter();
	
	    try
	    {
	        Statement unStat = uneBdd.getMaConnexion().createStatement();
	        ResultSet unRes = unStat.executeQuery(requete);
	        if(unRes.next())
	        {
	        	tarif = unRes.getInt("tarif");
	        }
	    }
	    catch(SQLException exp)
	    {
	        System.out.println("Erreur execution : " + requete);
	    }
	    uneBdd.seDeconnecter();
	    
	    return tarif;
	}
	
	public static int selectNb_personnes(int id)
	{		
		int nb_personnes = 0;
		
		String requete = "select nb_personnes from groupe where id = " + id + ";";
        
	    uneBdd.seConnecter();
	
	    try
	    {
	        Statement unStat = uneBdd.getMaConnexion().createStatement();
	        ResultSet unRes = unStat.executeQuery(requete);
	        if(unRes.next())
	        {
	        	nb_personnes = unRes.getInt("nb_personnes");
	        }
	    }
	    catch(SQLException exp)
	    {
	        System.out.println("Erreur execution : " + requete);
	    }
	    uneBdd.seDeconnecter();
	    
	    return nb_personnes;
	}
	
	public static ArrayList<Groupe> selectFree_groupes()
	{
		ArrayList<Groupe> lesGroupes = new ArrayList<Groupe>();
		
		String requete = "select g.id, t.destination from groupe g, trajet t where g.id not in ( select groupe_id from reservation ) and g.id_trajet = t.id;";
		try 
		{
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desRes = unStat.executeQuery(requete);
			while(desRes.next())
			{
				Groupe unGroupe = new Groupe(
						desRes.getInt("id"),
						desRes.getString("destination")
						);
				lesGroupes.add(unGroupe);
			}
			uneBdd.seDeconnecter();
		}
		catch(SQLException exp)
		{
			exp.printStackTrace();
		}
		return lesGroupes;
	}
	
	//FIN FONCTIONS RESERVATION

}
