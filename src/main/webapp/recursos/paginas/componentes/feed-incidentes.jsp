<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="feed-incidentes">
    <c:forEach var="incidente" items="${listaIncidentes}">
        <div class="container-postagem">
            <div class="cabecalho-postagem">
                <div class="titulo-postagem">${incidente.titulo}</div>
                <div class="icone-situacao">🌧️ ${incidente.categoria}</div>
            </div>

            <div class="conteudo-cabeçalho">
                <div class="data">${incidente.dataHora}</div>
                <div class="mensagem-postagem">${incidente.descricao}</div>
                <div class="reacoes">
                    <button class="botao-curtir"
                            onclick="window.location.href='${pageContext.request.contextPath}/perfil-incidente?id-incidente=${incidente.id}'">
                        Curtir
                    </button>
                    <button class="botao-curtir"
                            onclick="window.location.href='${pageContext.request.contextPath}/perfil-incidente?id-incidente=${incidente.id}'">
                        Comentar
                    </button>
                </div>
            </div>

            <div class="miniaturas">
                <c:choose>
                    <c:when test="${not empty listaFotosIncidente}">
                        <c:forEach var="foto" items="${incidente.fotoIncidente}">
                            <img src="${foto.url}" alt="Imagem do incidente"
                                 onclick="trocarImagemPrincipal('${foto.url}', 'imagem-principal-${incidente.id}')">
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <img src="${pageContext.request.contextPath}/recursos/imagens/placeholder.png" alt="Sem imagem disponível">
                    </c:otherwise>
                </c:choose>
            </div>

            <jsp:include page="listar-comentarios.jsp"/>
        </div>
    </c:forEach>
</div>

<script>
    function trocarImagemPrincipal(imagemUrl, imagemId) {
        document.getElementById(imagemId).src = imagemUrl;
    }
</script>