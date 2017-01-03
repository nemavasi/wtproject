//input parameters:
println(baseDir)

//генерация скрипта
def dbScript = "";


def prefix = "/src/main/hsqldb/schemas/"

[
        prefix + "wt_tables/create_tables.sql"

].each {
    dbScript += "\n"
    dbScript += "\n"
    dbScript += "-- *****************" + it + "**********************\n"
    dbScript += "\n"

    new File((String) baseDir + it).eachLine {
        dbScript += it + "\n"
    }
}


//сохранение скрипта в файл
def printWriter = new File((String) (baseDir + "/target/create_tables.sql")).newPrintWriter()

printWriter.println(dbScript)
printWriter.close()

//запуск скрипта в БД
import groovy.sql.Sql
//sql = Sql.newInstance("jdbc:hsqldb:mem:" + dbAddr, dbLogin, dbPass, "org.hsqldb.jdbcDriver")
sql = Sql.newInstance("jdbc:hsqldb:file:db/target/"  + dbAddr, dbLogin, dbPass, "org.hsqldb.jdbcDriver")
sql.execute(dbScript)

println sql.rows('select * from access_control_item')








