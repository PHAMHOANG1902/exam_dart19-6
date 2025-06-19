package model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity // Đánh dấu đây là một thực thể JPA (tương ứng với một bảng trong CSDL)
@Data   // Annotation của Lombok, tự động tạo getter, setter, toString, equals, hashCode
@NoArgsConstructor // Tự động tạo constructor không tham số
@AllArgsConstructor // Tự động tạo constructor có tất cả tham số
public class Place {

    @Id // Đánh dấu đây là khóa chính
    @GeneratedValue(strategy = GenerationType.IDENTITY) // ID sẽ được tự động tăng
    private Long id;

    private String name;
    private String location;
    private String imageUrl;
}

