DELETE_DATABASE="--deleteDB"

if [ "$DELETE_DATABASE" == $1 ]; then
    echo "Deleting DataBase"
    rm -r DataBase/
fi

rm -r build/
mkdir build
cd build
cmake ..
make