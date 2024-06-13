package com.faelma.pattern.observer;

public class ObserverMain {

    public static void main(String[] args) {
		
		Student student = new Student();
		
		new GradesObserver(student);
		
		student.addGrades(15.0f);
		System.out.println(student.getAverage());
		student.addGrades(5.0f);
		System.out.println(student.getAverage());
		student.addGrades(13.0f);
		System.out.println(student.getAverage());
		
	}
}
