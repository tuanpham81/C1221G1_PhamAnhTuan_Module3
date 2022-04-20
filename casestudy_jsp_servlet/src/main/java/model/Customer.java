package model;

public class Customer extends Person {
    private String customerId;
    private int customerType;
    private String address;

    public Customer() {
    }

    public Customer(String name, String birthday, int gender, int idNumber, String phoneNumber, String email, String customerId, int customerType, String address) {
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

    public int getCustomerType() {
        return customerType;
    }

    public void setCustomerType(int customerType) {
        this.customerType = customerType;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}
