package service;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface UserService {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    public List<User> searchUserByCountry(String country);

    public List<User> sortUserByName();

    User getUserById(int id);

    void insertUserStore(User user) throws SQLException;

    void addUserTransaction(User user, int[] permisions);

    public void insertUpdateWithoutTransaction();

    public void insertUpdateUseTransaction();

    void testUseTran();

    List<User> showAllUserStore();

    void editUserStore(int id, String name, String email, String country);

    void deleteUserStore(int id);
}
