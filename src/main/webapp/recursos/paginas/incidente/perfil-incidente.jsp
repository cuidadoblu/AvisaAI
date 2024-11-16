<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../componentes/cabecalho.jsp"/>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AvisaAí - Postagem de Incidente</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/recursos/imagens/logos/png/logo azul.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/incidente/incidente.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/geral.css">
    <script>
        function trocarImagemPrincipal(imagemUrl) {
            document.getElementById("imagem-principal").src = imagemUrl;
        }

        function responderComentario(comentarioId) {
            const respostaContainer = document.getElementById("resposta-"
                + comentarioId);
            respostaContainer.style.display = 'block';
        }

        function fecharResposta(comentarioId) {
            const respostaContainer = document.getElementById("resposta-"
                + comentarioId);
            respostaContainer.style.display = 'none';
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
            <img src="https://via.placeholder.com/600x300/ff0000" alt="Imagem 1"
                 onclick="trocarImagemPrincipal('https://via.placeholder.com/600x300/ff0000')">
            <img src="https://via.placeholder.com/600x300/00ff00" alt="Imagem 2"
                 onclick="trocarImagemPrincipal('https://via.placeholder.com/600x300/00ff00')">
            <img src="https://via.placeholder.com/600x300/0000ff" alt="Imagem 3"
                 onclick="trocarImagemPrincipal('https://via.placeholder.com/600x300/0000ff')">
        </div>
        <div class="informacao-postagem">
            <img src="${usuario.fotoPerfil}"
                 alt="Foto de ${usuario.nome} ${usuario.sobrenome}">
            <div>
                <div class="nome">${usuario.nome}${usuario.sobrenome}</div>
                <div class="data">${incidente.dataHora}</div>
            </div>
            <div class="mensagem-postagem">${incidente.descricao}</div>
        </div>
        <div class="reacoes">
            <button class="botao-curtir">
                <img src="" alt="">Curtir
            </button>
            <span id="contador-curtidas">Curtidas</span> <span
                class="contador-comentarios">Comentários</span>
        </div>
        <div class="campo-comentario">
            <form action="inserir-comentario" method="post">
                <div class="formulario-grupo">
                    <label for="novo-comentario">Adicionar comentário</label>
                    <textarea id="novo-comentario" name="novo-comentario"
                              placeholder="Escreva seu comentário aqui..." required></textarea>
                </div>
                <button type="submit" class="botao-enviar">Enviar
                    comentário
                </button>
            </form>
        </div>

        <div class="comentarios">
            <div class="comentario">
                <div>
                    <span class="nome">{comentario.usuario}</span> <span class="data">{comentario.dataHora}</span>
                </div>
                <div>${comentario.conteudo}</div>
                <button class="botao-responder"
                        onclick="responderComentario('comentario1')">Responder
                </button>

                <div id="resposta-comentario" class="respostas"
                     style="display: none;">
						<span class="fechar-resposta"
                              onclick="fecharResposta('comentario1')">&times;</span>
                    <form action="inserir-resposta" method="post">
							<textarea name="resposta" placeholder="Escreva sua resposta..."
                                      required></textarea>
                        <button type="submit" class="botao-enviar">Enviar
                            resposta
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>