package ru.postgreSQL.postgre.books;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;
import ru.postgreSQL.postgre.books.Publisher;

@Repository
public class PublisherDao {
    private final NamedParameterJdbcTemplate template;
    private final JdbcTemplate templateDDL;

    public PublisherDao(NamedParameterJdbcTemplate template, JdbcTemplate templateDDL) {
        this.template = template;
        this.templateDDL = templateDDL;
    }

    public void queryDDL(String queryDDL) {
        templateDDL.execute(queryDDL);
    }

    public void insertPublisher (Publisher publisher) {
        template.update(
                "INSERT INTO public.publisher (address, org_name) values (:address, :org_name)",
                new MapSqlParameterSource()
                        .addValue("address", publisher.getAddress())
                        .addValue("org_name", publisher.getOrg_name())
        );
    }



}
