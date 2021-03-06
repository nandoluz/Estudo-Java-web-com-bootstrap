<%-- 
    Document   : alterar_funcionario
    Created on : 23/04/2018, 13:31:24
    Author     : Nando Luz
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String id = request.getParameter("id");
%>

<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html;">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="Nando Luz" content="4I">
    <title>Alterar Funcionário - Gente Telecom</title>
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
    <link href="../resources/vendor/bootstrap/css/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css">
    <script>
        function MudarForm() {          
            var x = document.getElementById('divFuncionario');
            if(x.className === 'col-md-12'){
                x.className='col-md-9';
                document.getElementById('divUsuario').style.display = 'block';
                document.getElementById('foo').checked = true;
                $('html, body').stop().animate({
                  scrollTo: $('#page-top').offset().top
                }, 1000, 'easeInOutExpo' );
                document.getElementById('inputUsername').focus();
            }else{
                x.className='col-md-12';  
                document.getElementById('divUsuario').style.display = 'none';                
            }
        }
    </script>
    <%
        Funcionario buscar = new Funcionario();
        Funcionario funcionario = buscar.findForID(Integer.parseInt(id));
      %>
</head>

<body <%if(funcionario.getUsuario().getPerfil() != null){ %> onload="MudarForm();" <% } %>  class="fixed-nav sticky-footer bg-dark" id="page-top">
    
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
              <a href="funcionario.jsp">Funcionário</a>
            </li>
            <li class="breadcrumb-item active">Alterar Funcionário</li>
          </ol>
            <div class="card mb-3">
                <div class="card-header bg-warning text-white form-inline">
                    <div class="form-inline my-2 my-lg-0 mr-lg-2">
                        <i class="fa fa-id-badge" style="margin-right: 4px"></i>
                        <i class="fa fa-pencil" style="margin-right: 4px"></i>
                        ALTERAR FUNCIONARIO   
                        <div class="navbar-nav ml-auto" style="width: 40px; height: 40px;">                                
                        </div>
                    </div>
                </div> 
                <div class="card-body">
                    <div class="col-md-12">
                        <div>
                            <hr>
                            <center><h3 class="h5">ALTERE O FORMULARIO ABAIXO</h3></center>
                            <hr>
                            <br>
                        </div>
                        <form id="formCliente" data-toggle="validator" role="form" method="post" action="gerenciar_funcionario.do">
                            <div class="row">
                                <div id="divFuncionario" class="col-md-12" ><!--Funcionnario Form-->
                                    <center><h3 class="card-header bg-dark h3" style="color: white; border-radius: 0px 0px 20px 20px;">FUNCIONARIO</h3></center>
                                    <div class="form-group">
                                        <br>
                                        <label for="inputNome" class="control-label">NOME</label>
                                        <input id="inputNome" name="nome"  value="<%= funcionario.getNome() %>" type="text" class="form-control" placeholder="Nome do funcionário..." autofocus required>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label class="form-label">CPF</label>
                                                <input name="cpf" type="text" value="<%= funcionario.getCpf()%>" class="form-control cpf" placeholder="000.000.000-00" data-error="Por favor, informe um CPF válido." data-minlength="14" required>
                                        </div>
                                        <div class="help-block with-errors"></div>
                                        <div class="form-group col-md-6">
                                            <label class="form-label">RG</label>
                                            <input name="rg" type="text" value="<%= funcionario.getRg()%>" class="form-control rg" placeholder="0.000.000" data-error="Por favor, informe um RG válido." data-minlength="9" required>
                                        </div>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label class="form-label">SEXO</label>
                                            <input name="sexo" type="text" value="<%= funcionario.getSexo() %>" class="form-control" placeholder="SEXO do funcionário..." data-error="Este campo é necessário." required>
                                        </div>
                                        <div class="help-block with-errors"></div>
                                        <div class="form-group col-md-6">
                                            <label class="form-label">DATA DE NASCIMENTO</label>
                                            <div class="input-group" id="datetimepicker1">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="fa fa-fw fa-calendar"></i></span>
                                                </div>
                                                <%
                                                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                                %>
                                                <input name="data_de_nascimento" type="text" autocomplete="off" value="<%= sdf.format(funcionario.getDataDeNascimento())%>" class="form-control data datepicker" data-provide="datepicker"  placeholder="00/00/0000" data-error="Este campo é necessário." required>
                                            </div>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">CARGO</label>
                                        <input name="cargo" type="text" value="<%= funcionario.getCargo()%>" class="form-control" placeholder="CARGO do funcionário..." data-error="Este campo é necessário." required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">ENDEREÇO</label>
                                        <input name="endereco" type="text" value="<%= funcionario.getEndereco()%>" class="form-control" placeholder="Estado, cidade, rua..." data-error="Este campo é necessário.">
                                    </div>
                                    <div class="help-block with-errors"></div>

                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label class="form-label">TELEFONE</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="fa fa-fw fa-phone"></i></span>
                                                </div>
                                                <input name="telefone" type="text" value="<%= funcionario.getTelefone()%>" class="form-control telefone" placeholder="(00) 00000-0000" data-error="Este campo é necessário." required>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class="form-label">E-MAIL</label>
                                             <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="fa fa-fw fa-envelope"></i></span>
                                                </div>
                                                <input name="email" type="email" value="<%= funcionario.getEmail()%>" class="form-control" placeholder="exemplo@email.com">
                                             </div>
                                        </div>
                                    </div>
                                        <div class="form-inline" onload="MudarForm();">
                                            <div class="toggle form-inline">
                                                ACESSO AO SISTEMA
                                                <input id="foo"  data-on="Ready" data-off="Not Ready" type="checkbox" onclick="MudarForm();">
                                                <label for="foo"></label>
                                            </div>
                                        </div>
                                </div>
                                             
                                <%
                                    if(funcionario.getUsuario() == null){
                                        %>
                                        <input type="hidden" name="acesso" value="sem"> 
                                        <%
                                    }else{
                                        %>
                                        <input type="hidden" name="acesso" value="com"> 
                                        <%
                                    }
                                %>

                                <div class="card col-md-3" id="divUsuario" style="display: none;border-radius: 2%;"> <!--Usuario Form-->
                                    <center><h3 class="card-header bg-dark h3" style="color: white; border-radius: 0px 0px 20px 20px;">USUARIO</h3></center>
                                          <input type="hidden" value="<%= funcionario.getUsuario().getId() %>" name="idUsuario">
                                      <div class="form-group">
                                          <br>
                                          <label class="form-label">USERNAME</label>
                                          <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="fa fa-fw fa-user"></i></span>
                                                </div>
                                                <input id="inputUsername" name="username"  type="text" value="<%= funcionario.getUsuario().getUsername() %>" class="form-control" placeholder="Username..." data-error="Este campo é necessário." <%if(funcionario.getUsuario().getPerfil() != null){ %> required <% } %>>
                                          </div>
                                          <div class="help-block with-errors"></div>
                                      </div>
                                      <div class="form-group">
                                            <label class="form-label">SENHA</label>
                                            <div class="input-group">
                                                  <div class="input-group-prepend">
                                                      <span class="input-group-text"><i class="fa fa-fw fa-lock"></i></span>
                                                  </div>
                                                <input name="senha"  type="password" value="<%= funcionario.getUsuario().getSenha() %>" class="form-control" placeholder="*****" data-error="Este campo é necessário."  <%if(funcionario.getUsuario().getPerfil() != null){ %> required <% } %> >
                                            </div>
                                            <div class="help-block with-errors"></div>
                                      </div>
                                      <div class="form-group">
                                            <label class="form-label">CONFIRMAR SENHA</label>
                                            <div class="input-group">
                                                  <div class="input-group-prepend">
                                                      <span class="input-group-text"><i class="fa fa-fw fa-lock"></i></span>
                                                  </div>
                                                  <input type="password" class="form-control" placeholder="*****" data-error="Este campo é necessário."  <%if(funcionario.getUsuario().getPerfil() != null){ %> required <% } %> >
                                            </div>
                                            <div class="help-block with-errors"></div>
                                      </div>
                                      <div class="form-group">
                                          <label class="form-label">PERFIL</label><br>
                                          <select name="perfil" class="form-control col-md-12" id="FormControlSelect1">
                                              <option value="0" title="Selecione" selected>Selecione</option>
                                                  <%
                                                      ArrayList<Perfil> lista = new ArrayList();
                                                      Perfil p = new Perfil();
                                                      lista = p.findAll();
                                                      for(Perfil perfil:lista){
                                                  %>
                                                  <option value="<%=perfil.getId()%>"
                                                        <%if(funcionario.getUsuario().getPerfil() != null){
                                                            if( funcionario.getUsuario().getPerfil().getId() == (perfil.getId()) ){
                                                                %> selected <% }
                                                            } %>
                                                    ><!--Fecha a tag-->
                                                      <%= perfil.getPerfil() %> 
                                                  </option>
                                                  <%
                                                  }
                                                  %>
                                          </select>
                                      </div>
                                </div>
                            </div>
                            <div class="form-group align-content-center">
                                <center>
                                    <input type="hidden" name="id" value="<%=id%>">
                                    <button class="btn btn-success col-md-3" name="option" value="update">
                                        <i class="fa fa-pencil"></i>
                                        ALTERAR
                                    </button>
                                    <a class="btn btn-primary col-md-3" href="funcionario.jsp" name="cancelar" style="margin: 2px;">
                                        <i class="fa fa-reply"></i>
                                        CANCELAR
                                    </a>
                                </center>
                            </div>
                        </form>
                    </div>
                </div>          
            </div>
        </div>
            <%@include file="rodape.jsp" %>
            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
              <i class="fa fa-angle-up"></i>
            </a>
            <!-- Core plugin JavaScript-->
            <script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>
            <script src="../resources/js/validator.min.js"></script>
            <!-- Custom scripts for all pages-->
            <script src="../resources/js/sb-admin.min.js"></script>
            <!--datepicker-->
            <script src="../resources/vendor/bootstrap/js/bootstrap-datepicker.min.js"></script>
            <script src="../resources/vendor/bootstrap/js/bootstrap-datepicker.pt-BR.min.js"></script>
            <script>
                jQuery(document).ready(function (){
                    $(".cpf").mask("000.000.000-00");
                    $(".telefone").mask("(00) 00000-0000");
                    $(".rg").mask("0.000.000");
                    $(".data").mask("00/00/0000");
                });
                $('.datepicker').datepicker({
                    format: 'dd/mm/yyyy',
                    language: "pt-BR"
                });
            </script>
    </div>
</body>
</html>
