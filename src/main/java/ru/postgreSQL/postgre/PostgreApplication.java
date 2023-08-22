package ru.postgreSQL.postgre;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import ru.postgreSQL.postgre.books.BookDao;
import ru.postgreSQL.postgre.books.PublisherDao;
import ru.postgreSQL.postgre.northwind.PostgreLocalConnect;

import java.sql.Connection;
import java.sql.SQLException;

@SpringBootApplication
public class PostgreApplication {

    public static void main(String[] args) {
        ConfigurableApplicationContext context = SpringApplication.run(PostgreApplication.class, args);
        BookDao bookDao = context.getBean((BookDao.class));
        PublisherDao publisherDao = context.getBean((PublisherDao.class));

//        try {
//            Connection connection = PostgreLocalConnect.getPostgreLocalConnection();
//            Resource resource = context.getResource("northwind.sql");
//            ResourceDatabasePopulator populator = new ResourceDatabasePopulator();
//            populator.addScript(resource);
//            populator.populate(connection);
//        } catch (SQLException | ClassNotFoundException e) {
//            throw new RuntimeException(e);
//        }

//        bookDao.queryDDL("DROP TABLE IF EXISTS public.book CASCADE");
//        bookDao.queryDDL("ALTER TABLE public.book RENAME COLUMN reting TO rating");
        bookDao.queryDDL("ALTER TABLE public.book DROP COLUMN purchase_amount");
//        bookDao.queryDDL("ALTER TABLE public.book ADD COLUMN purchase_amount int GENERATED ALWAYS AS (book_id) STORED");
//        bookDao.queryDDL("ALTER TABLE public.book ADD COLUMN purchase_amount int GENERATED ALWAYS AS (book_id) STORED");

//        publisherDao.queryDDL("DROP TABLE IF EXISTS public.publisher CASCADE");
//        bookDao.queryDDL("" +
//                "ALTER TABLE book ADD COLUMN fk_publisher_id integer; " +
//                "ALTER TABLE book ADD FOREIGN KEY(fk_publisher_id) REFERENCES publisher(publisher_id)"
//        );

    }
}
