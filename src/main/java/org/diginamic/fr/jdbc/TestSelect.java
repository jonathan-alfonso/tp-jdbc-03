package org.diginamic.fr.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.diginamic.fr.TestConnexionJdbc;
import org.diginamic.fr.jdbc.entites.Fournisseur;

public class TestSelect {

	public static void main(String[] args) {
		showList();
	}
	
	public static List<Fournisseur> getAll() {
		Connection connection = null;
		List<Fournisseur> fournisseursList = new ArrayList<Fournisseur>();
		try {
			connection = TestConnexionJdbc.getConnection();
			Statement statement = connection.createStatement();
			String query = "SELECT id, nom FROM fournisseur";
			
			ResultSet cursor = statement.executeQuery(query);
			while(cursor.next()) {
				Fournisseur fournisseur = new Fournisseur(cursor.getInt("id"), cursor.getString("nom"));
				fournisseursList.add(fournisseur);
			}
			cursor.close();
			statement.close();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		} finally {
			if(connection != null)
				try {
					connection.close();
				} catch (Exception e2) {
					System.err.println(e2.getMessage());
				}
		}
		return fournisseursList;
	}
	
	public static void showList() {
		try {
			List<Fournisseur> myList = getAll();
			for(Fournisseur fo: myList) {
				System.out.println("ID : " + fo.getId() + " || Nom : " + fo.getNom());
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}

}
