package model;

public class Customer extends Person{
    private String customerId;
    private Integer customerType;
    private String address;

    public Customer() {
    }

    public Customer(String name, String birthday, Integer gender, Integer idNumber, String phoneNumber, String email, String customerId, Integer customerType, String address) {
        super(name, birthday, gender, idNumber, phoneNumber, email);
        this.customerId = customerId;
        this.customerType = customerType;
        this.address = address;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public Integer getCustomerType() {
        return customerType;
    }

    public void setCustomerType(Integer customerType) {
        this.customerType = customerType;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}

