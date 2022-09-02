package repository.impl.facility;

import model.customer.Customer;
import model.facility.Facility;
import model.facility.FacilityType;
import repository.BaseRepository;
import repository.i_facility.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    private static String SELECT_ALL_FACILITY = "SELECT * FROM facility where is_delete=0;";
    private static String SELECT_FACILITY_BY_ID ="select * from facility where is_delete=0 and id=?;";
    private static String DELETE_FACILITY_BY_ID="update facility set is_delete=1 where id=? and is_delete=0;";
    private static  String UPDATE_FACILITY_SQL = "update facility set name=?,area=?,cost=?,max_people=?,rent_type_id=?,facility_type_id=?," +
            "standard_room=?,description_other_convenience=?, pool_area=?, number_of_floors=?, facility_free=? where id=? and is_delete=0;";
    private  static String INSERT_FACILITY ="insert into facility(name,area,cost,max_people,rent_type_id,facility_type_id,standard_room,description_other_convenience,pool_area,number_of_floors,facility_free) value(?,?,?,?,?,?,?,?,?,?,?);";
    @Override
    public List<Facility> displayAll() {
        List<Facility> facilityList=new ArrayList<>();
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_ALL_FACILITY);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name");
                int area=resultSet.getInt("area");
                double cost=resultSet.getDouble("cost");
                int maxPeopel=resultSet.getInt("max_people");
                int rentTypeId=resultSet.getInt("rent_type_id");
                int facilityTypeId=resultSet.getInt("facility_type_id");
                String standardRoom=resultSet.getString("standard_room");
                String descriptionOtherConvenience=resultSet.getString("description_other_convenience");
                double poolArea=resultSet.getDouble("pool_area");
                int number_of_floors=resultSet.getInt("number_of_floors");
                String facilityFree=resultSet.getString("facility_free");
                facilityList.add(new Facility(id,name,area,cost,maxPeopel,rentTypeId,facilityTypeId,
                        standardRoom,descriptionOtherConvenience,poolArea,number_of_floors,facilityFree));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilityList;
    }

    @Override
    public Facility findById(int id) {
        Facility facility=null;
        Connection connection=BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_FACILITY_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet=preparedStatement.executeQuery();
            if (resultSet.next()){
                String name=resultSet.getString("name");
                int area=resultSet.getInt("area");
                double cost=resultSet.getDouble("cost");
                int maxPeopel=resultSet.getInt("max_people");
                int rentTypeId=resultSet.getInt("rent_type_id");
                int facilityTypeId=resultSet.getInt("facility_type_id");
                String standardRoom=resultSet.getString("standard_room");
                String descriptionOtherConvenience=resultSet.getString("description_other_convenience");
                double poolArea=resultSet.getDouble("pool_area");
                int number_of_floors=resultSet.getInt("number_of_floors");
                String facilityFree=resultSet.getString("facility_free");
                facility=new Facility(id,name,area,cost,maxPeopel,rentTypeId,facilityTypeId,standardRoom,descriptionOtherConvenience,
                        poolArea,number_of_floors,facilityFree);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return facility;
    }

    @Override
    public boolean delete(int id) {
       boolean rowDelete=false;
       Connection connection=BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement =connection.prepareStatement(DELETE_FACILITY_BY_ID);
            preparedStatement.setInt(1,id);
            rowDelete=preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDelete;
    }

    @Override
    public boolean update(int id, Facility facility) {
        boolean rowUpdated = false;
        Connection connection = BaseRepository.getConnectDB();
        try (
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_FACILITY_SQL)) {
            preparedStatement.setString(1, facility.getName());
            preparedStatement.setInt(2, facility.getArea());
            preparedStatement.setDouble(3, facility.getCost());
            preparedStatement.setInt(4, facility.getMaxPeople());
            preparedStatement.setInt(5, facility.getRentTypeId());
            preparedStatement.setInt(6, facility.getFacilityTypeId());
            preparedStatement.setString(7, facility.getStandardRoom());
            preparedStatement.setString(8, facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(9, facility.getPoolArea());
            preparedStatement.setInt(10, facility.getNumberOfFloors());
            preparedStatement.setString(11, facility.getFacilityFree());
            preparedStatement.setInt(12, facility.getId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowUpdated;
    }

    @Override
    public void create(Facility facility) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_FACILITY);
            preparedStatement.setString(1, facility.getName());
            preparedStatement.setInt(2, facility.getArea());
            preparedStatement.setDouble(3, facility.getCost());
            preparedStatement.setInt(4, facility.getMaxPeople());
            preparedStatement.setInt(5, facility.getRentTypeId());
            preparedStatement.setInt(6, facility.getFacilityTypeId());
            preparedStatement.setString(7, facility.getStandardRoom());
            preparedStatement.setString(8, facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(9, facility.getPoolArea());
            preparedStatement.setInt(10, facility.getNumberOfFloors());
            preparedStatement.setString(11, facility.getFacilityFree());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
