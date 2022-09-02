package repository.impl.facility;

import model.facility.FacilityType;
import repository.BaseRepository;
import repository.i_facility.IFacilityTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityTypeRepository implements IFacilityTypeRepository {
    private static String SELECT_ALL_FACILITY_TYPE ="SELECT * FROM facility_type;";
    @Override
    public List<FacilityType> findAll() {
        List<FacilityType> facilityTypeList=new ArrayList<>();
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_ALL_FACILITY_TYPE);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id =resultSet.getInt("id");
                String name=resultSet.getString("name");
                facilityTypeList.add(new FacilityType(id,name));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilityTypeList;
    }
}
