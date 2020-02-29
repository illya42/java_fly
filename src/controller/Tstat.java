package controller;

public class Tstat {


	private int nbtrajet;
	private String destination;
	
	public Tstat (int nbtrajet, String destination) {
		this.nbtrajet = nbtrajet;
		this.destination = destination;
	}
	
	public Tstat (String destination) {
		this.nbtrajet = 0;
		this.destination = destination;
	}
	
	public Tstat () {
		this.nbtrajet = 0;
		this.destination = "";
	}

	public int getNbtrajet() {
		return nbtrajet;
	}

	public void setSaison(int saison) {
		this.nbtrajet = saison;
	}

	public String getDestination() {
		return destination;
	}

	public void setNombreDeReservation(String destination) {
		this.destination = destination;
	}

}
