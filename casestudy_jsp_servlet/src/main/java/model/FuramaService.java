package model;

public class FuramaService {
    public Integer serviceId;
    public String name;
    public Float area;
    public Float cost;
    public Integer maxPeople;
    public Integer rentTypeId;
    public Integer serviceTypeId;
    public String standard;
    public String otherConvenient;
    public Float poolArea;
    public Integer floorNumber;

    public FuramaService() {
    }

    public FuramaService(Integer serviceId, String name, Float area, Float cost, Integer maxPeople, Integer rentTypeId, Integer serviceTypeId, String standard, String otherConvenient, Float poolArea, Integer floorNumber) {
        this.serviceId = serviceId;
        this.name = name;
        this.area = area;
        this.cost = cost;
        this.maxPeople = maxPeople;
        this.rentTypeId = rentTypeId;
        this.serviceTypeId = serviceTypeId;
        this.standard = standard;
        this.otherConvenient = otherConvenient;
        this.poolArea = poolArea;
        this.floorNumber = floorNumber;
    }

    public Integer getServiceId() {
        return serviceId;
    }

    public void setServiceId(Integer serviceId) {
        this.serviceId = serviceId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Float getArea() {
        return area;
    }

    public void setArea(Float area) {
        this.area = area;
    }

    public Float getCost() {
        return cost;
    }

    public void setCost(Float cost) {
        this.cost = cost;
    }

    public Integer getMaxPeople() {
        return maxPeople;
    }

    public void setMaxPeople(Integer maxPeople) {
        this.maxPeople = maxPeople;
    }

    public Integer getRentTypeId() {
        return rentTypeId;
    }

    public void setRentTypeId(Integer rentTypeId) {
        this.rentTypeId = rentTypeId;
    }

    public Integer getServiceTypeId() {
        return serviceTypeId;
    }

    public void setServiceTypeId(Integer serviceTypeId) {
        this.serviceTypeId = serviceTypeId;
    }

    public String getStandard() {
        return standard;
    }

    public void setStandard(String standard) {
        this.standard = standard;
    }

    public String getOtherConvenient() {
        return otherConvenient;
    }

    public void setOtherConvenient(String otherConvenient) {
        this.otherConvenient = otherConvenient;
    }

    public Float getPoolArea() {
        return poolArea;
    }

    public void setPool_area(Float poolArea) {
        this.poolArea = poolArea;
    }

    public Integer getFloorNumber() {
        return floorNumber;
    }

    public void setFloorNumber(Integer floorNumber) {
        this.floorNumber = floorNumber;
    }
}
