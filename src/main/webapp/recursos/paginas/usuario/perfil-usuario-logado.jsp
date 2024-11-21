<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../componentes/cabecalho.jsp"/>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AvisaAí - Meu Perfil</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/usuario/usuario.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/recursos/css/incidente/incidente.css">
</head>
<body>
<div class="principal">
    <div class="coluna" id="esquerda">
        <div class="perfil-container">
            <jsp:include page="/recursos/paginas/usuario/editar-usuario.jsp"/>
            <div class="perfil-imagem">
                <img src="exibir-foto?id-foto=${usuarioLogado.fotoPerfil.id}"
                     alt="Foto de ${usuarioLogado.nome} ${usuarioLogado.sobrenome}">
                <div class="editar-foto">
                    <form action="uploadFoto" method="post" enctype="multipart/form-data">
                        <input type="file" name="id-foto" id="id-foto">
                        <input type="hidden" name="id-usuario" value="${usuarioLogado.id}">
                        <button type="submit">Atualizar Foto</button>
                    </form>
                </div>
            </div>
            <div class="perfil-nome">
                <span class="nome-usuario">${usuarioLogado.nome} ${usuarioLogado.sobrenome}</span>
            </div>
            <div class="perfil-botoes">
                <button type="button" onclick="window.location.href='incidentes-acompanhados'">
                    <img src="${pageContext.request.contextPath}/recursos/imagens/icones/usuario/acompanhados-perfil.png"
                         alt="Incidentes Acompanhados" class="icone-icidente-acompanhados">
                </button>
                <button type="button" onclick="window.location.href='editar-usuario'">
                    <img src="${pageContext.request.contextPath}/recursos/imagens/icones/usuario/icone-configuracoes.png"
                         alt="Configurações" class="icone-configuracao">
                </button>
                <a href="deslogar">
                    <img src="${pageContext.request.contextPath}/recursos/imagens/icones/usuario/Lego-out%20perfil.png"
                         alt="Logout" class="icone-logout">
                </a>
            </div>
        </div>
    </div>
    <div class="coluna" id="meio">
        <jsp:include page="../componentes/feed-incidentes.jsp"/>
    </div>
    <div class="coluna" id="direita">Direita</div>
</div>
</body>
<script>
    const btnConfiguracoes = document.getElementById("btn-configuracoes");
    const editarPerfil = document.getElementById("editar-perfil");

    btnConfiguracoes.addEventListener("click", () => {
        editarPerfil.style.display = "flex";
    });

    document.getElementById("botao-cancelar").addEventListener("click", () => {
        editarPerfil.style.display = "none";
    });
</script>
</html>
