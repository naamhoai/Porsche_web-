/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;
import model.Cart;
import model.Product;

/**
 *
 * @author Admin
 */
public class ProductDAO extends DBContext {

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from products";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setCategory(rs.getString("category"));
                p.setPrice(rs.getDouble("price"));
                p.setStock(rs.getInt("stock"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public List<Product> getProducts1Category() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * \n"
                + "FROM products p\n"
                + "WHERE id = (\n"
                + "    SELECT MIN(id) \n"
                + "    FROM products \n"
                + "    WHERE category= p.category\n"
                + ");";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setCategory(rs.getString("category"));
                p.setPrice(rs.getDouble("price"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public Product getSingleProduct(int id) {
        Product p = null;
        try {
            String sql = "select * from products where id=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setCategory(rs.getString("category"));
                p.setPrice(rs.getDouble("price"));
                p.setStock(rs.getInt("stock"));
                p.setImage(rs.getString("image"));
            }
        } catch (SQLException e) {
        }
        return p;
    }

    public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;

        try {
            if (!cartList.isEmpty()) {
                for (Cart item : cartList) {
                    String sql = "select price from products where id=?";
                    PreparedStatement st = connection.prepareStatement(sql);
                    st.setInt(1, item.getId());
                    ResultSet rs = st.executeQuery();
                    while (rs.next()) {
                        sum += rs.getDouble("price") * item.getQuantity();
                    }
                }
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return sum;
    }

    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        List<Cart> book = new ArrayList<>();
        String sql = "select * from products where id=?";
        try {
            if (!cartList.isEmpty()) {
                for (Cart item : cartList) {
                    PreparedStatement st = connection.prepareStatement(sql);
                    st.setInt(1, item.getId());
                    ResultSet rs = st.executeQuery();
                    while (rs.next()) {
                        Cart row = new Cart();
                        row.setId(rs.getInt("id"));
                        row.setName(rs.getString("name"));
                        row.setDescription(rs.getString("description"));
                        row.setCategory(rs.getString("category"));
                        row.setPrice(rs.getDouble("price") * item.getQuantity());
                        row.setStock(rs.getInt("stock"));
                        row.setImage(rs.getString("image"));
                        row.setQuantity(item.getQuantity());
                        book.add(row);
                    }

                }
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return book;
    }

    public List<Product> get3ProductsByCategory(String name, int id) {
        List<Product> list = new ArrayList<>();
        List<Integer> randomIDs = rand3ID(id);
        String sql = "SELECT * FROM products WHERE id IN (?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, randomIDs.get(0));
            st.setInt(2, randomIDs.get(1));
                st.setInt(3, randomIDs.get(2));
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("category"),
                        rs.getDouble("price"),
                        rs.getInt("stock"),
                        rs.getString("image")
                ));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public int getTotalProducts() {
        String sql = "select count(*) from products";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public void addProduct(Product product) {
        try {
            String sql = "INSERT INTO products (name, description, category, price, stock, image) values(?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, product.getName());
            st.setString(2, product.getDescription());
            st.setString(3, product.getCategory());
            st.setDouble(4, product.getPrice());
            st.setInt(5, product.getStock());
            st.setString(6, product.getImage());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateProduct(Product c) {
        String sql = "update products set name=?, description=?, category=?, price=?, stock=?, image=? where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getName());
            st.setString(2, c.getDescription());
            st.setString(3, c.getCategory());
            st.setDouble(4, c.getPrice());
            st.setInt(5, c.getStock());
            st.setString(6, c.getImage());
            st.setInt(7, c.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void delete(int id) {
        String sql = "delete from products where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<String> getCategories() {
        List<String> list = new ArrayList<>();
        try {
            String sql = "select distinct category from products";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("category"));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> pagingProducts(int index) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from products\n"
                + "order by id\n"
                + "offset ? rows fetch next 6 rows only;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 6);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("category"),
                        rs.getDouble("price"),
                        rs.getInt("stock"),
                        rs.getString("image")
                ));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public List<Product> getProductsByCategory(String name, int index) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from products\n"
                + "where category like ?\n"
                + "order by id\n"
                + "offset ? rows fetch next 6 rows only;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            st.setInt(2, (index - 1) * 6);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("category"),
                        rs.getDouble("price"),
                        rs.getInt("stock"),
                        rs.getString("image")
                ));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public int getTotalProductsByCategory(String category) {
        String sql = "select count(*) from products where category like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + category + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public List<Product> getProductsByPrice(int index) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from products order by price asc offset ? rows fetch next 6 rows only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 6);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("category"),
                        rs.getDouble("price"),
                        rs.getInt("stock"),
                        rs.getString("image")
                ));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public List<Product> get4Products() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 4 * from products order by price desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setCategory(rs.getString("category"));
                p.setPrice(rs.getDouble("price"));
                p.setStock(rs.getInt("stock"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public List<Product> getProductsByName(String name, int index) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from products\n"
                + "where name like ?\n"
                + "order by id\n"
                + "offset ? rows fetch next 6 rows only;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            st.setInt(2, (index - 1) * 6);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("category"),
                        rs.getDouble("price"),
                        rs.getInt("stock"),
                        rs.getString("image")
                ));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public int getTotalProductsByName(String name) {
        String sql = "select count(*) from products where name like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public Product getCarById(int id) {
        Product product = null;
        try {
            String query = "SELECT * FROM products WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(query); // Sửa 'con' thành 'connection'
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                product = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("category"),
                        rs.getDouble("price"),
                        rs.getInt("stock"),
                        rs.getString("image")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

    public List<Integer> rand3ID(int excludedID) {
        List<Integer> randomIDs = new ArrayList<>();
        String getMaxID = "SELECT MAX(product_id) FROM CarSpec";
        int maxID = 0;

        try {
            PreparedStatement m = connection.prepareStatement(getMaxID);
            ResultSet max = m.executeQuery();

            if (max.next()) {
                maxID = max.getInt(1); // Lấy giá trị MAX(product_id)
            }

            max.close();
            m.close();

            if (maxID <= 1) {
                return randomIDs; // Không có đủ ID để chọn
            }
            Random random = new Random();
            Set<Integer> uniqueNumbers = new HashSet<>();

            while (uniqueNumbers.size() < 3) {
                int randomNumber = random.nextInt(maxID) + 1; // Random từ 1 đến maxID
                if (randomNumber != excludedID) {
                    uniqueNumbers.add(randomNumber);
                }
            }
            randomIDs.addAll(uniqueNumbers);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return randomIDs;
    }
}
