package datasource.core;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface Extractor <T> {
    T extract (ResultSet rs) throws SQLException;
}
