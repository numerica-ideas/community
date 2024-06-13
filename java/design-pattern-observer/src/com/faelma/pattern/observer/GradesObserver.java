package com.faelma.pattern.observer;

public class GradesObserver extends Observer{
    private Student student;

       
    public GradesObserver(Student student){
            this.student = student;
            this.student.attach(this);
        }
    
        @Override
        public void notify() {
            
            float average = 0;
            
            for(float grade : student.getGrades()) {
                average += grade;
            }
            
            average /= student.getGrades().size();
            
            student.setAverage(average);
        }
    
    
}
