package repository;

import java.util.List;
import model.Ordinazione;

public interface OrdinazioneDao {
		
		// CREATE ORDINAZIONE
		public void insertOrdine(Ordinazione order);
		
		// READ ORDINAZIONE 
		public Ordinazione getOrdine(int id);
		
		// READ ORDINAZIONI 
		public List<Ordinazione> getOrdini();
		
		// UPDATE ORDINAZIONE
		public void updateOrdine(Ordinazione order);
		
		// DELETE ORDINAZIONE 
		public void deleteOrdine(int id);
		
}