package controller;

public class Reservation 
{
	private int id, groupe_id, trajet_id;
	
	private String tarif, statut;
	
	public Reservation()
	{
		this.id = this.groupe_id = this.trajet_id = 0;
		this.tarif = this.statut = "";
	}

	public Reservation(int id, int groupe_id, String tarif, int trajet_id, String statut) 
	{
		this.id = id;
		this.groupe_id = groupe_id;
		this.tarif = tarif;
		this.trajet_id = trajet_id;
		this.statut = statut;
	}
	
	public Reservation(int groupe_id, String tarif, int trajet_id, String statut) 
	{
		this.groupe_id = groupe_id;
		this.tarif = tarif;
		this.trajet_id = trajet_id;
		this.statut = statut;
	}

	public String consulter()
	{
		return "ID : " + this.id 
				+ "<br/> GROUPE ID : " + this.groupe_id 
				+ "<br/> Tarif : " + this.tarif
				+ "<br/> TRAJET ID : " + this.trajet_id
				+ "<br/> Statut " + this.statut
				+ "<br/>";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getGroupe_id() {
		return groupe_id;
	}

	public void setGroupe_id(int groupe_id) {
		this.groupe_id = groupe_id;
	}

	public int getTrajet_id() {
		return trajet_id;
	}

	public void setTrajet_id(int trajet_id) {
		this.trajet_id = trajet_id;
	}

	public String getTarif() {
		return tarif;
	}

	public void setTarif(String tarif) {
		this.tarif = tarif;
	}

	public String getStatut() {
		return statut;
	}

	public void setStatut(String statut) {
		this.statut = statut;
	}
}
