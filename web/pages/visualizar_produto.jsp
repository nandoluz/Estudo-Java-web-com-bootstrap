<%-- 
    Document   : visualizar_cliente
    Created on : 25/04/2018, 16:11:09
    Author     : Nando Luz
--%>

<%@page import="model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String id = request.getParameter("id");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="Nando Luz" content="4I">
        <title>Visualizar Produto - Gente Telecom</title>
        <!-- Bootstrap core CSS-->
        <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="../resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Page level plugin CSS-->
        <link href="../resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="../resources/css/sb-admin.css" rel="stylesheet">
        <!--icon-->
        <link rel="shortcut icon" href="../img/favicon/favicon.ico" type="image/x-icon" />
    
        <script type="text/javascript">
            function excluir(nome,id){
                var url = "gerenciar_produto.do?option=delete&id="+id;
                    if(confirm("Tem certeza que deseja excluir o produto: "+nome+"?")){
                        window.open(url,"_self");
                }
            }
        </script>
    </head>
    <body class="fixed-nav sticky-footer bg-dark" id="page-top">
        <!-- Navigation-->
        <%@include file="menu/navigation.jsp" %>
        <div class="content-wrapper">
            <div class="container-fluid">
                  <!-- Breadcrumbs-->
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                      <a href="home.jsp">Home</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="estoque.jsp">Estoque</a>
                    </li>
                    <li class="breadcrumb-item active">Visualizar produto</li>
                  </ol>
                  <div class="card mb-3">
                        <div class="card-header bg-primary text-white form-inline">
                            <div class="form-inline my-2 my-lg-0 mr-lg-2">
                                <i class="fa fa-user" style="margin-right: 4px"></i>
                                VISUALIZAR PRODUTO
                                <div class="navbar-nav ml-auto" style="width: 40px; height: 40px;">                                
                                </div>
                            </div>
                        </div> 
                        <div class="card-body">
                            <div class="col-md-12">
                                <table class="text-center table table-bordered" id="dataTable">

                                    <%
                                        Produto buscar = new Produto();
                                        Produto produto = buscar.findForID(Integer.parseInt(id));
                                    %>
                                    
                                    <tr>
                                        <th> NOME DO PRODUTO: </th><td><%= produto.getNome()%></td>
                                    </tr>
                                    <tr>
                                        <th> VALOR: </th><td>R$ <%= produto.getValor() %></td>
                                    </tr>
                                    <tr>
                                        <th> CATEGORIA: </th><td><%= produto.getCategoria() %></td>
                                    </tr>
                                    <tr>
                                        <th> QUATIDADE: </th><td> <%= produto.getQuantidade() %></td>
                                    </tr>
                                </table>
                                            
                                            <div class="text-center">
                                                <a class="btn btn-danger col-md-3" href="#" onclick="excluir('<%= produto.getNome() %>', <%= produto.getId() %>)" style="margin: 2px;">
                                                    <span class="fa fa-trash"></span>
                                                    EXCLUIR
                                                </a>
                                                <a class="btn btn-primary col-md-3" href="alterar_produto.jsp?id=<%= produto.getId() %>" style=" margin: 2px;">
                                                    <span class="fa fa-pencil"></span>
                                                    ALTERAR
                                                </a>
                                                <a class="btn btn-primary col-md-3" href="estoque.jsp" name="cancelar" style="margin: 2px;">
                                                    <span class="fa fa-reply"></span>
                                                    VOLTAR
                                                </a>
                                            </div>
                                
                            </div>
                        </div>
                  </div>
            </div> 
            <!-- /.content-wrapper-->
            <footer class="sticky-footer">
              <div class="container">
                <div class="text-center">
                  <small>Gente Telecom do Brasil © 2018 Todos os Direitos Reservados</small>
                </div>
              </div>
            </footer>
            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
              <i class="fa fa-angle-up"></i>
            </a>
            <!-- Core plugin JavaScript-->
            <script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>
            <!-- Custom scripts for all pages-->
            <script src="../resources/js/sb-admin.min.js"></script>
        </div>
    </body>
</html>
