/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dao.DAOcliente;
import java.util.ArrayList;

/**
 *
 * @author Nando Luzy
 */
public class Cliente {
    
    private int id;
    private String nomeFantasia;
    private String cnpj;
    private String servicoContratado;
    private Double valor_servico;
    private String telefone;
    private String endereco;
    private String email;
    private String descricao;

    
    public String getNomeFantasia() {
        return nomeFantasia;
    }

    public void setNomeFantasia(String nomeFantasia) {
        this.nomeFantasia = nomeFantasia;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getServicoContratado() {
        return servicoContratado;
    }

    public void setServicoContratado(String servicoContratado) {
        this.servicoContratado = servicoContratado;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }
    
    public Double getValor_servico() {
        return valor_servico;
    }

    public void setValor_servico(Double valor_servico) {
        this.valor_servico = valor_servico;
    }
    /**
     * 
     * CHAMADA DA DAO
     * 
     * @throws Exception 
     */
    
    
    //Create
    public void insert() throws Exception{
        DAOcliente dao = new DAOcliente();
        dao.save(this);
    }
    
    //Read
    public ArrayList<Cliente> findAll() throws Exception{
        DAOcliente dao = new DAOcliente();
        return dao.findAll();
    }
    
    public Cliente findForID(int id) throws Exception{
        DAOcliente dao = new DAOcliente();
        return dao.findForID(id);
    }
    //Update
    public void update() throws Exception{ 
        DAOcliente dao = new DAOcliente();
        dao.update(this);
    }
    //Delete
    public void delete() throws Exception{
        DAOcliente dao = new DAOcliente();
        dao.delete(this);
    }


}
