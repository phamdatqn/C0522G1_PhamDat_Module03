package service.impl;

import model.RentType;
import repository.IRentTypeRepository;
import repository.impl.RenTypeRepository;
import service.IRentTypeService;

import java.util.List;

public class RentTypeService implements IRentTypeService {
    private static IRentTypeRepository iRentTypeRepository = new RenTypeRepository();

    @Override
    public List<RentType> findAll() {
        return iRentTypeRepository.findAll();
    }
}
