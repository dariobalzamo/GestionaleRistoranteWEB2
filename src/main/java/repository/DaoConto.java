package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utility.Connettore;
import model.Conto;

public final class DaoConto implements ContoDao{
	
	private static DaoConto instance = null;
	
	public static DaoConto getInstance() {
		if(instance == null)
			instance = new DaoConto();
		return instance;
	}
	
	private DaoConto() {
		
	}
	
	
	// #################### METODI CONTO ####################
	
	@Override
	public Conto visualizzaConto(int id_prenotazione) {
		PreparedStatement ps = null;
		Connettore c = Connettore.get_instance(); 
		Connection conn = c.apri_connessione();  
		ResultSet rs = null;
		Conto conto= new Conto();
		boolean flag = true;
		double totale=0;
		List<String> piatti = new ArrayList<String>(); 
		List<Double> prezzi = new ArrayList<Double>();
		List<Integer> quantita = new ArrayList<Integer>();
		
		String sql = "SELECT *,COUNT(piatto) AS quantita,SUM(prezzo) as totale from v_conto where  v_conto.numero_prenotazione = ? and pagato = false GROUP BY piatto"; 
		try {
			ps = conn.prepareStatement(sql); 
			ps.setInt(1, id_prenotazione);
			rs = ps.executeQuery();
			while(rs.next()) {
				if(flag) {
					conto.setNumero_prenotazione(rs.getInt("numero_prenotazione"));
					conto.setNumero_tavolo(rs.getInt("numero_tavolo"));
					conto.setPagato(rs.getBoolean("pagato"));
					flag = false;
				}
				piatti.add(rs.getString("piatto"));
				quantita.add(rs.getInt("quantita"));
				prezzi.add(rs.getDouble("prezzo"));
				totale+=rs.getDouble("totale");
			}
			conto.setPiatti(piatti);
			conto.setPrezzi(prezzi);
			conto.setQuantita(quantita);
			conto.setTotale(totale);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return conto;
	}

}
