package controller;

import java.util.ArrayList;

import modele.Modele;

public class Controller 
{
	//FONCTIONS ADMINISTRATEUR
	
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
	
	//FIN FONCTIONS GROUPE
	
	//FONCTIONS RESERVATION
	
	//FIN FONCTIONS RESERVATION
}
