package repository.i_contract;

import model.contract.Contract;
import model.facility.Facility;

import java.util.List;

public interface IContractRepository {
    List<Contract> displayAll();
    void create(Contract contract);
}
