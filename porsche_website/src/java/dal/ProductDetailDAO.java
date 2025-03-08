package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.CarSpec;

public class ProductDetailDAO extends DBContext {

    public CarSpec getProductDetail(int id) {
        CarSpec p = null;
        try {
            String sql = "SELECT engine_capacity, max_torque, acceleration, max_speed FROM CarSpec WHERE product_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                p = new CarSpec();
                p.setEngineCapacity( rs.getString("engine_capacity"));
                p.setMaxTorque(rs.getString("max_torque"));
                p.setAcceleration(rs.getString("acceleration"));
                p.setMaxSpeed(rs.getString("max_speed"));
            }
        } catch (SQLException e) {
        }
        return p;
    }

}
