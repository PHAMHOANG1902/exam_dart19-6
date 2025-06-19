package com.sis.travelapi.controller;


import com.sis.travelapi.model.Place;
import com.sis.travelapi.service.PlaceService;
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
@RequestMapping("/api/places")
@CrossOrigin(origins = "*")
public class PlaceController {

    @Autowired
    private PlaceService placeService;

    @GetMapping
    public ResponseEntity<List<Place>> getAllPlace() {
        List<Place> places = placeService.getAllPlaces();
        return ResponseEntity.ok(places);
    }
}