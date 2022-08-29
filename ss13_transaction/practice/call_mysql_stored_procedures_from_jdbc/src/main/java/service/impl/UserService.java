package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private static IUserRepository iUserRepository = new UserRepository();

    @Override
    public List<User> displayAll() {
        return iUserRepository.displayAll();
    }

    @Override
    public boolean delete(int id) {
        return iUserRepository.delete(id);
    }

    @Override
    public User findById(int id) {
        return iUserRepository.findById(id);
    }

    @Override
    public List<User> findCountry(String name) {
        return iUserRepository.findCountry(name);
    }

    @Override
    public boolean update(int id, User user) {
        return iUserRepository.update(id, user);
    }

    @Override
    public void create(User user) {
        iUserRepository.create(user);
    }

    @Override
    public List<User> sortIncrease() {
        return iUserRepository.sortIncrease();
    }

    @Override
    public User getUserById(int id) {
        return iUserRepository.getUserById(id);
    }

    @Override
    public void insertUser(User user) {
        iUserRepository.insertUser(user);
    }

    @Override
    public void addUserTransaction(User user, int[] permission) {
        iUserRepository.addUserTransaction(user,permission);
    }
}
