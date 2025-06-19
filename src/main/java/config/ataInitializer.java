package config;

import model.Place;
import repository.PlaceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import java.util.Arrays;

/**
 * Lớp này dùng để khởi tạo dữ liệu mẫu cho ứng dụng khi khởi động.
 * Nó sẽ chạy một lần sau khi ứng dụng Spring Boot đã sẵn sàng.
 */
@Component
class DataInitializer implements CommandLineRunner {

    @Autowired
    private PlaceRepository placeRepository;

    @Override
    public void run(String... args) throws Exception {
        // Xóa dữ liệu cũ để tránh trùng lặp khi khởi động lại server
        placeRepository.deleteAll();

        // Tạo và lưu một số địa điểm mẫu vào cơ sở dữ liệu H2
        Place haLong = new Place(null, "Vịnh Hạ Long", "Quảng Ninh", "https://images.unsplash.com/photo-1548943152-4c782e74a6a4?q=80&w=2070&auto=format&fit=crop");
        Place hoiAn = new Place(null, "Phố cổ Hội An", "Quảng Nam", "https://images.unsplash.com/photo-1579546953835-613d5b24d775?q=80&w=1974&auto=format&fit=crop");
        Place phuQuoc = new Place(null, "Phú Quốc", "Kiên Giang", "https://images.unsplash.com/photo-1587979270116-4e5a953a795b?q=80&w=1935&auto=format&fit=crop");
        Place daNang = new Place(null, "Cầu Vàng", "Đà Nẵng", "https://images.unsplash.com/photo-1588666303893-16a74b04b62f?q=80&w=2070&auto=format&fit=crop");
        Place sapa = new Place(null, "Sa Pa", "Lào Cai", "https://images.unsplash.com/photo-1582216294789-9154a4a1593c?q=80&w=1935&auto=format&fit=crop");

        placeRepository.saveAll(Arrays.asList(haLong, hoiAn, phuQuoc, daNang, sapa));
    }
}

