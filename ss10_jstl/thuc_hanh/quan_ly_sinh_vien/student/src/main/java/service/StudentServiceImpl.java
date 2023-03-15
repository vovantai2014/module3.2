package service;

import bean.Student;
import repository.StudentRepository;
import repository.StudentRepositoryImpl;

import java.util.List;

public class StudentServiceImpl implements StudentService{
    private StudentRepository studentRepository = new StudentRepositoryImpl();

    @Override
    public void create(Student student) {
    studentRepository.create(student);
    }

    @Override
    public void delete(String id) {

    }

    @Override
    public void update(Student student) {

    }

    @Override
    public List<Student> findAll() {
        return studentRepository.findAll();
    }

    @Override
    public Student findById(String id) {
        return studentRepository.findById(id);
    }
}
