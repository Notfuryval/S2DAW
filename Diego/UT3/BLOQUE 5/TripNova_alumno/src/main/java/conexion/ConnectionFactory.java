package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class ConnectionFactory {
    private static final String URL = env("DB_URL", "jdbc:oracle:thin:@localhost:1521/XEPDB1");
    private static final String USER = env("DB_USER", "dwes");
    private static final String PASSWORD = env("DB_PASSWORD", "dwes");

    private ConnectionFactory() {}

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    private static String env(String name, String fallback) {
        String value = System.getenv(name);
        return value == null || value.isBlank() ? fallback : value;
    }
}
