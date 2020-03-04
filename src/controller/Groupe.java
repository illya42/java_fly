package controller;

public class Groupe 
{
	private int id, administrateur_id, id_trajet, nb_personnes;
	private String destination, date, statut;
	
	public Groupe()
	{
		this.id = this.administrateur_id = this.id_trajet = this.nb_personnes = 0;
		this.destination = this.date = this.statut = "";
	}

	public Groupe( int id, int administrateur_id, int nb_personnes, int id_trajet, String destination, String date, String statut ) 
	{
		this.id = id;
		this.administrateur_id = administrateur_id;
		this.nb_personnes = nb_personnes;
		this.id_trajet = id_trajet;
		this.destination = destination;
		this.date = date;
		this.statut = statut;
	}
	
	public Groupe( int id, int administrateur_id, int nb_personnes, int id_trajet, String statut )
	{
		this.id = id;
		this.administrateur_id = administrateur_id;
		this.id_trajet = id_trajet;
		this.nb_personnes = nb_personnes;
		this.statut = statut;
	}
	
	public Groupe ( int id, String destination )
	{
		this.id = id;
		this.destination = destination;
	}
	
	public String consulter()
	{
		return "ID : " + this.id 
				+ "<br/> ADMIN ID : " + this.administrateur_id 
				+ "<br/> Destination : " + this.destination
				+ "<br/> Date : " + this.date
				+ "<br/> TRAJET ID : " + this.id_trajet
				+ "<br/> Statut : " + this.statut 
				+ "<br/>";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAdministrateur_id() {
		return administrateur_id;
	}

	public void setAdministrateur_id(int administrateur_id) {
		this.administrateur_id = administrateur_id;
	}
	
	public int getId_trajet() {
		return id_trajet;
	}

	public void setId_trajet(int id_trajet) {
		this.id_trajet = id_trajet;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getStatut() {
		return statut;
	}

	public void setStatut(String statut) {
		this.statut = statut;
	}

	public int getNb_personnes() {
		return nb_personnes;
	}

	public void setNb_personnes(int nb_personnes) {
		this.nb_personnes = nb_personnes;
	}
}
