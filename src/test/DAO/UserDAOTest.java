import org.junit.jupiter.api.*;
import java.sql.*;

import static org.junit.jupiter.api.Assertions.*;

public class UserDaoTest {
    private static Connection connection;
    private UserDao userDao;

    @BeforeAll
    static void setupDatabase() throws SQLException {
        connection = DriverManager.getConnection("jdbc:h2:mem:testdb", "sa", "");
        Statement stmt = connection.createStatement();
        stmt.execute("CREATE TABLE users (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100), email VARCHAR(100), password VARCHAR(255))");
    }

    @BeforeEach
    void setup() {
        userDao = new UserDao(connection);
    }

    @Test
    void testAddUser() throws SQLException {
        boolean result = userDao.addUser("John Doe", "john@example.com", "password123");
        assertTrue(result, "User should be added successfully");
    }

    @Test
    void testUserExists() throws SQLException {
        userDao.addUser("Jane Doe", "jane@example.com", "password456");
        assertTrue(userDao.userExists("jane@example.com"), "User should exist in the database");
        assertFalse(userDao.userExists("nonexistent@example.com"), "User should not exist in the database");
    }

    @AfterAll
    static void tearDown() throws SQLException {
        connection.close();
    }
}
