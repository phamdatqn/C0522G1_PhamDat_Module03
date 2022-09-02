package service.impl.facility;

import model.customer.Customer;
import model.facility.Facility;
import repository.i_facility.IFacilityRepository;
import repository.impl.facility.FacilityRepository;
import service.i_facility.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    private static IFacilityRepository iFacilityRepository=new FacilityRepository();


    @Override
    public List<Facility> displayAll() {
        return iFacilityRepository.displayAll();
    }

    @Override
    public Facility findById(int id) {
        return iFacilityRepository.findById(id);
    }

    @Override
    public boolean delete(int id) {
        return iFacilityRepository.delete(id);
    }

    @Override
    public boolean update(int id, Facility facility) {
        return iFacilityRepository.update(id,facility);
    }

    @Override
    public void create(Facility facility) {
      iFacilityRepository.create(facility);

    }
}
