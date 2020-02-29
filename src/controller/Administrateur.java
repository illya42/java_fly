package controller;

public class Administrateur 
{
	private int id;
	private String nom_admin, prenom_admin, identifiant, mdp, role;
	
	public Administrateur()
	{
		this.nom_admin = this.prenom_admin = this.identifiant = this.mdp = this.role = "";
		this.id = 0;
	}

	public Administrateur(int id, String nom_admin, String prenom_admin, String identifiant, String mdp, String role) 
	{
		super();
		this.id = id;
		this.nom_admin = nom_admin;
		this.prenom_admin = prenom_admin;
		this.identifiant = identifiant;
		this.mdp = mdp;
		this.role = role;
	}
	
	public Administrateur(String nom_admin, String prenom_admin, String identifiant, String mdp, String role)
	{
		super();
		this.nom_admin = nom_admin;
		this.prenom_admin = prenom_admin;
		this.identifiant = identifiant;
		this.mdp = mdp;
		this.role = role;
	}
	
	public String consulter()
	{
		return "ID : " + this.id 
				+ "<br/> Nom : " + this.nom_admin 
				+ "<br/> Prénom : " + this.prenom_admin
				+ "<br/> Rôle : " + this.role
				+ "<br/>";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNom_admin() {
		return nom_admin;
	}

	public void setNom_admin(String nom_admin) {
		this.nom_admin = nom_admin;
	}

	public String getPrenom_admin() {
		return prenom_admin;
	}

	public void setPrenom_admin(String prenom_admin) {
		this.prenom_admin = prenom_admin;
	}

	public String getIdentifiant() {
		return identifiant;
	}

	public void setIdentifiant(String identifiant) {
		this.identifiant = identifiant;
	}

	public String getMdp() {
		return mdp;
	}

	public void setMdp(String mdp) {
		this.mdp = mdp;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}
