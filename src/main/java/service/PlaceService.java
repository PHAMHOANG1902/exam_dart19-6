package service;

import model.Place;
import repository.PlaceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

/**
 * Lớp Service xử lý logic nghiệp vụ cho Place.
 */
@Service
public class PlaceService {

    @Autowired // Spring sẽ tự động tiêm (inject) một đối tượng PlaceRepository vào đây
    private PlaceRepository placeRepository;

    /**
     * Lấy tất cả các địa điểm từ cơ sở dữ liệu.
     * @return Một danh sách các đối tượng Place.
     */
    public List<Place> getAllPlaces() {
        return placeRepository.findAll();
    }
}
