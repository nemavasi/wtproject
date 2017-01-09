package nemavasi.wtproject.core.dao;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

/**
 * Created by user on 1/9/2017.
 */
@Converter
public class BooleanToStringConverter implements AttributeConverter<Boolean, String> {

    public String convertToDatabaseColumn(Boolean aBoolean) {
        if (aBoolean==null) throw new NullPointerException();
        return aBoolean ? "Y" : "N";
    }

    public Boolean convertToEntityAttribute(String s) {
        return "Y".equals(s);
    }
}
