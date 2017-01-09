package nemavasi.wtproject.core.dao;

import org.hibernate.annotations.Type;

import javax.persistence.*;

/**
 * Created by user on 1/9/2017.
 */
@MappedSuperclass
public class BaseDeletableEntity extends BaseIdEntity{

    private boolean isDeleted;

    @Column(name = "is_deleted")
    //@Convert(converter=BooleanToStringConverter.class)
    @Type(type = "yes_no") //for 'Y' and 'N'
    public boolean isDeleted() {
        return isDeleted;
    }

    public void setDeleted(Boolean deleted) {
        isDeleted = deleted;
    }
}
