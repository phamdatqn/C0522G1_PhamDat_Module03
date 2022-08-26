package service;

import model.Student;

import java.util.List;

public interface IStudentService {
    List<Student> findByAll();
    boolean add(Student student);
}
