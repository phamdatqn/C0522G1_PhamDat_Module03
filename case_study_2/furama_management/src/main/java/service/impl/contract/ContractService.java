package service.impl.contract;

import model.contract.Contract;
import repository.i_contract.IContractRepository;
import repository.impl.contract.ContractRepository;
import service.i_contract.IContractService;

import java.util.List;

public class ContractService implements IContractService {
    private static IContractRepository iContractRepository=new ContractRepository();
    @Override
    public List<Contract> displayAll() {
        return iContractRepository.displayAll();
    }

    @Override
    public void create(Contract contract) {
        iContractRepository.create(contract);
    }
}
