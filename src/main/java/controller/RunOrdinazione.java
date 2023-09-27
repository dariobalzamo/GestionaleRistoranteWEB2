package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;
import repository.*;

@WebServlet("/RunOrdinazione")
public class RunOrdinazione extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    private DaoPiatto daoPiatto = DaoPiatto.getInstance();
    private DaoTavolo daoTavolo = DaoTavolo.getInstance();
    private DaoPrenotazione daoPrenota = DaoPrenotazione.getInstance();
    private DaoOrdinazione daoOrdine = DaoOrdinazione.getInstance();
    private DaoConto daoConto = DaoConto.getInstance();
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Prenotazione prenotazione = null;
		Conto conto = null;
		
		switch(Integer.parseInt(request.getParameter("scelta"))) {
		case 1:	//	SELEZIONE DEL PROPRIO TAVOLO  
			request.setAttribute("flag", Boolean.parseBoolean(request.getParameter("flag")));
			request.setAttribute("tavoli", daoTavolo.get_tavoli());
			request.getRequestDispatcher("validazioneTavolo.jsp").forward(request, response);
			break;
		case 2:	
			prenotazione = daoPrenota.getPrenotazione(Integer.parseInt(request.getParameter("IdTavolo")));
			request.setAttribute("idPrenotazione", prenotazione.getId());
			request.setAttribute("piatti", daoPiatto.get_piatti());
			request.getRequestDispatcher("ordinazioneMenu.jsp").forward(request, response);
			break;
		case 3:	// VISUALIZZAZIONE CONTO: Prendo l'id della prenotazione in base al numero del tavolo associato e mi ricavo la tabella del conto
			prenotazione = daoPrenota.getPrenotazione(Integer.parseInt(request.getParameter("IdTavolo")));
			conto = daoConto.visualizzaConto(prenotazione.getId());
			request.setAttribute("conto",conto);
			request.getRequestDispatcher("conto.jsp").forward(request, response);
			break;
		}
		
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Ordinazione ordine = null;
		Prenotazione prenotazione = null;
		Tavolo tavolo = null;
		
		switch(Integer.parseInt(request.getParameter("scelta"))) {
		case 1: // CREAZIONE DELL'ORDINAZIONE 
			ordine = new Ordinazione();
			ordine.setId_prenotazione(Integer.parseInt(request.getParameter("idPrenotazione")));
			ordine.setId_piatto(Integer.parseInt(request.getParameter("id_piatto")));
			daoOrdine.insertOrdine(ordine);
			request.setAttribute("risposta","Ordine inviato in cucina.");
			request.getRequestDispatcher("homepage.jsp").forward(request, response);
			break;
		case 2:	// REINDIRIZZAMENTO PER LA VISUALIZZAZIONE DEL CONTO DA PAGARE
			response.sendRedirect("RunOrdinazione?scelta=1&flag=true");
			break;
		case 3:	// CAMBIO OCCUPAZIONE: Lo stato del tavolo passa a false(non occupato) quando il cliente effettua il pagamento  
			tavolo = daoTavolo.get_tavolo(Integer.parseInt(request.getParameter("idTavolo")));
			prenotazione = daoPrenota.getPrenotazione(tavolo.getId());
			tavolo.setOccupato(false);
			daoTavolo.update_tavolo(tavolo);
			daoPrenota.updatePrenotazione(prenotazione);
			request.setAttribute("risposta","Pagamento effettuato con successo ! Buona giornata.");
			request.getRequestDispatcher("homepage.jsp").forward(request, response);
			break;
		}
		
	}

}