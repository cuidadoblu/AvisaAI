<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="shortcut icon" href="${pageContext.request.contextPath}/recursos/imagens/logos/png/logo azul.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/componentes/feed-incidentes.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/geral.css">
<div class="feed-incidentes">
    <c:forEach var="incidente" items="${listaIncidentes}">
        <div class="container-postagem">
            <div class="cabecalho-postagem">
                <div class="titulo-postagem">${incidente.titulo}</div>
                <div class="icone-situacao">🌧️ ${incidente.categoria}</div>
            </div>

            <div class="conteudo-cabeçalho">
                <img id="imagem-principal-${incidente.id}" src="${incidente.fotoIncidente[0].url}"
                     alt="Imagem do incidente"
                     class="imagem-postagem">
                <div class="informacao-postagem">
                    <img src="${incidente.usuario.fotoPerfil}" alt="Imagem do usuário" class="imagem-usuario">
                    <div class="nome-data">${incidente.usuario.nome} ${incidente.usuario.sobrenome}</div>
                    <div class="data">${incidente.dataHora}"</div>
                    <div class="mensagem-postagem">${incidente.descricao}</div>
                    <div class="reacoes">
                        <button class="botao-curtir">👍 Curtir</button>
                        <%--
                        <span>${incidente.curtidas} curtidas</span>
                        --%>
                        <button class="botao-curtir">Comentar</button>
                    </div>
                </div>
            </div>

            <div class="miniaturas">
                <c:forEach var="foto" items="${incidente.fotoIncidente}">
                    <img src="${foto.url}" alt="Imagem do incidente"
                         onclick="trocarImagemPrincipal('${foto.url}', 'imagem-principal-${incidente.id}')">
                </c:forEach>
            </div>
                <%--
                <div class="comentarios">
                    <c:forEach var="comentario" items="${incidente.comentarios}">
                        <div class="comentario">
                            <span class="nome-comentario">${comentario.usuario.nome}</span>
                            <span class="data-comentario">
                        <fmt:formatDate value="${comentario.dataHora}" pattern="dd/MM HH:mm"/>
                    </span>
                            <div>${comentario.texto}</div>
                            <button class="botao-curtir" onclick="responderComentario('${comentario.id}')">Responder</button>
                            <div id="resposta-${comentario.id}" class="respostas" style="display: none;">
                                <form action="responder-comentario" method="post">
                                    <textarea name="resposta" placeholder="Escreva sua resposta..." required></textarea>
                                    <button type="submit" class="botao-curtir">Enviar resposta</button>
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                --%>

        </div>
    </c:forEach>
</div>

<script>
    function trocarImagemPrincipal(imagemUrl, imagemId) {
        document.getElementById(imagemId).src = imagemUrl;
    }

    function responderComentario(comentarioId) {
        const respostaContainer = document.getElementById("resposta-" + comentarioId);
        respostaContainer.style.display = 'block';
    }

    function fecharResposta(comentarioId) {
        const respostaContainer = document.getElementById("resposta-" + comentarioId);
        respostaContainer.style.display = 'none';
    }
</script>