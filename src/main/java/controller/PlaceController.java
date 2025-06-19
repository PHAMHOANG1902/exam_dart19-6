package controller;


import model.Place;
import service.PlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

/**
 * Controller để quản lý các yêu cầu HTTP liên quan đến Địa điểm (Place).
 */
@RestController
@RequestMapping("/api/v1/places")
// Cho phép yêu cầu từ mọi nguồn (cần thiết cho việc phát triển với Flutter)
@CrossOrigin(origins = "*")
public class PlaceController {

    @Autowired
    private PlaceService placeService;

    /**
     * API endpoint để lấy tất cả các địa điểm.
     * @return một danh sách các địa điểm và mã trạng thái HTTP 200 (OK).
     */
    @GetMapping
    public ResponseEntity<List<Place>> getAllPlace() {
        List<Place> places = placeService.getAllPlaces();
        return ResponseEntity.ok(places);
    }
}
