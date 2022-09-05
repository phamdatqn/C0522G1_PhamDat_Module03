package service.i_contract;

import model.contract.Contract;
import model.contract.ContractDetail;

import java.util.List;

public interface IContractDetailService {
    List<ContractDetail> displayAll();
    void create(ContractDetail contractDetail);
}
