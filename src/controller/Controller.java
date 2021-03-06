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
				System.out.println("Veuillez v�rifier les champs");
			}
			else 
			{
				System.out.println("Bienvenue " + unAdministrateur.getNom_admin()  +  unAdministrateur.getPrenom_admin());
				
				verif = true;
			}
		}
		
		return verif;
	}
	
	public static Administrateur returnAdmin(String identifiant, String mdp)
	{
		return Modele.selectWhereAdministrateur(identifiant, mdp);
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
	public static Administrateur returnAdministrateur(int id)
	{
		return Modele.selectAdministrateur(id);
	}
	
	//FIN FONCTIONS ADMINISTRATEUR
	
	//FONCTIONS TRAJET
	
	public static void insertTrajet(Trajet unTrajet)
	{
		//appel du modele
		//on peut r�aliser des controles sur les donn�es avant les insertions
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
	public static ArrayList<Trajet> selectWhereTrajets(String mot)
	{
		return Modele.selectWhereTrajets(mot);
	}
	public static void deleteTrajet(int id)
	{
		Modele.deleteTrajet(id);
	}
	
	public static Trajet returnTrajet(int id)
	{
		return Modele.selectTrajet(id);
	}
	
	//FIN FONCTIONS TRAJET
	
	//FONCTIONS GROUPE
	
	public static void updateGroupe(Groupe unGroupe)
	{
		Modele.updateGroupe(unGroupe);
	}
	public static ArrayList<Groupe> selectAllGroupes()
	{
		return Modele.selectAllGroupes();
	}
	public static ArrayList<Groupe> selectWhereGroupes(String mot)
	{
		return Modele.selectWhereGroupes(mot);
	}
	public static void deleteGroupe(int id)
	{
		Modele.deleteGroupe(id);
	}
	
	public static Groupe returnGroupe(int id)
	{
		return Modele.selectGroupe(id);
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
	
	public static Reservation returnReservation(int id)
	{
		return Modele.selectReservation(id);
	}
	public static ArrayList<Reservation> selectWhereReservations(String mot)
	{
		return Modele.selectWhereReservations(mot);
	}
	
	public static int selectTarif(int id)
	{
		return Modele.selectTarif(id);
	}
	
	public static int selectNb_personnes(int id)
	{
		return Modele.selectNb_personnes(id);
	}
	public static ArrayList<Groupe> selectFree_groupes()
	{
		return Modele.selectFree_groupes();
	}
	
	//FIN FONCTIONS RESERVATION
}
