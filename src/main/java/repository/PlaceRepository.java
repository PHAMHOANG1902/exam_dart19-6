package repository;

import model.Place;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository // Đánh dấu đây là một Spring Bean cho tầng Repository
public interface PlaceRepository extends JpaRepository<Place, Long> {
    // JpaRepository đã cung cấp sẵn các phương thức CRUD cơ bản
    // như findAll(), findById(), save(), delete()...
    // Chúng ta không cần viết thêm gì ở đây cho yêu cầu này.
}
