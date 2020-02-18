package controller;

import java.util.ArrayList;

import modele.Modele;

public class Controller 
{
	//FONCTIONS ADMINISTRATEUR
	
	
	public static boolean verifConnexion(String identifiant, String mdp) 
	{	
		boolean verif = false;
		
		if ( identifiant.equals("") || mdp.equals("") )
		{
			System.out.println("Champs incomplets");
		}
		else
		{
			Administrateur unAdministrateur = Modele.selectWhereAdministrateur( identifiant ,mdp );
			if (unAdministrateur == null)
			{
				System.out.println("Veuillez vérifier les champs");
			}
			else 
			{
				System.out.println("Bienvenue " + unAdministrateur.getNom_admin()  +  unAdministrateur.getPrenom_admin());
				
				verif = true;
			}
		}
		
		return verif;
	}
	
	public static void insertAdministrateur(Administrateur unAdministrateur)
	{
		Modele.insertAdministrateur(unAdministrateur);
	}
	public static void updateAdministrateur(Administrateur unAdministrateur)
	{
		Modele.updateAdministrateur(unAdministrateur);
	}
	public static ArrayList<Administrateur> selectAllAdministrateur()
	{
		return Modele.selectAllAdministrateurs();
	}
	public static void deleteAdministrateur(int id)
	{
		Modele.deleteAdministrateur(id);
	}
	
	//FIN FONCTIONS ADMINISTRATEUR
	
	//FONCTIONS TRAJET
	
	public static void insertTrajet(Trajet unTrajet)
	{
		//appel du modele
		//on peut réaliser des controles sur les données avant les insertions
		Modele.insertTrajet(unTrajet);
	}
	public static void updateTrajet(Trajet unTrajet)
	{
		Modele.updateTrajet(unTrajet);
	}
	public static ArrayList<Trajet> selectAllTrajets()
	{
		return Modele.selectAllTrajets();
	}
	public static void deleteTrajet(int id)
	{
		Modele.deleteTrajet(id);
	}
	
	//FIN FONCTIONS TRAJET
	
	//FONCTIONS VOL
	
	public static void insertVol(Vol unVol)
	{
		Modele.insertVol(unVol);
	}
	public static void updateVol(Vol unVol)
	{
		Modele.updateVol(unVol);
	}
	public static ArrayList<Vol> selectAllVols()
	{
		return Modele.selectAllVols();
	}
	public static void deleteVol(int id)
	{
		Modele.deleteVol(id);
	}
	
	//FIN FONCTIONS VOL
	
	//FONCTIONS GROUPE
	
	public static void insertGroupe(Groupe unGroupe)
	{
		Modele.insertGroupe(unGroupe);
	}
	public static void updateGroupe(Groupe unGroupe)
	{
		Modele.updateGroupe(unGroupe);
	}
	public static ArrayList<Groupe> selectAllGroupes()
	{
		return Modele.selectAllGroupes();
	}
	public static void deleteGroupe(int id)
	{
		Modele.deleteGroupe(id);
	}
	
	//FIN FONCTIONS GROUPE
	
	//FONCTIONS RESERVATION
	
	public static void insertReservation(Reservation uneReservation)
	{
		Modele.insertReservation(uneReservation);
	}
	public static void updateReservation(Reservation uneReservation)
	{
		Modele.updateReservation(uneReservation);
	}
	public static ArrayList<Reservation> selectAllReservations()
	{
		return Modele.selectAllReservations();
	}
	public static void deleteReservation(int id)
	{
		Modele.deleteReservation(id);
	}
	
	//FIN FONCTIONS RESERVATION
}
