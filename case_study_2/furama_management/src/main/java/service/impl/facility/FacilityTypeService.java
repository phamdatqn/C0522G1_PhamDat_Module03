package service.impl.facility;

import model.facility.FacilityType;
import repository.i_facility.IFacilityTypeRepository;
import repository.impl.facility.FacilityTypeRepository;
import service.i_facility.IFacilityTypeService;

import java.util.List;

public class FacilityTypeService implements IFacilityTypeService {
    private static IFacilityTypeRepository iFacilityTypeRepository=new FacilityTypeRepository();
    @Override
    public List<FacilityType> findAll() {
        return iFacilityTypeRepository.findAll();
    }
}
