program ExemploConexaoMySQL;

uses mysql50;

var
  conexao : PMySQL;
  referencia_conexao : st_mysql;
  referncia_resultado : PMYSQL_RES;
  linha : MYSQL_ROW;
  
begin
    mysql_init(PMYSQL(@referencia_conexao));
    conexao := mysql_real_connect(
        PMysql(@referencia_conexao),
        'localhost',
        'root',
        'root',nil,3306,nil,0);

    // Abrindo a conexão        
    if conexao = Nil then begin
        Writeln (stderr,'Couldn''t connect to MySQL.');
        Writeln (stderr,mysql_error(@referencia_conexao));
        halt(1);
    end;
        
    // Selecionando o banco de dados.
    if mysql_select_db(conexao,'mysql') < 0 then begin
        Writeln (stderr,'Couldn''t select database mysql' );
        Writeln (stderr,mysql_error(@referencia_conexao));
                
        halt(1);
    end;
    
    writeln ('Executing query : ');
    if (mysql_query(conexao,'show tables;') < 0) then begin
        Writeln (stderr,'Query failed ');
        writeln (stderr,mysql_error(conexao));
        halt(1);
    end;
    
    referncia_resultado := mysql_store_result(conexao);
    if referncia_resultado = Nil then begin
        Writeln ('A query não trouxe nada.');
        mysql_close(conexao);
        halt(1);
    end;
    
    linha := mysql_fetch_row(referncia_resultado);
    while (linha <> nil) do begin
        Writeln  (linha[0]);
        linha := mysql_fetch_row(referncia_resultado);
    end;
    mysql_free_result (referncia_resultado);
    mysql_close(conexao);
end.
