package util;

import javax.servlet.http.Cookie;
import java.sql.*;

public class JdbcConn {
    public static Connection getConn(){
        String db = "jdbc:mysql://127.0.0.1:3306/exp";
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(db, "root", "123456");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static Statement getStmt() throws SQLException {
        Connection conn = getConn();
        Statement stmt = conn.createStatement();
        return stmt;
    }

    public static PreparedStatement getPreStmt(String sql) throws SQLException {
        Connection conn = getConn();
        PreparedStatement preStmt = conn.prepareStatement(sql);
        return preStmt;
    }
}
