package controller;

import java.util.ArrayList;

import modele.Modele;

public class Controller 
{
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
	public static void deleteTrajet(int id)
	{
		Modele.deleteTrajet(id);
	}
}
