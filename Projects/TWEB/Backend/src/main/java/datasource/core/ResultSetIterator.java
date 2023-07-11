package datasource.core;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.Spliterators;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

public class ResultSetIterator<T> implements Iterator<T>, AutoCloseable  {

    private final ResultSet resultSet;
    private final Extractor<T> extractor;

    public ResultSetIterator(ResultSet resultSet, Extractor<T> extractor) {
        this.resultSet = resultSet;
        this.extractor = extractor;
    }

    @Override
    public void close() {
        try {
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean hasNext() {
        try {
            return resultSet.next();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public T next() {
        try {
            return extractor.extract(resultSet);
        } catch(Exception e) {
            throw new RuntimeException(e);
        }
    }

    static <T> Stream<T> stream(final ResultSet resultSet, final Extractor<T> extractor) {
        ResultSetIterator<T> iterator = new ResultSetIterator<>(resultSet, extractor);
        return StreamSupport.stream(Spliterators.spliteratorUnknownSize(iterator, 0), false).onClose(iterator::close);
    }
}
