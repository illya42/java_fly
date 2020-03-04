package modele;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Driver;

public class Bdd
{
    private String serveur, user, mdp, bdd;
    private Connection maConnexion;
    
    public Bdd(String serveur, String bdd, String user, String mdp)
    {
        this.serveur = serveur;
        this.bdd = bdd;
        this.user = user;
        this.mdp = mdp;
        this.maConnexion = null;
    }
    
    public void chargerPilote ()
    {
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
        }
        
        catch (ClassNotFoundException exp)
        {
            System.out.println("Absence du pilote JDBC !");
        }
    }
    
    public void seConnecter ()
    {
        this.chargerPilote();
        String url = "jdbc:mysql://localhost:3308/dbfly";
        
        try 
        {
            this.maConnexion = DriverManager.getConnection(url,"root", "");
        }
        
        catch (SQLException exp)
        {
            System.out.println("Connexion impossible à : " + url);
        }
    }
    
    public void seDeconnecter ()
    {
        try
        {
            if (this.maConnexion != null)
            {
                this.maConnexion.close();
            }
        }
        
        catch (SQLException exp)
        {
            System.out.println("Impossible de fermer la connexion");
        }
        
    }
    
    public Connection getMaConnexion ()
    {
        return this.maConnexion;
    }
    
}