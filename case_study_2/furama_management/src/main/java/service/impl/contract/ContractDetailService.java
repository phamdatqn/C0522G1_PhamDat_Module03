package service.impl.contract;

import model.contract.ContractDetail;
import repository.i_contract.IContractDetailRepository;
import repository.impl.contract.ContractDetailRepository;
import service.i_contract.IContractDetailService;

import java.util.List;

public class ContractDetailService implements IContractDetailService {
    private static IContractDetailRepository iContractDetailRepository=new ContractDetailRepository();
    @Override
    public List<ContractDetail> displayAll() {
        return iContractDetailRepository.displayAll();
    }

    @Override
    public void create(ContractDetail contractDetail) {
        iContractDetailRepository.create(contractDetail);

    }
}
