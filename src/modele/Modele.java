package modele;

import java.sql.Statement;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.SQLException;

import controller.Administrateur;
import controller.Trajet;
import controller.Vol;

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
						desRes.getInt("prix"),
						desRes.getString("heure_dep"),
						desRes.getString("heure_arr"),
						desRes.getString("aeroport"),
						desRes.getString("date"),
						desRes.getString("destination"),
						desRes.getString("image")
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
				+ unTrajet.getId() 
		+ "','" + unTrajet.getPrix() 
		+"','" + unTrajet.getHeure_dep() 
		+"','" + unTrajet.getHeure_arr()
		+"','" + unTrajet.getAeroport()
		+"','" + unTrajet.getDate()
		+"','" + unTrajet.getDestination()
		+"','" + unTrajet.getImage()
		+"');";
		
		executer (requete);
	}
	
	public static void deleteTrajet( int id )
	{
		String requete ="delete from trajet where id = " + id + ";";
		
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
		+ " where id = '" 
		+ unTrajet.getId() + "';";
		
		executer (requete);
	}
	
	//FIN FONCTIONS TRAJET
	
	//FONCTIONS VOL
	
	public static ArrayList<Vol> selectAllVols()
	{
		ArrayList<Vol> lesVols = new ArrayList<Vol>();
		
		String requete = "select * from vol;";
		try 
		{
			uneBdd.seConnecter();
			Statement unStat = uneBdd.getMaConnexion().createStatement();
			ResultSet desRes = unStat.executeQuery(requete);
			while(desRes.next())
			{
				Vol unVol = new Vol(
						desRes.getInt("id"),
						desRes.getInt("trajet_id"),
						desRes.getString("date_vol"),
						desRes.getString("heure_dep"),
						desRes.getString("heure_arr"),
						desRes.getString("aeroport_dep"),
						desRes.getString("aeroport_arr")
						);
				lesVols.add(unVol);
			}
			uneBdd.seDeconnecter();
		}
		catch(SQLException exp)
		{
			exp.printStackTrace();
		}
		return lesVols;
	}
	
	public static void insertVol( Vol unVol )
	{
		String requete="insert into vol values (null, '" 
				+ unVol.getId() 
		+ "','" + unVol.getTrajet_id() 
		+"','" + unVol.getDate_vol() 
		+"','" + unVol.getHeure_dep()
		+"','" + unVol.getHeure_arr()
		+"','" + unVol.getAeroport_dep()
		+"','" + unVol.getAeroport_arr()
		+"');";
		
		executer (requete);
	}
	
	public static void deleteVol( int id )
	{
		String requete ="delete from vol where id = " + id + ";";
		
		executer (requete);
	}
	
	public static void updateVol( Vol unVol )
	{
		String requete="update vol set trajet_id = '" + unVol.getTrajet_id()
		+ "', date_vol = '" + unVol.getHeure_dep()
		+ "', heure_dep = '" + unVol.getHeure_dep()
		+ "', heure_arr = '" + unVol.getHeure_arr()
		+ "', aeroport_dep = '" + unVol.getAeroport_dep()
		+ "', aeroport_arr = '" + unVol.getAeroport_arr()
		+ " where id = '" 
		+ unVol.getId() + "';";
		
		executer (requete);
	}
	
	//FIN FONCTIONS VOL
	
	//FONCTIONS GROUPE
	
	//FIN FONCTIONS GROUPE
	
	//FONCTIONS RESERVATION
	
	//FIN FONCTIONS RESERVATION
}
