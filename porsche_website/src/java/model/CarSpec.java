package model;

public class CarSpec {

    private int id;
    private String horsepower;
    private String engineCapacity;
    private String maxTorque;
    private String acceleration;
    private String maxSpeed;

    public CarSpec() {
    }

    public CarSpec(int id, String horsepower, String engineCapacity, String maxTorque, String acceleration, String maxSpeed) {
        this.id = id;
        this.horsepower = horsepower;
        this.engineCapacity = engineCapacity;
        this.maxTorque = maxTorque;
        this.acceleration = acceleration;
        this.maxSpeed = maxSpeed;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHorsepower() {
        return horsepower;
    }

    public void setHorsepower(String horsepower) {
        this.horsepower = horsepower;
    }

    public String getEngineCapacity() {
        return engineCapacity;
    }

    public void setEngineCapacity(String engineCapacity) {
        this.engineCapacity = engineCapacity;
    }

    public String getMaxTorque() {
        return maxTorque;
    }

    public void setMaxTorque(String maxTorque) {
        this.maxTorque = maxTorque;
    }

    public String getAcceleration() {
        return acceleration;
    }

    public void setAcceleration(String acceleration) {
        this.acceleration = acceleration;
    }

    public String getMaxSpeed() {
        return maxSpeed;
    }

    public void setMaxSpeed(String maxSpeed) {
        this.maxSpeed = maxSpeed;
    }

}
