package repository;

import model.Prenotazione;

public interface PrenotazioneDao {
	
	// CREATE PRENOTAZIONE TAVOLO
	public void creaPrenotazione(Prenotazione p);
		
	// GET PRENOTAZIONE TAVOLO
	public Prenotazione getPrenotazione(int id);

	// UPDATE PRENOTAZIONE TAVOLO
	public void updatePrenotazione(Prenotazione p);
	
	// DELETE PRENOTAZIONE TAVOLO
	public void deletePrenotazione(int id);
	
}