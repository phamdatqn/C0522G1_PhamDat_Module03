package repository.i_facility;

import model.customer.Customer;
import model.facility.Facility;

import java.util.List;

public interface IFacilityRepository {
    List<Facility> displayAll();

    Facility findById(int id);

    boolean delete(int id);

    boolean update(int id, Facility facility);

    void create(Facility facility);

}
