package service.impl.facility;

import model.facility.AttachFacility;
import repository.i_facility.IAttachFacilityRepository;
import repository.impl.facility.AttachFacilityRepository;
import service.i_facility.IActactFacilityService;

import java.util.List;

public class ActactFacilityService implements IActactFacilityService {
    private static IAttachFacilityRepository iActactFacilityRepository=new AttachFacilityRepository();
    @Override
    public List<AttachFacility> displayAll() {
        return iActactFacilityRepository.displayAll();
    }
}
