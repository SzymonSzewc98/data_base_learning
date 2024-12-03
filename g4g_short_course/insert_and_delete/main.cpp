#include <iostream>
#include <filesystem>
#include <sqlite3.h>
#include "../common/utils.h"

static int create_database()
{
    sqlite3* DB;
    int exit = 0;
    char* message_error;
    std::string sql = "CREATE TABLE PERSON("
                      "ID INT PRIMARY KEY     NOT NULL, "
                      "NAME           TEXT    NOT NULL, "
                      "SURNAME          TEXT     NOT NULL, "
                      "AGE            INT     NOT NULL, "
                      "ADDRESS        CHAR(50), "
                      "SALARY         REAL );";

    std::filesystem::create_directory(utils::DATABASE_DIRECTORY);
    exit = sqlite3_open(std::string{utils::DATABASE_DIRECTORY + utils::DATABASE_NAME}.c_str(), &DB);
    exit = sqlite3_exec(DB, sql.c_str(), NULL, 0, &message_error);

    if (exit != SQLITE_OK)
    {
        std::cerr<<"Error Create Table"<<std::endl;
        sqlite3_free(message_error);
    }
    else
    {
        std::cout<<"Table created Successfully!"<<std::endl;
    }
    sqlite3_close(DB);

    return exit;
}

static int callback(void* data, int argc, char** argv, char** azColName)
{
    if (data)
    {
        fprintf(stderr, "%s: ", (const char*)data);
    }

    for (int i = 0; i < argc; i++)
    {
        printf("%s = %s\n", azColName[i], argv[i] ? argv[i] : "NULL");
    }
    printf("\n");
    return 0;
}

int main()
{
    sqlite3* DB;
    int exit = 0;
    char* message_error;
    std::string all_fields_query = "SELECT * FROM PERSON;"; //*all columns from something

    if (create_database())
    {
        std::cout<<"Could not create table"<<std::endl;
        return -1;
    }

    exit = sqlite3_open(std::string{utils::DATABASE_DIRECTORY + utils::DATABASE_NAME}.c_str(), &DB);

    std::cout<<"STATE OF TABLE BEFORE INSERT"<<std::endl;

    sqlite3_exec(DB, all_fields_query.c_str(), callback, NULL, NULL);

    std::string sql("INSERT INTO PERSON VALUES(1, 'STEVE', 'GATES', 30, 'PALO ALTO', 1000.0);"
                    "INSERT INTO PERSON VALUES(2, 'BILL', 'ALEN', 20, 'SEATTLE', 300.22);"
                    "INSERT INTO PERSON VALUES(3, 'PAUL', 'JOBS', 24, 'SEATTLE', 9900.0);");

    exit = sqlite3_exec(DB, sql.c_str(), NULL, 0, &message_error);

    if (exit != SQLITE_OK)
    {
        std::cerr<<"Error Insert "<<std::endl;
        sqlite3_free(message_error);
    }
    else
    {
        std::cout<<"Recors created Successfully"<<std::endl;
    }

    std::cout<<"STATE OF TABLE AFTER INSERT"<<std::endl;

    sqlite3_exec(DB, all_fields_query.c_str(), callback, NULL, NULL);

    sql = "DELETE FROM PERSON WHERE ID = 2;";

    exit = sqlite3_exec(DB, sql.c_str(), NULL, 0, &message_error);

    if (exit != SQLITE_OK)
    {
        std::cerr<<"Error DELETE from DB"<<std::endl;
        sqlite3_free(message_error);
    }
    else
    {
        std::cout<<"Record deleted Successfully!"<<std::endl;
    }

    std::cout<<"STATE OF TABLE AFTER DELETE OF ELEMENT"<<std::endl;
    sqlite3_exec(DB, all_fields_query.c_str(), callback, NULL, NULL);

    sqlite3_close(DB);

    return 0;
}