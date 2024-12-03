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

    std::filesystem::create_directory(utils::DATABASE_DIRECTORY);

    exit = sqlite3_open(std::string{utils::DATABASE_DIRECTORY + utils::DATABASE_NAME}.c_str(), &DB);

    if (exit)
    {
        std::cerr<<"Error open DB"<<sqlite3_errmsg(DB)<<std::endl;
        return -1;
    }
    else
    {
        std::cout<<"Opened Database Successfully!"<<std::endl;
    }
    sqlite3_close(DB);
    return 0;
}