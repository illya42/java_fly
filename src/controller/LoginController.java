package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modele.Modele;


@WebServlet("/Login")
public class LoginController extends HttpServlet 
{
   private static final long serialVersionUID = 1L;

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
   {
      response.setContentType("text/html");
      PrintWriter out = response.getWriter();
      
      String identifiant = request.getParameter("identifiant");
      String mdp = request.getParameter("mdp");
      
      Administrateur unAdministrateur = Modele.selectWhereAdministrateur( identifiant ,mdp );
      
      if (unAdministrateur == null)
      {
    	  RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
    	  
          out.println("<font color=red>Identifiants ou mot de passe invalide</font>");
          rd.include(request, response);
      }
      else
      {
    	  
    	  out.print("Bienvenue, " + unAdministrateur.getNom_admin() + " " + unAdministrateur.getPrenom_admin() );
          
          HttpSession session = request.getSession(); 		// reuse existing
                                              				// session if exist
                                              				// or create one
          
          session.setAttribute("nom", unAdministrateur.getNom_admin() );
          
          //session.setMaxInactiveInterval(30); 			// 30 seconds
          
          response.sendRedirect("trajet.jsp");
      }
   }
}
