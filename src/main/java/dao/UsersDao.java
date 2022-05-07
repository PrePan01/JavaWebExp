package dao;

import util.JdbcConn;
import vo.Users;

import java.sql.*;

public class UsersDao {
    public boolean login(String name, String pwd) throws SQLException {
        Users user = new Users();
        Statement stmt = JdbcConn.getStmt();
        ResultSet result = stmt.executeQuery("SELECT * FROM users");
        while (result.next()){
            user.setUsername(result.getString("username"));
            user.setPassword(result.getString("password"));
            if(name.equals(user.getUsername()) && pwd.equals(user.getPassword())){
                return true;
            }
        }
        return false;
    }

    public boolean register(String name, String pwd) throws SQLException {
        Users user = new Users();
        user.setUsername(name);
        user.setPassword(pwd);
        String sql = "INSERT INTO users VALUES(?,?)";
        PreparedStatement preStmt = JdbcConn.getPreStmt(sql);
        preStmt.setString(1, user.getUsername());
        preStmt.setString(2, user.getPassword());
        Integer result = preStmt.executeUpdate();
        if(result == 1){
            return true;
        }
        return false;
    }
}
