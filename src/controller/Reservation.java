package controller;

public class Reservation 
{
	private int id, groupe_id;
	
	private String destination, statut;
	
	private float tarif, tarif_reduc, taux_reduc;
	
	public Reservation()
	{
		this.id = this.groupe_id = 0;
		this.destination = this.statut = "";
		 this.tarif = this.tarif_reduc = this.taux_reduc = 0;
	}

	public Reservation(int id, int groupe_id, String destination, float tarif, float tarif_reduc, float taux_reduc, String statut) 
	{
		this.id = id;
		this.groupe_id = groupe_id;
		this.destination = destination;
		this.tarif = tarif;
		this.tarif_reduc = tarif_reduc;
		this.taux_reduc = taux_reduc;
		this.statut = statut;
	}
	
	public Reservation(int groupe_id, float tarif, float tarif_reduc, float taux_reduc, String statut) 
	{
		this.groupe_id = groupe_id;
		this.tarif = tarif;
		this.tarif_reduc = tarif_reduc;
		this.taux_reduc = taux_reduc;
		this.statut = statut;
	}
	
	public Reservation(int id, int groupe_id, float tarif, float tarif_reduc, float taux_reduc, String statut) 
	{
		this.id = id;
		this.groupe_id = groupe_id;
		this.tarif = tarif;
		this.tarif_reduc = tarif_reduc;
		this.taux_reduc = taux_reduc;
		this.statut = statut;
	}

	public String consulter()
	{
		return "ID : " + this.id 
				+ "<br/> GROUPE ID : " + this.groupe_id 
				+ "<br/> Destination : " + this.destination
				+ "<br/> Tarif : " + this.tarif
				+ "<br/> Tarif_reduc : " + this.tarif_reduc
				+ "<br/> Taux_reduc : " + this.taux_reduc
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

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public float getTarif() {
		return tarif;
	}

	public void setTarif(float tarif) {
		this.tarif = tarif;
	}

	public float getTarif_reduc() {
		return tarif_reduc;
	}

	public void setTarif_reduc(float tarif_reduc) {
		this.tarif_reduc = tarif_reduc;
	}

	public float getTaux_reduc() {
		return taux_reduc;
	}

	public void setTaux_reduc(float taux_reduc) {
		this.taux_reduc = taux_reduc;
	}

	public String getStatut() {
		return statut;
	}

	public void setStatut(String statut) {
		this.statut = statut;
	}
}
