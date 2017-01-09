package nemavasi.wtproject.core.dao;

import javax.persistence.*;

/**
 * Created by user on 1/9/2017.
 */
@MappedSuperclass
public class BaseDictionaryEntity extends BaseDeletableEntity {

    private String name;
    private String sysName;

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
