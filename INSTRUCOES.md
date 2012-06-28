
Prerequisito 
============


    -> DEBIAN/UBUNTU
        
        
from-c
------

    Programa que se conecta no mysql é faz um query no banco de dados em C.
    
    -> Instalação das bibliotecas
        sudo apt-get install mysql-server
        sudo apt-get install mysql-client
        sudo apt-get install libmysqlclient-dev
        sudo apt-get install build-essential
    
    ### COMPILAR
    
    gcc -o main $(mysql_config --cflags) main.c $(mysql_config --libs)
    
    ### EXECUTAR
    
    ./main
    
    
from-java
---------

    Programa que se conecta no mysql é faz um query no banco de dados em Java.

    ### COMPILAR
    
    javac ConectarMySql.java
    
    ### EXECUTAR
    
    java -cp .:lib/mysql-connector-java-5.1.20-bin.jar  ConectarMySql
    

from-freepascal
---------
    
    
    sudo apt-get install fp-compiler fp-units-db
