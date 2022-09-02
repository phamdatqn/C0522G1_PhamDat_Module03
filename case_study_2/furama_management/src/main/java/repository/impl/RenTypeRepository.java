package repository.impl;

import model.RentType;
import model.facility.FacilityType;
import repository.BaseRepository;
import repository.IRentTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RenTypeRepository implements IRentTypeRepository {
    private static String SELECT_RENT_TYPE ="SELECT * FROM rent_type where is_delete=0;";
    @Override
    public List<RentType> findAll() {
        List<RentType> rentTypeList=new ArrayList<>();
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_RENT_TYPE);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name");
                rentTypeList.add(new RentType(id,name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rentTypeList;
    }
}
