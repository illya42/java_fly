package controller;

public class Trajet 
{
	private int id, prix;
	private String heure_dep, heure_arr, aeroport, date, destination, image;
	
	public Trajet()
	{
		this.id = this.prix = 0;
		this.heure_dep = this.heure_arr = this.aeroport = this.date = this.destination = this.image = "";
	}

	public Trajet(int id, String heure_dep, String heure_arr, String aeroport, String date, String destination, String image,  int prix) 
	{
		this.id = id;
		this.heure_dep = heure_dep;
		this.heure_arr = heure_arr;
		this.aeroport = aeroport;
		this.date = date;
		this.destination = destination;
		this.image = image;
		this.prix = prix;
	}
	
	public Trajet( String heure_dep, String heure_arr, String aeroport, String date, String destination, String image, int prix )
	{
		this.heure_dep = heure_dep;
		this.heure_arr = heure_arr;
		this.aeroport = aeroport;
		this.date = date;
		this.destination = destination;
		this.image = image;
		this.prix = prix;
	}
	
	public String consulter()
	{
		return "ID : " + this.id
				+ "<br/> Heure de départ : " + this.heure_dep
				+ "<br/> Heure d'arrivée : " + this.heure_arr
				+ "<br/> Aéroport : " + this.aeroport
				+ "<br/> Date : " + this.date
				+ "<br/> Destination : " + this.destination
				+ "<br/> Image : " + this.image
				+ "<br/> Prix : " + this.prix 
				+ "<br/>";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
	
	public int getPrix() {
		return prix;
	}

	public void setPrix(int prix) {
		this.prix = prix;
	}
}
