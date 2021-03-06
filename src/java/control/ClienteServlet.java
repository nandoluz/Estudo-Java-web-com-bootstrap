/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.sql.Date;
import javax.servlet.http.HttpSession;
import model.Cliente;
import model.Funcionario;
import model.Log;
import model.Usuario;

/**
 *
 * @author Nando Luzy
 */
public class ClienteServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Usuario</title>");            
            out.println("</head>");
            out.println("<body>");            
            //declaração de variaveis que recebem por parametro os valores.
            String option = request.getParameter("option");
            
            Cliente cliente = new Cliente();
            //Decisão de qual metodo CRUD usar.
            switch(option){
                case "insert":{
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    
                    cliente.setNomeFantasia(request.getParameter("nome_fantasia"));
                    cliente.setCnpj(request.getParameter("cnpj"));
                    cliente.setInscricaoEstadual(request.getParameter("ie"));
                    cliente.setServicoContratado(request.getParameter("servico_contratado"));
                    cliente.setQuantidade(request.getParameter("quantidade"));
                    cliente.setValor_servico(Double.parseDouble(request.getParameter("valor")));
                    cliente.setData_adesao(sdf.parse(request.getParameter("data_adesao")));
                    cliente.setCep(request.getParameter("cep"));
                    cliente.setEndereco(request.getParameter("endereco"));
                    cliente.setBairro(request.getParameter("bairro"));
                    cliente.setCidade(request.getParameter("cidade"));
                    cliente.setEstado(request.getParameter("estado"));
                    cliente.setTelefone(request.getParameter("telefone"));
                    cliente.setEmail(request.getParameter("email"));
                    cliente.setDescricao(request.getParameter("descricao"));
                    cliente.insert();
                    response.sendRedirect("cliente.jsp");
                    
                    //gera log
                    Log log = new Log();                    
                    log.setNome("Cadastro Cliente: " + request.getParameter("nome_fantasia"));
                    Date data = new Date(System.currentTimeMillis());  
                    log.setData(data);
                    HttpSession sessao = request.getSession();
                    Funcionario funcionario = new Funcionario();
                    log.setFuncionario(funcionario.findForUser((Usuario) sessao.getAttribute("usuario")));
                    log.gerarLog();
                }
                break;
                
                case "update":{
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    
                    cliente.setNomeFantasia(request.getParameter("nome_fantasia"));
                    cliente.setCnpj(request.getParameter("cnpj"));
                    cliente.setInscricaoEstadual(request.getParameter("ie"));
                    cliente.setServicoContratado(request.getParameter("servico_contratado"));
                    cliente.setQuantidade(request.getParameter("quantidade"));
                    cliente.setValor_servico(Double.parseDouble(request.getParameter("valor")));
                    cliente.setData_adesao(sdf.parse(request.getParameter("data_adesao")));
                    cliente.setCep(request.getParameter("cep"));
                    cliente.setEndereco(request.getParameter("endereco"));
                    cliente.setBairro(request.getParameter("bairro"));
                    cliente.setCidade(request.getParameter("cidade"));
                    cliente.setEstado(request.getParameter("estado"));
                    cliente.setTelefone(request.getParameter("telefone"));
                    cliente.setEmail(request.getParameter("email"));
                    cliente.setDescricao(request.getParameter("descricao"));
                    cliente.setId(Integer.parseInt(request.getParameter("id")));
                    cliente.update();
                    response.sendRedirect("cliente.jsp");
                    
                    //gera log
                    Log log = new Log();                    
                    log.setNome("Alteração Cliente: " + request.getParameter("nome_fantasia"));
                    Date data = new Date(System.currentTimeMillis());  
                    log.setData(data);
                    HttpSession sessao = request.getSession();
                    Funcionario funcionario = new Funcionario();
                    log.setFuncionario(funcionario.findForUser((Usuario) sessao.getAttribute("usuario")));
                    log.gerarLog();
                }
                break;
                
                
                case "delete":{
                    cliente.setId(Integer.parseInt(request.getParameter("id")));
                    cliente.delete();
                    response.sendRedirect("cliente.jsp");
                    
                    //gera log
                    Log log = new Log();                    
                    log.setNome("Exclusão Cliente: " + request.getParameter("nome_fantasia"));
                    Date data = new Date(System.currentTimeMillis());  
                    log.setData(data);
                    HttpSession sessao = request.getSession();
                    Funcionario funcionario = new Funcionario();
                    log.setFuncionario(funcionario.findForUser((Usuario) sessao.getAttribute("usuario")));
                    log.gerarLog();
                }
                break;
                        
            }
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            System.err.println("Servlet erro: " + ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            System.err.println("Servlet erro: " + ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
