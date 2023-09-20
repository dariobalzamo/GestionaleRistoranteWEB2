package repository;

import java.util.List;
import model.Piatto;

public interface PiattoDao {
	
	/* Il package Repository è spesso utilizzato per collocare le classi che gestiscono l'accesso 
	 * ai dati persistenti, come un database. 
	 * Queste classi sono responsabili di effettuare query al database, recuperare e salvare dati.
	 * */
	
	// 1) Create: Insert 
	public void add_piatto(Piatto p);
		
	// 2) Read one
	public Piatto get_piatto(int id);
		
	// 3) Read all
	public List<Piatto> get_piatti();
		
	// 4) Update
	public void update_piatto(Piatto p);
		
	// 5) Delete
	public void delete_piatto(int id);
}
