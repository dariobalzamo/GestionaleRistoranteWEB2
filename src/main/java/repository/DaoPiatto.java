package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utility.Connettore;
import model.Piatto;

public final class DaoPiatto implements PiattoDao {

	private static DaoPiatto instance = null;
	
	public static DaoPiatto getInstance() {
		if(instance == null)
			instance = new DaoPiatto();
		return instance;
	}

	private DaoPiatto() {
	}
	
	// ########## METODI DAO: CRUD ##########

	@Override
	public void add_piatto(Piatto p) // INSERIMENTO OGGETTO PIATTO NEL DATABASE
	{
		Connettore c = Connettore.get_instance(); 
		Connection conn = c.apri_connessione(); 
		PreparedStatement ps = null;
		
		try {
			ps = conn.prepareStatement("insert into piatti(nome, prezzo) values(?, ?)"); 
			ps.setString(1, p.getNome());
			ps.setDouble(2, p.getPrezzo());
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
	public Piatto get_piatto(int id) // RECUPERO L'ENTITA' PIATTO, SELEZIONATA PER ID, DAL DATABASE  
	{
		Connettore c = Connettore.get_instance(); 
		Connection conn = c.apri_connessione(); 
		PreparedStatement ps = null;
		ResultSet rs = null;  
		Piatto piatto = null;
		
		try {
			ps = conn.prepareStatement("Select * from piatti where id = ?");
			ps.setInt(1, id);
			rs = ps.executeQuery(); 
			if (rs.next()) 
			{
				piatto = new Piatto(); 
				piatto.setId(rs.getInt("id"));
				piatto.setNome(rs.getString("nome"));
				piatto.setPrezzo(rs.getDouble("prezzo"));
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
		return piatto;
	}

	@Override
	public List<Piatto> get_piatti() // RECUPERO UNA LISTA (RECORD) DI PIATTI DAL DATABASE
	{
		Connettore c = Connettore.get_instance(); 
		Connection conn = c.apri_connessione();
		PreparedStatement ps = null;
		ResultSet rs = null;   
		List<Piatto> piatti = new ArrayList<Piatto>();
		Piatto piatto = null;
		 
		try {
			ps = conn.prepareStatement("Select * from piatti");
			rs = ps.executeQuery(); 
			while(rs.next())
			{
				piatto = new Piatto();
				piatto.setId(rs.getInt("id"));
				piatto.setNome(rs.getString("nome"));
				piatto.setPrezzo(rs.getDouble("prezzo"));
				piatti.add(piatto);
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
		return piatti;
	}

	@Override
	public void update_piatto(Piatto p) // MODIFICA DEI CAMPI DI UN PIATTO NEL DATABASE
	{
		Connettore c = Connettore.get_instance(); 
		Connection conn = c.apri_connessione(); 
		PreparedStatement ps = null;
		
		try {
			ps = conn.prepareStatement("update piatti set nome = ?, prezzo = ? where id = ?");
			ps.setString(1, p.getNome());
			ps.setDouble(2, p.getPrezzo());
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
	public void delete_piatto(int id) // ELIMINAZIONE DI UN PIATTO DAL DATABASE
	{
		Connettore c = Connettore.get_instance(); 
		Connection conn = c.apri_connessione();  
		PreparedStatement ps = null;
		
		try {
			ps = conn.prepareStatement("delete from piatti where id = ?");
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