package ru.postgreSQL.postgre.books;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Book {
    private int book_id;
    private String title;
    private String isbn;
    private int publisher_id;
}
