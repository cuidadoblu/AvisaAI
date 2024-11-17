<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../componentes/cabecalho.jsp" />

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>AvisaAí - Perfil Incidente</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/incidente/incidente.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/geral.css">
    <script>
        function trocarImagemPrincipal(imagemUrl) {
            document.getElementById("imagem-principal").src = imagemUrl;
        }

        function mostrarFormularioComentario() {
            document.getElementById('formulario-comentario').style.display = 'block';
            document.getElementById('botao-comentar').style.display = 'none';
        }

        function ocultarFormularioComentario() {
            document.getElementById('formulario-comentario').style.display = 'none';
            document.getElementById('botao-comentar').style.display = 'inline-block';
            document.getElementById('form-comentario').reset();
        }
    </script>
</head>
<body>
<main>
    <div class="container-postagem">
        <div class="cabecalho-postagem">
            <div class="titulo-postagem">${incidente.titulo}</div>
            <div class="icone-situacao">${incidente.categoria}</div>
        </div>

        <img id="imagem-principal" src="https://via.placeholder.com/600x300"
             alt="Imagem da enxurrada" class="imagem-postagem">

        <div class="miniaturas">
            <c:choose>
                <c:when test="${not empty listaFotosIncidente}">
                    <c:forEach var="foto" items="${incidente.fotoIncidente}">
                        <img src="${foto.url}" alt="Imagem do incidente"
                             onclick="trocarImagemPrincipal('${foto.url}', 'imagem-principal-${incidente.id}')">
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <img src="https://via.placeholder.com/600x300/ff0000" alt="Imagem 1"
                         onclick="trocarImagemPrincipal('https://via.placeholder.com/600x300/ff0000')">
                    <img src="https://via.placeholder.com/600x300/00ff00" alt="Imagem 2"
                         onclick="trocarImagemPrincipal('https://via.placeholder.com/600x300/00ff00')">
                    <img src="https://via.placeholder.com/600x300/0000ff" alt="Imagem 3"
                         onclick="trocarImagemPrincipal('https://via.placeholder.com/600x300/0000ff')">
                </c:otherwise>
            </c:choose>
        </div>
        <%--
        <div class="informacao-postagem">
            <img src="${incidente.usuario.fotoPerfil}"
                 alt="Foto de ${incidente.usuario.nome} ${incidente.usuario.sobrenome}">
            <div>
                <div class="nome">${incidente.usuario.nome} ${incidente.usuario.sobrenome}</div>
                <div class="data">${incidente.dataHora}</div>
            </div>
            <div class="mensagem-postagem">${incidente.descricao}</div>
        </div>
        --%>
        <div class="reacoes">
            <button class="botao-curtir">
                <img src="" alt="">Curtir
            </button>
            <span id="contador-curtidas">Curtidas</span>
            <span class="contador-comentarios">Comentários</span>
        </div>

        <button class="botao-curtir" onclick="mostrarFormularioComentario()">Comentar</button>

        <div id="formulario-comentario" style="display: none;">
            <form id="form-comentario" action="inserir-comentario" method="post">
                <div class="formulario-grupo">
                    <input type="hidden" name="id-incidente" value="${incidente.id}">
                    <textarea name="conteudo" placeholder="Insira seu comentário" required maxlength="350"></textarea>
                </div>
                <div>
                    <button type="submit" class="botao-curtir">Enviar</button>
                    <button type="reset" onclick="ocultarFormularioComentario()">Cancelar</button>
                </div>
            </form>
        </div>

        <jsp:include page="../comentario/listar-comentarios.jsp" />

    </div>
</main>
</body>
</html>