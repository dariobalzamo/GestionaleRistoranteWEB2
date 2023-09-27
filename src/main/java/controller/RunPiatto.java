package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Piatto;
import repository.DaoPiatto;



@WebServlet("/RunPiatto")
public class RunPiatto extends HttpServlet {
	
		//################### VARIABILI SERVLET ###################
	
		private static final long serialVersionUID = 1L;
		private DaoPiatto daoPiatto = DaoPiatto.getInstance();
		
		//################### CHIAMATE REQUEST ###################
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			switch (Integer.parseInt(request.getParameter("scelta"))) {
			case 1: //	GET PIATTO
				request.setAttribute("piatti", daoPiatto.get_piatti());
				request.getRequestDispatcher("tabella_piatti.jsp").forward(request, response);
				break;
			case 2:	//  ELIMINA PIATTO
				daoPiatto.delete_piatto(Integer.parseInt(request.getParameter("id")));
				response.sendRedirect("RunPiatto?scelta=1");
				break;
			case 3:	//  GET PIATTO
				request.setAttribute("piatto", daoPiatto.get_piatto(Integer.parseInt(request.getParameter("id"))));
				request.getRequestDispatcher("modificaPiatto.jsp").forward(request, response);
				break;
			}
			
		}

		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Piatto piatto = null;
			
			switch (Integer.parseInt(request.getParameter("scelta"))) {
			case 1:	//	INSERIMENTO PIATTO
				piatto = new Piatto();
				piatto.setNome(request.getParameter("nome"));
				piatto.setPrezzo(Double.parseDouble(request.getParameter("prezzo")));
				daoPiatto.add_piatto(piatto);
				response.sendRedirect("RunPiatto?scelta=1");
				break;
			case 2:	//	MODIFICA PIATTO
				piatto = new Piatto();
				piatto.setId(Integer.parseInt(request.getParameter("id")));
				piatto.setNome(request.getParameter("piatto"));
				piatto.setPrezzo(Double.parseDouble(request.getParameter("prezzo")));
				daoPiatto.update_piatto(piatto);
				response.sendRedirect("RunPiatto?scelta=1");
				break;
			}
		}
}