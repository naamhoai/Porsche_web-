package model;

public class CarSpec {

    private String engineCapacity;
    private String maxTorque;
    private String acceleration;
    private String maxSpeed;

    public CarSpec() {
    }
    
    public CarSpec(String engineCapacity, String maxTorque, String acceleration, String maxSpeed) {
        this.engineCapacity = engineCapacity;
        this.maxTorque = maxTorque;
        this.acceleration = acceleration;
        this.maxSpeed = maxSpeed;
    }

    public String getEngineCapacity() {
        return engineCapacity;
    }

    public String getMaxTorque() {
        return maxTorque;
    }

    public String getAcceleration() {
        return acceleration;
    }

    public String getMaxSpeed() {
        return maxSpeed;
    }

    public void setEngineCapacity(String engineCapacity) {
        this.engineCapacity = engineCapacity;
    }

    public void setMaxTorque(String maxTorque) {
        this.maxTorque = maxTorque;
    }

    public void setAcceleration(String acceleration) {
        this.acceleration = acceleration;
    }

    public void setMaxSpeed(String maxSpeed) {
        this.maxSpeed = maxSpeed;
    }

}
