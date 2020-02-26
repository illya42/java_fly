package controller;

public class Vol 
{
	private int id, trajet_id;
	
	private String date_vol, heure_dep, heure_arr, aeroport_dep, aeroport_arr;
	
	public Vol()
	{
		this.id = this.trajet_id = 0;
		this.date_vol = this.heure_dep = this.heure_arr = this.aeroport_dep = this.aeroport_arr = "";
	}

	public Vol(int id, int trajet_id, String date_vol, String heure_dep, String heure_arr, String aeroport_dep, String aeroport_arr) 
	{
		super();
		this.id = id;
		this.trajet_id = trajet_id;
		this.date_vol = date_vol;
		this.heure_dep = heure_dep;
		this.heure_arr = heure_arr;
		this.aeroport_dep = aeroport_dep;
		this.aeroport_arr = aeroport_arr;
	}
	
	public String consulter()
	{
		return "ID : " + this.id 
				+ "<br/> TRAJET ID : " + this.trajet_id 
				+ "<br/> date_vol : " + this.date_vol
				+ "<br/> Heure de départ : " + this.heure_dep
				+ "<br/> Heure d'arrivée : " + this.heure_arr
				+ "<br/> Aéroport de départ : " + this.aeroport_dep
				+ "<br/> Aéroport d'arrivée : " + this.aeroport_arr
				+ "<br/>";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTrajet_id() {
		return trajet_id;
	}

	public void setTrajet_id(int trajet_id) {
		this.trajet_id = trajet_id;
	}

	public String getDate_vol() {
		return date_vol;
	}

	public void setDate_vol(String date_vol) {
		this.date_vol = date_vol;
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

	public String getAeroport_dep() {
		return aeroport_dep;
	}

	public void setAeroport_dep(String aeroport_dep) {
		this.aeroport_dep = aeroport_dep;
	}

	public String getAeroport_arr() {
		return aeroport_arr;
	}

	public void setAeroport_arr(String aeroport_arr) {
		this.aeroport_arr = aeroport_arr;
	}
	
}
