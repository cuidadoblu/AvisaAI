<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AvisaAi - Feed</title>
    <link rel="shortcut icon" href="img" type="image/x-icon">
</head>
<body>
<div class="container-postagem">
    <div class="cabecalho-postagem">
        <div class="titulo-postagem">${incidente.titulo}</div>
        <div class="icone-situacao">🌧️ ${incidente.categoria}</div>
    </div>
    <div class="conteudo-cabeçalho">
        <img id="imagem-principal-${incidente.id}" src="${incidente.fotoIncidente[0].url}" alt="Imagem do incidente"
             class="imagem-postagem">
        <div class="informacao-postagem">
            <img src="${incidente.usuario.fotoPerfil}" alt="Imagem do usuário" class="imagem-usuario">
            <div>
                <div class="nome-data">${incidente.usuario.nome} ${incidente.usuario.sobrenome}</div>
                <div class="data">${incidente.dataHora.format(java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"))}</div>
            </div>
            <div class="mensagem-postagem">${incidente.descricao}</div>
            <div class="reacoes">
                <button class="botao-curtir">👍</button>
                <span id="contador-curtidas">${incidente.curtidas} curtidas</span>
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
    <div class="comentarios">
        <c:forEach var="comentario" items="${incidente.comentarios}">
            <div class="comentario">
                <span class="nome-comentario">${comentario.usuario.nome}</span>
                <span class="data-comentario">${comentario.dataHora.format(java.time.format.DateTimeFormatter.ofPattern("dd/MM HH:mm"))}</span>
                <div>${comentario.texto}</div>
                <button class="botao-responder" onclick="responderComentario('${comentario.id}')">Responder</button>
                <div id="resposta-${comentario.id}" class="respostas" style="display: none;">
                    <span class="fechar-resposta" onclick="fecharResposta('${comentario.id}')">&times;</span>
                    <form action="responder-comentario" method="post">
                        <textarea name="resposta" placeholder="Escreva sua resposta..." required></textarea>
                        <button type="submit" class="botao-enviar">Enviar resposta</button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
