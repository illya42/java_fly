package modele;

import java.sql.Statement;
import java.util.ArrayList;

import java.sql.ResultSet;
import java.sql.SQLException;

import controller.Administrateur;
import controller.Groupe;
import controller.Reservation;
import controller.Trajet;
import controller.Vol;


public class Modele 
{
	private static Bdd uneBdd = new Bdd("localhost", "dbfly", "root", "");
	
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
	                    unRes.getString("mdp")
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
						unRes.getString("mdp")
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
				+ unAdministrateur.getId() 
		+ "','" + unAdministrateur.getNom_admin()
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
		+ " where id = '" 
		+ unAdministrateur.getId() + "';";
		
		executer (requete);
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
		+ "', image = '" + unTrajet.getImage()
		+ "' where id = '" 
		+ unTrajet.getId() + "';";
		
		executer (requete);
	}
	
	public static Trajet selectTrajet(int id)
	{
		Trajet unTrajet = null;
		
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
		
		String requete = "select * from groupe;";
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
						desRes.getString("destination"),
						desRes.getString("date"),
						desRes.getInt("trajet_id")
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
	
	public static void insertGroupe( Groupe unGroupe )
	{
		String requete="insert into groupe values (null, '" 
				+ unGroupe.getAdministrateur_id() 
		+"','" + unGroupe.getDestination() 
		+"','" + unGroupe.getDate()
		+"','" + unGroupe.getId_trajet()
		+"');";
		
		executer (requete);
	}
	
	public static void deleteGroupe( int id )
	{
		String requete ="delete from groupe where id = " + id + ";";
		
		executer (requete);
	}
	
	public static void updateGroupe( Groupe unGroupe )
	{
		String requete="update groupe set administrateur_id = '" + unGroupe.getAdministrateur_id()
		+ "', destination = '" + unGroupe.getDestination()
		+ "', date = '" + unGroupe.getDate()
		+ "', id_trajet = '" + unGroupe.getId_trajet()
		+ " where id = '" 
		+ unGroupe.getId() + "';";
		
		executer (requete);
	}
	
	public static Groupe selectGroupe(int id)
	{
		Groupe unGroupe = null;
		
		String requete = "select * from groupe where id = " + id + ";";
	            
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
	                    unRes.getString("destination"),
	                    unRes.getString("date"),
	                    unRes.getInt("trajet_id")
	                    );
	        }
	    }
	    catch(SQLException exp)
	    {
	        System.out.println("Erreur execution : " + requete);
	    }
	    uneBdd.seDeconnecter();
		
		return unGroupe;
	}
	
	//FIN FONCTIONS GROUPE
	
	//FONCTIONS RESERVATION
	
	public static ArrayList<Reservation> selectAllReservations()
	{
		ArrayList<Reservation> lesReservations = new ArrayList<Reservation>();
		
		String requete = "select * from reservation;";
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
						desRes.getString("tarif"),
						desRes.getInt("trajet_id")
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
	
	public static void insertReservation( Reservation uneReservation )
	{
		String requete="insert into vol values (null, '" 
				+ uneReservation.getGroupe_id()
		+"','" + uneReservation.getTarif() 
		+"','" + uneReservation.getTrajet_id()
		+"');";
		
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
		+ "', date_vol = '" + uneReservation.getTarif()
		+ "', heure_dep = '" + uneReservation.getTrajet_id()
		+ " where id = '" 
		+ uneReservation.getId() + "';";
		
		executer (requete);
	}
	
	public static Reservation selectReservation(int id)
	{
		Reservation uneReservation = null;
		
		String requete = "select * from reservation where id = " + id + ";";
	            
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
	                    unRes.getString("tarif"),
	                    unRes.getInt("trajet_id")
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
	
	//FIN FONCTIONS RESERVATION
}
