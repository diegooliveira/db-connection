
import java.sql.*;

public class ConectarMySql {

    public static void main(String args[]){
        System.out.println("MySQL Connect Example.");

        // Nome do banco de dados.
        String nomeDoBanco = "mysql";

        // Cada banco de dados tem sua forma particular de formar a url de
        // conexão, por padrão tem a forma:
        //      jdbc:[driver]:[informações do driver]
        // Procure pela forma de conexão para outro bancos de dados
        String url = "jdbc:mysql://localhost:3306/" + nomeDoBanco;
        
        // Cada banco de dados tem seu conector, esse é o do MySql
        String driver = "com.mysql.jdbc.Driver";
        
        // Usuário e senha do banco de dados
        String nomeDoUsuario = "root"; 
        String senha = "root";
        
        // Objeto que guarda a conexão
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            // Registrando o driver.
            Class.forName(driver).newInstance();
            
            // Abrindo a conexão, se tiver falha pula para o tratamento de
            // error
            System.out.println("->> Conectando no banco de dados [ " + url + " ]");
            conn = DriverManager.getConnection(url, nomeDoUsuario, senha);

            String query = "show tables;";
            System.out.println("->> Executando consulta: [ " + query + " ]");
            st = conn.createStatement();
            rs = st.executeQuery(query);
            
            System.out.println("->> Imprimindo resultado.");
            while( rs.next() ){
                System.out.println( rs.getString(1) );
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();            
            
                if (st != null)
                    st.close();
            
                System.out.println("->> Desconectando do banco de dados.");
                if (conn != null)
                    conn.close();
            } catch (Exception ex){
            }
        }
    }

}
