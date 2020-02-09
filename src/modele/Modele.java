package modele;

import java.sql.Statement;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.SQLException;

import controller.Administrateur;
import controller.Trajet;

public class Modele 
{
	private static Bdd uneBdd = new Bdd("localhost", "dbfly", "root", "root");
	
	//FONCTIONS CONNECTION
	
	public static Administrateur connection( String identifiant, String mdp )
	{
		
		String requete = "select * from administrateur where identifiant = " + identifiant + " and mdp = " + mdp + ";";
		
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
			}
			
			uneBdd.seDeconnecter();
		}
		catch(SQLException exp)
		{
			exp.printStackTrace();
		}

		return ;
	}
	
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
}
