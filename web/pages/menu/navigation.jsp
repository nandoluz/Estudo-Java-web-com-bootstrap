<%-- 
    Document   : menu
    Created on : 29/04/2018, 13:58:26
    Author     : Nando Luz
--%>

<%@page import="model.Usuario"%>
<!--
    ATEN��O!
    Neste Menu est�:
    *Bootstrap core JavaScript
-->

<%
    HttpSession sessao = request.getSession();
    Usuario usuario = null;
    if(sessao.getAttribute("usuario") == null){
        response.sendRedirect("../index.jsp");
    } else {
        usuario = new Usuario();
        usuario = (Usuario)sessao.getAttribute("usuario");
%>




  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
      <a class="navbar-brand" href="home.jsp"><img src="../img/logotipo.png"></a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Home">
          <a class="nav-link" href="home.jsp">
            <i class="fa fa-fw fa-home  "></i>
            <span class="nav-link-text">Home</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Monitoramento">
            <a class="nav-link" href="monitoramento.jsp">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Monitoramento</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Instalacao">
            <a class="nav-link" href="log.jsp">
            <i class="fa fa-fw fa-history"></i>
            <span class="nav-link-text">Log de A��es</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Adicionar">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseAdicinar" data-parent="#collapseAdicinar">
            <i class="fa fa-fw fa-plus-square"></i>
            <span class="nav-link-text">Adicionar</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseAdicinar">
            <li>
                <a href="cadastra_cliente.jsp">
                    <i class="fa fa-fw fa-user-plus"></i>
                    <span class="nav-link-text">Cliente</span>
                </a>
            </li>
            <li>
                <a href="cadastra_funcionario.jsp">
                    <i class="fa fa-fw fa-plus-square-o"></i>
                    <span class="nav-link-text">Funcion�rio</span>
                </a>
            </li>
            <li>
                <a href="cadastra_produto.jsp">
                    <i class="fa fa-fw fa-cart-plus"></i>
                    <span class="nav-link-text">Produto</span>
                </a>
            </li>
          </ul>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Gerar Contrato">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseGerarContrato" data-parent="#collapseGerarContrato">
            <i class="fa fa-fw fa-file-text"></i>
            <span class="nav-link-text">Gerar Contrato</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseGerarContrato">
            <li>
                <a href="contrato_voip.jsp">
                    <i class="fa fa-fw fa-file-text"></i>
                    VoIP
                </a>
            </li>
            <li>
                <a href="contrato_internet.jsp">
                    <i class="fa fa-fw fa-file-text"></i>
                    Internet
                </a>
            </li>
          </ul>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Pagina Root">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseRoot" data-parent="#collapseRoot">
            <i class="fa fa-fw fa-hashtag"></i>
            <span class="nav-link-text">Root</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseRoot">
            <li>
              <a href="menu.jsp">
                  <i class="fa fa-fw fa-link"></i>
                  Menu
              </a>
            </li>
            <li>
              <a href="perfil.jsp">
                  <i class="fa fa-fw fa-vcard"></i>
                  Perfil
              </a>
            </li>
          </ul>
        </li>
      </ul>
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
<!--        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-fw fa-envelope"></i>
            <span class="d-lg-none">Mensagens
              <span class="badge badge-pill badge-primary">12 New</span>
            </span>
            <span class="indicator text-primary d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
          </a>
          <div class="dropdown-menu" aria-labelledby="messagesDropdown">
            <h6 class="dropdown-header">Novas Mensagens:</h6>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>David Miller</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">Hey there! This new version of SB Admin is pretty awesome! These messages clip off when they reach the end of the box so they don't overflow over to the sides!</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>Jane Smith</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">I was wondering if you could meet for an appointment at 3:00 instead of 4:00. Thanks!</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>John Doe</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">I've sent the final files over to you for review. When you're able to sign off of them let me know and we can discuss distribution.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item small" href="#">Ver todas as mensagens</a>
          </div>
        </li>-->
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <i class="fa fa-fw fa-user"></i>
            <span class="d-lg-none">
                Usu�rio
            </span>
          </a>
          <div class="dropdown-menu" aria-labelledby="alertsDropdown">
              <h6 class="dropdown-header" style="text-transform: uppercase;">
                    <i class="fa fa-fw fa-user"></i>
                    <%= usuario.getUsername() %>
              </h6>
            <div class="dropdown-divider"></div>
            <div class="row form-inline ">
                <div class="ml-auto">
                    <a class="dropdown-item" href="#">
                        <span class="text-muted">
                          <strong>
                            <i class="fa fa-cog fa-fw"></i></strong>
                        </span>
                      </a>
                </div>
                <div class="mr-auto">
                    <a class="dropdown-item" href="#">
                        <span class="text-muted">
                          <strong>
                            <i class="fa fa-user-o fa-fw"></i></strong>
                        </span>
                      </a>
                </div>
            </div>
            
          </div>
        </li>
        
        
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-fw fa-bell"></i>
            <span class="d-lg-none">Alertas
              <span class="badge badge-pill badge-warning">6 New</span>
            </span>
            <span class="indicator text-warning d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
          </a>
          <div class="dropdown-menu" aria-labelledby="alertsDropdown">
            <h6 class="dropdown-header">Novos Alertas:</h6>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-success">
                <strong>
                  <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-danger">
                <strong>
                  <i class="fa fa-long-arrow-down fa-fw"></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>    
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-success">
                <strong>
                  <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item small" href="#">View all alerts</a>
          </div>
        </li>
        <li class="nav-item">
          <form class="form-inline my-2 my-lg-0 mr-lg-2">
            <div class="input-group">
              <input class="form-control" type="text" placeholder="Procurar por...">
              <span class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fa fa-search"></i>
                </button>
              </span>
            </div>
          </form>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" data-toggle="modal" data-target="#Modal">
            <i class="fa fa-fw fa-sign-out"></i>Sair</a>
        </li>
      </ul>
    </div>
  </nav>
  <!-- Logout Modal-->
    <div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="ModalLabel">Pronto para partir?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">�</span>
            </button>
          </div>
          <div class="modal-body">Selecione "Sair" abaixo, se voc� estiver pronto para encerrar sua sess�o atual.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
            <a class="btn btn-primary" href="gerenciar_seguranca.do?option=logout">Sair</a>
          </div>
        </div>
      </div>
    </div> 
    <!-- Bootstrap core JavaScript-->
    <script src="../resources/vendor/jquery/jquery.min.js"></script>
    <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
            
<%
    }
%>