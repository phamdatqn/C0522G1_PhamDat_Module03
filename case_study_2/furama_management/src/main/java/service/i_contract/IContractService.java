package service.i_contract;

import model.contract.Contract;

import java.util.List;

public interface IContractService {
    List<Contract> displayAll();
    void create(Contract contract);
}
