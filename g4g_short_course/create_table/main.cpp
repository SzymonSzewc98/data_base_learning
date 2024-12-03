#include <iostream>
#include <filesystem>
#include <sqlite3.h>

namespace utils
{
    const std::string DATABASE_DIRECTORY{"../DataBase/"};
    const std::string DATABASE_NAME{"example.db"};
}

int main()
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
    return 0;
}