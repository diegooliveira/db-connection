#include <mysql.h>
#include <stdio.h>

int main() {

    // Referencia para a conexão
    MYSQL *conn;
    MYSQL_RES *res;
    MYSQL_ROW row;

    char *server = "localhost";
    char *user = "root";
    char *password = "root"; /* set me first */
    char *database = "mysql";
    conn = mysql_init(NULL);

   // Abre a conexão com o banco de dados, se não tiver sucesso 
   // entra no if, imprime a mensagem de erro e sai.
   printf("--> Conectando no banco de dados\n");
   if (!mysql_real_connect(conn, server, user, password, database, 0, NULL, 0)) {
      fprintf(stderr, "%s\n", mysql_error(conn));
      return 1;
   }

    char *query = "show tables;";
    printf("->> Executando consulta: [ %s ]\n", query);
    if (mysql_query(conn, query)) {
        fprintf(stderr, "%s\n", mysql_error(conn));
        return 1;
    }
    res = mysql_use_result(conn);
    
    /* output table name */
    printf("->> Imprimindo resultado.\n");
    while ((row = mysql_fetch_row(res)) != NULL)
        printf("%s \n", row[0]);
   
    /* close connection */
    mysql_free_result(res);
   
    printf("->> Desconectando do banco de dados.\n");
    mysql_close(conn);
}
