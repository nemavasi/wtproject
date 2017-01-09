package nemavasi.wtproject.core.dao;

import javax.persistence.*;

/**
 * Created by user on 1/9/2017.
 */
@MappedSuperclass
public class BaseIdEntity {
    private Long id;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

}
