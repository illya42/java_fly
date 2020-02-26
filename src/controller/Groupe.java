package controller;

public class Groupe 
{
	private int id, administrateur_id, id_trajet;
	private String destination, date;
	
	public Groupe()
	{
		this.id = this.administrateur_id = this.id_trajet = 0;
		this.destination = this.date = "";
	}

	public Groupe(int id, int administrateur_id, String destination, String date, int id_trajet) 
	{
		this.id = id;
		this.administrateur_id = administrateur_id;
		this.destination = destination;
		this.date = date;
		this.id_trajet = id_trajet;
	}
	
	public String consulter()
	{
		return "ID : " + this.id 
				+ "<br/> ADMIN ID : " + this.administrateur_id 
				+ "<br/> Destination : " + this.destination
				+ "<br/> Date : " + this.date
				+ "<br/> TRAJET ID : " + this.id_trajet
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
}
