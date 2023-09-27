package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Prenotazione;
import utility.Connettore;

public final class DaoPrenotazione implements PrenotazioneDao{
	
	private static DaoPrenotazione instance = null;
	
	public static DaoPrenotazione getInstance() {
		if(instance == null)
			instance = new DaoPrenotazione();
		return instance;
	}
	
	private DaoPrenotazione() {
		
	}
	
	
	// ########################### METODI CRUD ###########################
	
	@Override
	public void creaPrenotazione(Prenotazione p) {
		Connettore c = Connettore.get_instance();
		Connection conn = c.apri_connessione();
		PreparedStatement ps = null;
		
		try {
			ps = conn.prepareStatement("Insert into prenotazioni(id_tavolo, pagato) values(?, ?)");
			ps.setInt(1, p.getId_tavolo());
			ps.setBoolean(2, p.isPagato());
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
	public Prenotazione getPrenotazione(int id_tavolo) {
		Connettore c = Connettore.get_instance();
		Connection conn = c.apri_connessione();
		PreparedStatement ps = null;
		ResultSet rs = null; 
		Prenotazione p = null;
		
		try {
			ps = conn.prepareStatement("select * from prenotazioni where id_tavolo = ? AND pagato = false");
			ps.setInt(1, id_tavolo);
			rs = ps.executeQuery();
			if(rs.next()) {
				p = new Prenotazione();
				p.setId(rs.getInt("id"));
				p.setId_tavolo(rs.getInt("id_tavolo"));
				p.setPagato(rs.getBoolean("pagato"));
			}
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
		return p;
	}

	@Override
	public void updatePrenotazione(Prenotazione p) {
		Connettore c = Connettore.get_instance();
		Connection conn = c.apri_connessione();
		PreparedStatement ps = null;

		try {
			ps = conn.prepareStatement("Update prenotazioni set id_tavolo = ?, pagato = ? where id = ?");
			ps.setInt(1, p.getId_tavolo());
			ps.setBoolean(2, true);
			ps.setInt(3, p.getId());
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
	public void deletePrenotazione(int id) {
		Connettore c = Connettore.get_instance();
		Connection conn = c.apri_connessione();
		PreparedStatement ps = null;
		
		try {
			ps = conn.prepareStatement("Delete from prenotazioni where id = ?");
			ps.setInt(1, id);
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
