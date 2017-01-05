package nemavasi.wtproject.core.dao;

import javax.persistence.*;

/**
 * Created by nemavasi on 05.01.17.
 */
@Entity
@Table (name = "role", schema = "wtp")
public class RoleEntity {

    private Long id;
    private String name;
    private String sysName;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "sys_name")
    public String getSysName() {
        return sysName;
    }

    public void setSysName(String sysName) {
        this.sysName = sysName;
    }
}
