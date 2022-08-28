package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    List<User> displayAll();

    boolean delete(int id);

    User findById(int id);

    List<User> findCountry(String name);

    boolean update(int id, User user);

    void create(User user);

    List<User> sortIncrease();
}
