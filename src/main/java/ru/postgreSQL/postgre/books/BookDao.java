package ru.postgreSQL.postgre.books;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;
import ru.postgreSQL.postgre.books.Book;

@Repository
public class BookDao {
    private final NamedParameterJdbcTemplate template;
    private final JdbcTemplate templateDDL;

    public BookDao(NamedParameterJdbcTemplate template, JdbcTemplate templateDDL) {
        this.template = template;
        this.templateDDL = templateDDL;
    }

    public void queryDDL(String queryDDL) {
        templateDDL.execute(queryDDL);
    }

    public void insertBook (Book book) {
        template.update(
                "INSERT INTO public.book (title, isbn, publisher_id) values (:title, :isbn, :publisher_id)",
                new MapSqlParameterSource()
                        .addValue("title", book.getTitle())
                        .addValue("isbn", book.getIsbn())
                        .addValue("publisher_id", book.getPublisher_id())
        );
    }




}
