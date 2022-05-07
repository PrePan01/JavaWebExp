package vo;

public class Users {
    private String username;
    private String password;

    public String getUsername(){
        return this.username;
    }
    public String getPassword(){
        return this.password;
    }

    public void setUsername(String name){
        this.username = name;
    }

    public void setPassword(String pwd){
        this.password = pwd;
    }
}
