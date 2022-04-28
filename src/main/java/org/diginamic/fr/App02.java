package org.diginamic.fr;

import java.util.List;

import org.diginamic.fr.dao.FournisseurDao;
import org.diginamic.fr.model.Fournisseur;

public class App02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<Fournisseur> myList = FournisseurDao.getAll();
		
		for(Fournisseur fo: myList) {
			System.out.println("ID : " + fo.getId() + ", Nom : " + fo.getNom());
		}

	}

}
