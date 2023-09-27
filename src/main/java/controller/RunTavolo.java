package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Tavolo;
import repository.DaoTavolo;

/**
 * Servlet che avvia il microservizio "TAVOLO". 
 */
@WebServlet("/RunTavolo")
public class RunTavolo extends HttpServlet {
	
	//################### VARIABILI SERVLET ###################
	
	private static final long serialVersionUID = 1L;
	private DaoTavolo daoTavolo = DaoTavolo.getInstance();
	
	
	//################### CHIAMATE REQUEST ###################
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		switch (Integer.parseInt(request.getParameter("scelta"))) {
		case 1: //	GET TAVOLI
			request.setAttribute("tavoli", daoTavolo.get_tavoli());
			request.getRequestDispatcher("tabella_tavoli.jsp").forward(request, response);
			break;
		case 2:	//  ELIMINA TAVOLO
			daoTavolo.delete_tavolo(Integer.parseInt(request.getParameter("id")));
			response.sendRedirect("RunTavolo?scelta=1");
			break;
		case 3:	//  GET TAVOLO
			request.setAttribute("tavolo", daoTavolo.get_tavolo(Integer.parseInt(request.getParameter("id"))));
			request.getRequestDispatcher("modificaTavolo.jsp").forward(request, response);
			break;
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Tavolo tavolo = null;
		
		switch (Integer.parseInt(request.getParameter("scelta"))) {
		case 1:	//	INSERIMENTO TAVOLO
			/* OPERAZIONE DI DATABINDING: Crea l'oggetto tavolo e lo inizializza con i valori 
			   della richiesta 
			 */
			
			tavolo = new Tavolo();
			tavolo.setNumeroPosti(Integer.parseInt(request.getParameter("numeroPosti")));
			tavolo.setOccupato(false);
			daoTavolo.add_tavolo(tavolo);
			response.sendRedirect("RunTavolo?scelta=1");
			break;
		case 2:	//	MODIFICA TAVOLO
			tavolo = new Tavolo();
			tavolo.setId(Integer.parseInt(request.getParameter("id")));
			tavolo.setNumeroPosti(Integer.parseInt(request.getParameter("numeroPosti")));
			tavolo.setOccupato(Boolean.parseBoolean(request.getParameter("occupazione")));
			daoTavolo.update_tavolo(tavolo);
			response.sendRedirect("RunTavolo?scelta=1");
			break;
			
		}
		
	}
}