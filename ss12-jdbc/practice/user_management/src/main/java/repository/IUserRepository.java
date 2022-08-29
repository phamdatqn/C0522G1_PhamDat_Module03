package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    List<User> displayAll();

    boolean delete(int id);

    User findById(int id);


    boolean update(int id, User user);


}
