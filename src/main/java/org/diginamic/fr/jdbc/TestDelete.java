package org.diginamic.fr.jdbc;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.diginamic.fr.TestConnexionJdbc;
import org.diginamic.fr.dao.FournisseurDao;
import org.diginamic.fr.model.Fournisseur;

public class TestDelete {

	public static void main(String[] args) {
		deleteFournisseur();
		showList();
	}
	
	public static void deleteFournisseur() {
		Connection connection = null;
		try {
			connection = TestConnexionJdbc.getConnection();
			Statement statement = connection.createStatement();
			String query = "DELETE FROM fournisseur WHERE id=4";
			
			statement.executeUpdate(query);
			
			statement.close();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		} finally {
			if(connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.getMessage();
				}
			}
		}
	}
	
	public static void showList() {
		try {
			List<Fournisseur> myList = FournisseurDao.getAll();
			for(Fournisseur fo: myList) {
				System.out.println("ID : " + fo.getId() + " || Nom : " + fo.getNom());
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}

}
