package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Ordinazione;
import utility.Connettore;

public final class DaoOrdinazione implements OrdinazioneDao{

	private static DaoOrdinazione instance = null;
	
	public static DaoOrdinazione getInstance() {
		if(instance == null)
			instance = new DaoOrdinazione();
		return instance;
	}
	
	private DaoOrdinazione() {
		
	}
	
	
	// ########################### METODI CRUD ###########################
	
	@Override
	public void insertOrdine(Ordinazione order) {
		Connettore c = Connettore.get_instance();
		Connection conn = c.apri_connessione();
		PreparedStatement ps = null;
		
		try {
			ps = conn.prepareStatement("Insert into ordinazioni(id_prenotazione, id_piatto) values(?, ?)");
			ps.setInt(1, order.getId_prenotazione());
			ps.setInt(2, order.getId_piatto());
			ps.execute();
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
	}

	@Override
	public Ordinazione getOrdine(int id) {
		Connettore c = Connettore.get_instance();
		Connection conn = c.apri_connessione();
		PreparedStatement ps = null;
		ResultSet rs = null;
		Ordinazione order = null;
		
		try {
			ps = conn.prepareStatement("Select * from ordinazioni where id = ?");
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				order = new Ordinazione();
				order.setId(rs.getInt("id"));
				order.setId_prenotazione(rs.getInt("id_prenotazione"));
				order.setId_piatto(rs.getInt("id_piatto"));
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return order;
	}

	@Override
	public List<Ordinazione> getOrdini() {
		Connettore c = Connettore.get_instance();
		Connection conn = c.apri_connessione();
		PreparedStatement ps = null;
		ResultSet rs = null;
		Ordinazione order = null;
		List<Ordinazione> ordini = new ArrayList<Ordinazione>();
		
		try {
			ps = conn.prepareStatement("Select * from ordinazioni order by id");
			rs = ps.executeQuery();
			while(rs.next()) {
				order = new Ordinazione();
				order.setId(rs.getInt("id"));
				order.setId_prenotazione(rs.getInt("id_prenotazione"));
				order.setId_piatto(rs.getInt("id_piatto"));
				ordini.add(order);
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ordini;
	}

	@Override
	public void updateOrdine(Ordinazione order) {
		Connettore c = Connettore.get_instance();
		Connection conn = c.apri_connessione();
		PreparedStatement ps = null;
		
		try {
			ps = conn.prepareStatement("Update ordinazioni set id_prenotazione = ?, id_piatto = ? where id = ?");
			ps.setInt(1, order.getId_prenotazione());
			ps.setInt(2, order.getId_piatto());
			ps.setInt(3, order.getId());
			ps.execute();
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
	}

	@Override
	public void deleteOrdine(int id) {
		Connettore c = Connettore.get_instance();
		Connection conn = c.apri_connessione();
		PreparedStatement ps = null;
		
		try {
			ps = conn.prepareStatement("Delete from ordinazioni where id = ?");
			ps.setInt(3, id);
			ps.execute();
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
	}
	
}