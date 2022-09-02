package repository.impl.employee;

import model.employee.Position;
import repository.BaseRepository;
import repository.i_employee.IPositionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepository implements IPositionRepository {
    private static String SELECT_ALL_POSITION ="SELECT * FROM position;";
    @Override
    public List<Position> displayAll() {
        List<Position>positionList=new ArrayList<>();
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_ALL_POSITION);
            ResultSet resultSet= preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name");
                positionList.add(new Position(id,name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return positionList;
    }
}
