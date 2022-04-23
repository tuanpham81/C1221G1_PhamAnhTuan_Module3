package repository;

import model.ServiceType;

import java.util.List;

public interface ServiceTypeRepository {
    List<ServiceType> selectAllServiceType();
}
