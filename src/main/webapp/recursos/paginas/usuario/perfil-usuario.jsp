<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../componentes/cabecalho.jsp"/>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AvisaAí - Perfil Usuário</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/recursos/imagens/logos/png/logo azul.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/usuario/usuario.css">
</head>
<body>
<main>
    <c:choose>
        <c:when test="${usuarioLogado != null}">
            <div class="perfil-container">
                <div class="perfil-imagem">
                    <img src="${usuarioLogado.fotoPerfil}"
                         alt="Foto de ${usuarioLogado.nome} ${usuarioLogado.sobrenome}">
                    <div class="editar-foto">
                        <form action="uploadFoto" method="post"
                              enctype="multipart/form-data">
                            <input type="file" name="foto-perfil" id="foto-perfil">
                            <input type="hidden" name="id-usuario" value="${usuarioLogado.id}">
                            <button type="submit">Atualizar Foto</button>
                        </form>
                    </div>
                </div>
                <div class="perfil-nome">
						<span class="nome-usuario">${usuarioLogado.nome}
                                ${usuarioLogado.sobrenome}</span>
                </div>
                <div class="perfil-botoes">
                    <button type="button"
                            onclick="window.location.href='incidentes-acompanhados'">
                        <img src="img/icidente-acompanhados.png"
                             alt="Ícone Incidentes Acompanhados Usuário"
                             class="icone-icidente-acompanhados">
                    </button>
                    <button type="button"
                            onclick="window.location.href='configuracoes'">
                        <img src="img/icone-configuracao.png" alt="Configurações"
                             class="icone-configuracao">
                    </button>
                    <a href="logout"> <img src="img/icone-logout.png" alt="Logout"
                                           class="icone-logout">
                    </a>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <c:choose>
                <c:when test="${usuario == null}">
                    <p>Nenhum usuário encontrado.</p>
                </c:when>
                <c:otherwise>
                    <div class="perfil-container">
                        <div class="perfil-imagem">
                            <img src="${usuario.fotoPerfil}"
                                 alt="Foto de ${usuario.nome} ${usuario.sobrenome}">
                            <div class="editar-foto">
                                <form action="uploadFoto" method="post"
                                      enctype="multipart/form-data">
                                    <input type="file" name="foto-perfil" id="foto-perfil">
                                    <input type="hidden" name="id-usuario" value="${usuario.id}">
                                    <button type="submit">Atualizar Foto</button>
                                </form>
                            </div>
                        </div>
                        <div class="perfil-nome">
						<span class="nome-usuario">${usuario.nome}
                                ${usuario.sobrenome}</span>
                        </div>
                        <div class="perfil-botoes">
                            <button type="button"
                                    onclick="window.location.href='incidentes-acompanhados'">
                                <img src="img/icidente-acompanhados.png"
                                     alt="Ícone Incidentes Acompanhados Usuário"
                                     class="icone-icidente-acompanhados">
                            </button>
                            <button type="button"
                                    onclick="window.location.href='configuracoes'">
                                <img src="img/icone-configuracao.png" alt="Configurações"
                                     class="icone-configuracao">
                            </button>
                            <a href="logout"> <img src="img/icone-logout.png" alt="Logout"
                                                   class="icone-logout">
                            </a>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </c:otherwise>
    </c:choose>
</main>
</body>
</html>
