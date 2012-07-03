program ExemploConexaoMySQL;

// Linkando com a biblioteca de acesso ao MySQL.
uses mysql50;

// Nome do banco de dados.
const databaseName : pchar = 'mysql';
const query : pchar = 'show tables;';

// Variáveis para controle da conexão.
var
  conexao : PMySQL;
  referencia_conexao : st_mysql;
  referncia_resultado : PMYSQL_RES;
  linha : MYSQL_ROW;
  
begin
    WriteLn('MySQL Connect Example.');
    
    // Inicializando o driver do banco de dados.
    mysql_init(PMYSQL(@referencia_conexao));
    
    // Abrindo a conexão, se houver problema para e imprime e sai.
    WriteLn('->> Conectando no banco de dados');
    conexao := mysql_real_connect(PMysql(@referencia_conexao), 'localhost', 
    	'root', 'root', nil, 3306, nil, 0);
    if conexao = Nil then begin
        Writeln (stderr, 'Couldn''t connect to MySQL.');
        Writeln (stderr, mysql_error(@referencia_conexao));
        halt(1);
    end;
        
    // Selecionando o banco de dados.
    if mysql_select_db(conexao, databaseName) < 0 then begin
        Writeln (stderr,'Couldn''t select database mysql' );
        Writeln (stderr,mysql_error(@referencia_conexao));
                
        halt(1);
    end;
    
    writeln ('->> Executando consulta: [ ',query,' ]');
    if (mysql_query(conexao, query) < 0) then begin
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
