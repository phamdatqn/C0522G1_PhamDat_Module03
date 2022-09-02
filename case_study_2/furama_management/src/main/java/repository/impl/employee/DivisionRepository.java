package repository.impl.employee;

import model.employee.Division;
import repository.BaseRepository;
import repository.i_employee.IDivisionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DivisionRepository implements IDivisionRepository {
    private static String SELECT_ALL_DIVISION = "SELECT * FROM division;";

    @Override
    public List<Division> displayALL() {
        List<Division> divisionList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DIVISION);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                divisionList.add(new Division(id,name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return divisionList;
    }
}
