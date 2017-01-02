//input parameters:
//baseDir

//генерация скрипта
def pgScript = "";
pgScript += "BEGIN;\n"

def prefix = "/src/main/schemas/"

[
        prefix + "wt_tables/create_tables.sql"

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
def printWriter = new File((String) (baseDir + "/target/create_tables.sql")).newPrintWriter()
printWriter.println(pgScript)
printWriter.close()

//запуск скрипта в БД
//import groovy.sql.Sql
//
//sql = Sql.newInstance("jdbc:postgresql:" + dbAddr, dbLogin, dbPass, "org.postgresql.Driver")
//
//sql.execute(pgScript)










