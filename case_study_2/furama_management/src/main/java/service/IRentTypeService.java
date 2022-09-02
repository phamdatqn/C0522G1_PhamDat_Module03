package service;

import model.RentType;
import model.facility.FacilityType;

import java.util.List;

public interface IRentTypeService {
    List<RentType> findAll();
}
