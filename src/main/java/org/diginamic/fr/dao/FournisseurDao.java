package org.diginamic.fr.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.diginamic.fr.TestConnexionJdbc;
import org.diginamic.fr.model.Fournisseur;

/**
 * Permet de 
 * - lire en JDBC la table fournisseur
 * - avoir les méthodes CRUD
 * - obtenir des objets de type Fournisseur
 * 
 * @author ajonathan
 *
 */

public class FournisseurDao {
	
	/**
	 * Retourne la liste des fournisseurs de la BDD
	 * @return
	 */
	public static List<Fournisseur> getAll() {
		Connection connection = null;
		List<Fournisseur> fournisseursList = new ArrayList<Fournisseur>();
		try {
			connection = TestConnexionJdbc.getConnection();
			Statement statement = connection.createStatement();
			
			ResultSet cursor = statement.executeQuery("SELECT id, nom FROM fournisseur");
			while(cursor.next()) {
				/**
				 * Je veux :
				 * - Récupérer colonnes ID et Nom
				 * - Les stocker dans objet type Fournisseur
				 * - Les mettre dans la liste
				 */
				Fournisseur fo = new Fournisseur(cursor.getInt("id"), cursor.getString("nom"));
				fournisseursList.add(fo);
			}
			/**
			 * Je ferme dans l'ordre cursor puis statement
			 */
			cursor.close();
			statement.close();
		} catch (Exception e) {
			System.err.println(e.getMessage());	
		} finally {
			if(connection != null)
				try {
					connection.close();
				} catch (SQLException e) {
					System.err.println(e.getMessage());
				}
		}
		return fournisseursList;
	}

}
