package repository;

import bean.Student;

import java.util.*;

public class StudentRepositoryImpl implements StudentRepository {
    private static Map<String, Student> studentMap;

    static {
//        studentMap = new HashMap<>();
        studentMap = new LinkedHashMap<>();
        studentMap.put("SV001", new Student("SV001", "Nguyen Van An", 1, "Da Nang", 7.5f));
        studentMap.put("SV002", new Student("SV002", "Tran Anh Luan", 1, "Quang Nam", 6.0f));
        studentMap.put("SV003", new Student("SV003", "Nguyen Thi Binh", 0, "Thua Thien Hue", 5.0f));
        studentMap.put("SV004", new Student("SV004", "Le Thi Minh", 0, "Quang Tri", 9.0f));
        studentMap.put("SV005", new Student("SV005", "Phan Van Sinh", 1, "Quang Nam", 4.5f));
        studentMap.put("SV006", new Student("SV006", "Tran Quang Minh", 1, "Quang Nam", 5.5f));
        studentMap.put("SV007", new Student("SV007", "Phan Thi Trinh", 0, "Ho Chi Minh", 8.0f));
        studentMap.put("SV008", new Student("SV008", "Tran Hai Trieu", 1, "Quang Binh", 7.0f));
        studentMap.put("SV009", new Student("SV009", "Ong Ich Khiem", 1, "Quang Nam", 5.5f));
        studentMap.put("SV010", new Student("SV010", "Tran Dinh Phong", 1, "Da Nang", 6.5f));
        studentMap.put("SV011", new Student("SV011", "Nguyen Thi Uyen", 0, "Quang Nam", 3.5f));
    }

    @Override
    public void create(Student student) {
        if (!studentMap.containsKey(student.getId())) {
            studentMap.put(student.getId(), student);
        }

    }

    @Override
    public void delete(String id) {
        studentMap.remove(id);

    }

    @Override
    public void update(Student student) {
        if (studentMap.containsKey(student.getId())) {
            studentMap.put(student.getId(), student);
        }

    }

    @Override
    public List<Student> findAll() {
        return new ArrayList<>(studentMap.values());
    }

    @Override
    public Student findById(String id) {
        return studentMap.get(id);
    }
}
