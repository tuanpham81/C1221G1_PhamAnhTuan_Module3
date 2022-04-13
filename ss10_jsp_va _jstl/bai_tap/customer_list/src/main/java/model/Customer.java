package model;

public class Customer {
    private Integer id;
    private String name;
    private String birthday;
    private String address;
    private String photo;

    public Customer() {
    }

    public Customer(Integer id, String name, String birthday, String address, String photo) {
        this.id = id;
        this.name = name;
        this.birthday = birthday;
        this.address = address;
        this.photo = photo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }
}

