package nemavasi.wtproject.core.dao;

import javax.persistence.*;

/**
 * Created by nemavasi on 05.01.17.
 */
@Entity
@Table (name = "log_level", schema = "wtp")
public class LogLevelEntity extends BaseDictionaryEntity{

    byte warningLevel;

    @Column(name = "warning_level")
    public byte getWarning_level() {
        return warningLevel;
    }

    public void setWarning_level(byte warningLevel) {
        this.warningLevel = warningLevel;
    }
}
