package model;

public class Login {
    private String username;
    private int userType;
    private String password;

    public Login() {
    }

    public Login(String username, int userType, String password) {
        this.username = username;
        this.userType = userType;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getUserType() {
        return userType;
    }

    public void setUserType(int userType) {
        this.userType = userType;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Login{" +
                "username='" + username + '\'' +
                ", userType='" + userType + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
