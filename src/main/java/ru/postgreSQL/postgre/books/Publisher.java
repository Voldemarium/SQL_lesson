package ru.postgreSQL.postgre.books;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Publisher {
    private int publisher_id;
    private String address;
    private String org_name;
}
