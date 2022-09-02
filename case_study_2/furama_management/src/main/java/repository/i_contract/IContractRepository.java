package repository.i_contract;

import model.contract.Contract;

import java.util.List;

public interface IContractRepository {
    List<Contract> displayAll();
}
