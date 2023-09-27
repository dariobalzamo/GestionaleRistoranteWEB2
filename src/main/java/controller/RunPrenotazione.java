package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Prenotazione;
import model.Tavolo;
import repository.DaoPrenotazione;
import repository.DaoTavolo;

@WebServlet("/RunPrenotazione")
public class RunPrenotazione extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private DaoTavolo daoTavolo = DaoTavolo.getInstance();
	private DaoPrenotazione daoPrenota = DaoPrenotazione.getInstance();
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		switch(Integer.parseInt(request.getParameter("scelta"))) {
		case 1: 
			request.setAttribute("tavoli", daoTavolo.get_tavoli());
			request.getRequestDispatcher("prenotaTavolo.jsp").forward(request, response);
			break;
			
		case 2:
			
			break;
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Prenotazione p = null;
		Tavolo t = null;
		
		switch(Integer.parseInt(request.getParameter("scelta"))) {
		case 1:	// CREAZIONE PRENOTAZIONE
			p = new Prenotazione(); 
			p.setId_tavolo(Integer.parseInt(request.getParameter("IdTavolo")));
			p.setPagato(false);
			daoPrenota.creaPrenotazione(p);
			
			// CAMBIO OCCUPAZIONE: TAVOLO -> OCCUPATO
			t = daoTavolo.get_tavolo(p.getId_tavolo());
			t.setOccupato(true);
			daoTavolo.update_tavolo(t);
			request.setAttribute("risposta","Prenotazione avvenuta con successo. Il tuo tavolo è il n. " + request.getParameter("IdTavolo"));
			request.getRequestDispatcher("homepage.jsp").forward(request, response);
			break;
		case 2:	
			
			break;
		}
		
	}

}
