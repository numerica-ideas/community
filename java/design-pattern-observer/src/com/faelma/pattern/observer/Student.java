package com.faelma.pattern.observer;

import java.util.ArrayList;
import java.util.List;

public class Student {
	
	private List<Observer> observers;
	private List<Float> grades;
	private float average;
	
	public Student() {
		observers = new ArrayList<Observer>();
		grades = new ArrayList<Float>();
	}
	
	public void AddGrades(float grade) {
		grades.add(grade);
		notifyAllObservers();
	}
	
	public void setAverage(float average) {
		this.average = average;
	}
	
	public float getAverage() {
		return average;
	}
	
	public List<Float> getGrades() {
		return grades;
	}
	
	public void attach(Observer observer){
		observers.add(observer);
	}
	
	private void notifyAllObservers() {
		for (Observer observer : observers) {
			observer.notify();
		}
	}
}

