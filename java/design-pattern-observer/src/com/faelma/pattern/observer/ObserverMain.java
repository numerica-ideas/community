package com.faelma.pattern.observer;

public class ObserverMain {

    public static void main(String[] args) {
		
		Eleve eleve = new Eleve();
		
		new NotesObserver(eleve);
		
		eleve.ajouterNote(15.0f);
		System.out.println(eleve.getMoyenne());
		eleve.ajouterNote(5.0f);
		System.out.println(eleve.getMoyenne());
		eleve.ajouterNote(13.0f);
		System.out.println(eleve.getMoyenne());
		
	}
}
