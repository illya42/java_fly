package controller;

public class Trajet 
{
	private int id, prix;
	private String heure_dep, heure_arr, aeroport, date, destination, image;
	
	public Trajet()
	{
		this.heure_dep = this.heure_arr = this.aeroport = this.date = this.destination = this.image = "";
		this.id = 0;
		this.prix = 0;
	}

	public Trajet(int id, int prix, String heure_dep, String heure_arr, String aeroport, String date, String destination, String image) 
	{
		super();
		this.id = id;
		this.prix = prix;
		this.heure_dep = heure_dep;
		this.heure_arr = heure_arr;
		this.aeroport = aeroport;
		this.date = date;
		this.destination = destination;
		this.image = image;
	}
	
	public String consulter()
	{
		return "ID : " + this.id 
				+ "<br/> Prix : " + this.prix 
				+ "<br/> Heure de d�part : " + this.heure_dep
				+ "<br/> Heure d'arriv�e : " + this.heure_arr
				+ "<br/> A�roport : " + this.aeroport
				+ "<br/> Date : " + this.date
				+ "<br/> Destination : " + this.destination
				+ "<br/> Image : " + this.image
				+ "<br/>";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPrix() {
		return prix;
	}

	public void setPrix(int prix) {
		this.prix = prix;
	}

	public String getHeure_dep() {
		return heure_dep;
	}

	public void setHeure_dep(String heure_dep) {
		this.heure_dep = heure_dep;
	}

	public String getHeure_arr() {
		return heure_arr;
	}

	public void setHeure_arr(String heure_arr) {
		this.heure_arr = heure_arr;
	}

	public String getAeroport() {
		return aeroport;
	}

	public void setAeroport(String aeroport) {
		this.aeroport = aeroport;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	
}