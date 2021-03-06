package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Funcionario;
import model.Usuario;
/**
 *
 * @author Nando Luz
 */
public class DAOfuncionario {
    private final Connection con;
    private PreparedStatement pstm = null;
    
    public DAOfuncionario(){
        con = ConnectionDB.openConnection();
    }
       
    //Create (Salvar)
    public boolean save(Funcionario funcionario){
        
        String sqlFuncionario = "INSERT INTO funcionario (cpf, nome, rg, data_de_nascimento, sexo, cargo, endereco, telefone, email, usuario_idusuario) VALUES (?,?,?,?,?,?,?,?,?,?);";
        String sqlUsuario = "INSERT INTO usuario (username, senha, perfil_idperfil) VALUES (?,?,?);";
        
        try {
            pstm = con.prepareStatement(sqlUsuario);
            pstm.setString(1, funcionario.getUsuario().getUsername());
            pstm.setString(2, funcionario.getUsuario().getSenha());
            pstm.setInt(3, funcionario.getUsuario().getPerfil().getId());
            pstm.executeUpdate();
            try {
                pstm = con.prepareStatement(sqlFuncionario);
                pstm.setString(1, funcionario.getCpf());
                pstm.setString(2, funcionario.getNome());
                pstm.setString(3, funcionario.getRg());
                pstm.setDate(4, new Date(funcionario.getDataDeNascimento().getTime()));
                pstm.setString(5, funcionario.getSexo());
                pstm.setString(6, funcionario.getCargo());
                pstm.setString(7, funcionario.getEndereco());
                pstm.setString(8, funcionario.getTelefone());
                pstm.setString(9, funcionario.getEmail());
                pstm.setInt(10, funcionario.getUsuario().validar(funcionario.getUsuario().getUsername(), funcionario.getUsuario().getSenha()).getId());
                pstm.executeUpdate();
            } catch (Exception ex) {
                System.err.println("erro ao salvar FUNCIONARIO: " + ex);
                
                String sqlu = "DELETE FROM Usuario WHERE username = ? and senha = ?;";
                try {
                    pstm = con.prepareStatement(sqlu);
                    pstm.setString(1, funcionario.getUsuario().getUsername());
                    pstm.setString(2, funcionario.getUsuario().getSenha());
                    pstm.execute();
                    return false;
                } catch (SQLException e) {
                    System.err.println("Usuário continua. " + e);
                    return false;
                }
            }
            
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro ao salvar USUARIO e FUNCIONARIO: " + ex);
            return false;
        }finally{
            ConnectionDB.closeConnection(con, pstm);
        }
        
    }
    public boolean saveSemUsuario(Funcionario funcionario){
        
        String sqlFuncionario = "INSERT INTO funcionario (cpf, nome, rg, data_de_nascimento, sexo, cargo, endereco, telefone, email) VALUES (?,?,?,?,?,?,?,?,?);";
        
            try {
                pstm = con.prepareStatement(sqlFuncionario);
                pstm.setString(1, funcionario.getCpf());
                pstm.setString(2, funcionario.getNome());
                pstm.setString(3, funcionario.getRg());
                pstm.setDate(4, new Date(funcionario.getDataDeNascimento().getTime()));
                pstm.setString(5, funcionario.getSexo());
                pstm.setString(6, funcionario.getCargo());
                pstm.setString(7, funcionario.getEndereco());
                pstm.setString(8, funcionario.getTelefone());
                pstm.setString(9, funcionario.getEmail());
                
                pstm.executeUpdate();
                return true;
            } catch (SQLException ex) {
                System.err.println("Erro ao salvar FUNCIONARIO: " + ex);
                return false;
            }finally{
            ConnectionDB.closeConnection(con, pstm);
        }
        
    }
    
    //Read (Ler)
    public ArrayList<Funcionario> findAll(){
        
        ArrayList<Funcionario> listaDeFuncionario = new ArrayList();
        
        String sql = "SELECT * FROM Funcionario;";
        
        try {
            pstm = con.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            
            while(rs.next()){
                Funcionario funcionario = new Funcionario();
                DAOusuario dao = new DAOusuario();
                
                funcionario.setId(rs.getInt("idFuncionario"));
                funcionario.setCpf(rs.getString("cpf"));
                funcionario.setNome(rs.getString("nome"));
                funcionario.setRg(rs.getString("rg"));
                funcionario.setDataDeNascimento(rs.getDate("data_de_nascimento"));
                funcionario.setSexo(rs.getString("sexo"));
                funcionario.setCargo(rs.getString("cargo"));
                funcionario.setEndereco(rs.getString("endereco"));
                funcionario.setTelefone(rs.getString("telefone"));
                funcionario.setEmail(rs.getString("email"));
                funcionario.setUsuario( dao.findForID(rs.getInt("usuario_idusuario")) );
                
                listaDeFuncionario.add(funcionario);
            }
            ConnectionDB.closeConnection(con, pstm, rs);//fecha conexões
        } catch (SQLException ex) {
            System.err.println("Erro ao buscar FUNCIONARIO: " + ex);
        }
        
        return listaDeFuncionario;
    }
    
    public Funcionario findForID(int id){
        Funcionario funcionario = new Funcionario();
        DAOusuario dao = new DAOusuario();
        
        String sql = "SELECT * FROM funcionario WHERE idFuncionario = ?;";
        
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, id);
            
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                funcionario.setId(rs.getInt("idFuncionario"));
                funcionario.setCpf(rs.getString("cpf"));
                funcionario.setNome(rs.getString("nome"));
                funcionario.setRg(rs.getString("rg"));
                funcionario.setDataDeNascimento(rs.getDate("data_de_nascimento"));
                funcionario.setSexo(rs.getString("sexo"));
                funcionario.setCargo(rs.getString("cargo"));
                funcionario.setEndereco(rs.getString("endereco"));
                funcionario.setTelefone(rs.getString("telefone"));
                funcionario.setEmail(rs.getString("email"));
                funcionario.setUsuario( dao.findForID(rs.getInt("usuario_idusuario")) );
            }
            ConnectionDB.closeConnection(con, pstm, rs);//fecha conexões
        } catch (SQLException ex) {
            System.err.println("Erro ao buscar FUNCIONARIO: " + ex);
        }
        return funcionario;
    }
    public Funcionario findForUser(Usuario usuario){
        Funcionario funcionario = new Funcionario();
        DAOusuario dao = new DAOusuario();
        
        String sql = "SELECT * FROM funcionario WHERE usuario_idUsuario = ?;";
        
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1, usuario.getId());
            
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                funcionario.setId(rs.getInt("idFuncionario"));
                funcionario.setCpf(rs.getString("cpf"));
                funcionario.setNome(rs.getString("nome"));
                funcionario.setRg(rs.getString("rg"));
                funcionario.setDataDeNascimento(rs.getDate("data_de_nascimento"));
                funcionario.setSexo(rs.getString("sexo"));
                funcionario.setCargo(rs.getString("cargo"));
                funcionario.setEndereco(rs.getString("endereco"));
                funcionario.setTelefone(rs.getString("telefone"));
                funcionario.setEmail(rs.getString("email"));
                funcionario.setUsuario( dao.findForID(rs.getInt("usuario_idusuario")) );
            }
            ConnectionDB.closeConnection(con, pstm, rs);//fecha conexões
        } catch (SQLException ex) {
            System.err.println("Erro ao buscar FUNCIONARIO por IDusuario: " + ex);
        }
        return funcionario;
    }
    
    //Update (Alterar)
    public boolean update(Funcionario funcionario) throws Exception{
        
        String sqlFuncionario = "UPDATE funcionario SET "
                                + " cpf = ?,"
                                + " nome = ?,"
                                + " rg = ?,"
                                + " data_de_nascimento = ?,"
                                + " sexo = ?,"
                                + " cargo = ?,"
                                + " endereco = ?,"
                                + " telefone = ?,"
                                + " email = ?,"
                                + " usuario_idusuario = ?"
                                + " WHERE idFuncionario = ?;";
        
        
        String sqlUsuario = "UPDATE `usuario` SET "
                            + "`USERNAME` = ?, "
                            + "`SENHA` = ?, "
                            + "`PERFIL_idPERFIL` = ? "
                            + "WHERE `usuario`.`idUSUARIO` = ?;";        
        try {
            pstm = con.prepareStatement(sqlUsuario);
            pstm.setString(1, funcionario.getUsuario().getUsername());
            pstm.setString(2, funcionario.getUsuario().getSenha());
            pstm.setInt(3, funcionario.getUsuario().getPerfil().getId());
            pstm.setInt(4, funcionario.getUsuario().getId());
            pstm.executeUpdate();
            try {
                pstm = con.prepareStatement(sqlFuncionario);
                pstm.setString(1, funcionario.getCpf());
                pstm.setString(2, funcionario.getNome());
                pstm.setString(3, funcionario.getRg());
                pstm.setDate(4, new Date(funcionario.getDataDeNascimento().getTime()));
                pstm.setString(5, funcionario.getSexo());
                pstm.setString(6, funcionario.getCargo());
                pstm.setString(7, funcionario.getEndereco());
                pstm.setString(8, funcionario.getTelefone());
                pstm.setString(9, funcionario.getEmail());
                pstm.setInt(10, funcionario.getUsuario().validar(funcionario.getUsuario().getUsername(), funcionario.getUsuario().getSenha()).getId());
                pstm.setInt(11, funcionario.getId());
                pstm.executeUpdate();
                return true;
            } catch (SQLException ex) {
                System.err.println("Erro ao alterar FUNCIONARIO: " + ex);
                return false;
            }
        } catch (SQLException ex) {
            System.err.println("Erro ao alterar USUARIO e FUNCIONARIO: " + ex);
            return false;
        }finally{
            ConnectionDB.closeConnection(con, pstm);
        }
        
    }
    public boolean updateSemUsuario(Funcionario funcionario){
        
        String sql = "UPDATE funcionario SET"
                    + " cpf = ?,"
                    + " nome = ?,"
                    + " rg = ?,"
                    + " data_de_nascimento = ?,"
                    + " sexo = ?,"
                    + " cargo = ?,"
                    + " endereco = ?,"
                    + " telefone = ?,"
                    + " email = ?"
                    + " WHERE idFuncionario = ?;";
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, funcionario.getCpf());
            pstm.setString(2, funcionario.getNome());
            pstm.setString(3, funcionario.getRg());
            pstm.setDate(4, new Date(funcionario.getDataDeNascimento().getTime()));
            pstm.setString(5, funcionario.getSexo());
            pstm.setString(6, funcionario.getCargo());
            pstm.setString(7, funcionario.getEndereco());
            pstm.setString(8, funcionario.getTelefone());
            pstm.setString(9, funcionario.getEmail());
            pstm.setInt(10, funcionario.getId());
            pstm.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro ao alterar FUNCIONARIO sem USUARIO: " + ex);
            return false;
        }finally{
            ConnectionDB.closeConnection(con, pstm);
        }
    }
        
    
    //Delete (Apagar)
    public boolean delete(Funcionario funcionario){
        String sqlf = "DELETE FROM Funcionario WHERE idFuncionario = ?;";
        String sqlu = "DELETE FROM Usuario WHERE idUsuario = ?;";
        try {
            pstm = con.prepareStatement(sqlf);
            pstm.setInt(1, funcionario.getId());
            pstm.execute();
            if((funcionario.getUsuario() != (null))){
                pstm = con.prepareStatement(sqlu);
                pstm.setInt(1, funcionario.getUsuario().getId());
                pstm.execute();
            }
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro ao deletar FUNCIONARIO: " + ex);
            return false;
        }finally{
            ConnectionDB.closeConnection(con, pstm);
        }
        
    }
}
