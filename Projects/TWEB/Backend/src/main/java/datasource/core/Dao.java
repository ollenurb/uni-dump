package datasource.core;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.stream.Stream;

public interface Dao {
    Connection getConnection() throws SQLException;

    default <T> Stream<T> query(String sql, Extractor<T> extractor) throws SQLException {
        Connection c = getConnection();
        Statement s = c.createStatement();
        ResultSet rs = s.executeQuery(sql);
        return ResultSetIterator.stream(rs, extractor).onClose(() -> {
            try {
                c.close();
                s.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        });
    }

    default int update(String sql) throws SQLException {
        int affectedRows;
        try(Connection c = getConnection();
            Statement s = c.createStatement()) {
            c.setAutoCommit(false);
            affectedRows = s.executeUpdate(sql);
            c.commit();
        }
        return affectedRows;
    }

}
