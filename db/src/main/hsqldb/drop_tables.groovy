//input parameters:
println(baseDir)

//генерация скрипта
def dbScript = "";
//dbScript += "BEGIN\n"


def prefix = "/src/main/hsqldb/schemas/"

[
        prefix + "wt_tables/000_drop_tables.sql"

].each {
    dbScript += "\n"
    dbScript += "\n"
    dbScript += "-- *****************" + it + "**********************\n"
    dbScript += "\n"

    new File((String) baseDir + it).eachLine {
        dbScript += it + "\n"
    }
}

//dbScript += "END;\n"
//dbScript += "/;\n"
//сохранение скрипта в файл
def printWriter = new File((String) (baseDir + "/target/001_create_tables.sql")).newPrintWriter()

printWriter.println(dbScript)
printWriter.close()

//запуск скрипта в БД
import groovy.sql.Sql
//sql = Sql.newInstance("jdbc:hsqldb:mem:" + dbAddr, dbLogin, dbPass, "org.hsqldb.jdbcDriver")
sql = Sql.newInstance("jdbc:hsqldb:file:db/target/"  + dbAddr, dbLogin, dbPass, "org.hsqldb.jdbcDriver")
sql.execute(dbScript)








