//input parameters:
//baseDir

//генерация скрипта
def pgScript = "";
pgScript += "BEGIN;\n"

def prefix = "/src/main/postgres/schemas/"

[
        prefix + "wt_tables/001_create_tables.sql"

].each {
    pgScript += "\n"
    pgScript += "\n"
    pgScript += "-- *****************" + it + "**********************\n"
    pgScript += "\n"

    new File((String) baseDir + it).eachLine {
        pgScript += it + "\n"
    }
}
pgScript += "COMMIT;\n"

//сохранение скрипта в файл
def printWriter = new File((String) (baseDir + "/target/001_create_tables.sql")).newPrintWriter()
printWriter.println(pgScript)
printWriter.close()

//запуск скрипта в БД
import groovy.sql.Sql

Properties props = new Properties();
props.setProperty("user",dbLogin);
props.setProperty("password",dbPass);
props.setProperty("ssl","true");

//sql = Sql.newInstance("jdbc:postgresql:" + dbAddr, dbLogin, dbPass, "org.postgresql.Driver")
sql = Sql.newInstance("jdbc:postgresql:" + dbAddr, props, "org.postgresql.Driver")

Sql.new

sql.execute(pgScript)










