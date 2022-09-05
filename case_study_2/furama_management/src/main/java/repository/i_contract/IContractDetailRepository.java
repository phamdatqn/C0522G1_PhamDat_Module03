package repository.i_contract;

import model.contract.Contract;
import model.contract.ContractDetail;

import java.util.List;

public interface IContractDetailRepository {
    List<ContractDetail> displayAll();
    void create(ContractDetail contractDetail);
}
