package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utility.Connettore;
import model.Tavolo;

public final class DaoTavolo implements TavoloDao{
	
	private static DaoTavolo instance = null;
	
	public static DaoTavolo getInstance() {
		if(instance == null)
			instance = new DaoTavolo();
		return instance;
	}
	
	private DaoTavolo() {
		
	}
	

	// ########## METODI DAO: CRUD ##########
	
	@Override
	public void add_tavolo(Tavolo t) // INSERIMENTO OGGETTO TAVOLO NEL DATABASE
	{
		Connettore c = Connettore.get_instance();
		Connection conn = c.apri_connessione();
		PreparedStatement ps = null;
		
		try {
			ps = conn.prepareStatement("Insert into tavoli(numeroPosti, occupato) values(?, ?)");
			ps.setInt(1, t.getNumeroPosti());
			ps.setBoolean(2, t.isOccupato());
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
	public Tavolo get_tavolo(int id) // RECUPERO L'ENTITA' TAVOLO, SELEZIONATA PER ID, DAL DATABASE 
	{
		Connettore c = Connettore.get_instance();
		Connection conn = c.apri_connessione();
		PreparedStatement ps = null;
		ResultSet rs = null;
		Tavolo tavolo = null;
		
		try {
			ps = conn.prepareStatement("Select * from tavoli where id = ?");
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				tavolo = new Tavolo();
				tavolo.setId(rs.getInt("id"));
				tavolo.setNumeroPosti(rs.getInt("numeroPosti"));
				tavolo.setOccupato(rs.getBoolean("occupato"));
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
		return tavolo;
	}

	@Override
	public List<Tavolo> get_tavoli() // RECUPERO UNA LISTA (RECORD) DI TAVOLI DAL DATABASE
	{
		Connettore c = Connettore.get_instance();
		Connection conn = c.apri_connessione();
		PreparedStatement ps = null;
		ResultSet rs = null;
		Tavolo tavolo = null;
		List<Tavolo> tavoli = new ArrayList<Tavolo>();
		
		try {
			ps = conn.prepareStatement("Select * from tavoli order by id");
			rs = ps.executeQuery();
			while (rs.next()) {
				tavolo = new Tavolo();
				tavolo.setId(rs.getInt("id"));
				tavolo.setNumeroPosti(rs.getInt("numeroPosti"));
				tavolo.setOccupato(rs.getBoolean("occupato"));
				tavoli.add(tavolo);
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
		return tavoli;
	}

	@Override
	public void update_tavolo(Tavolo t)  // MODIFICA DEI CAMPI DI UN TAVOLO NEL DATABASE
	{
		Connettore c = Connettore.get_instance();
		Connection conn = c.apri_connessione();
		PreparedStatement ps = null;
	
		try {
			ps = conn.prepareStatement("Update tavoli set numeroPosti = ?, occupato = ? where id = ?");
			ps.setInt(1, t.getNumeroPosti());
			ps.setBoolean(2, t.isOccupato());
			ps.setInt(3, t.getId());
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
	public void delete_tavolo(int id) // ELIMINAZIONE DI UN TAVOLO DAL DATABASE
	{
		Connettore c = Connettore.get_instance();
		Connection conn = c.apri_connessione();
		PreparedStatement ps = null;
		
		try {
			ps = conn.prepareStatement("delete from tavoli where id = ?");
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
