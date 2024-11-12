<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="container-postagem">
    <style>
        .container-postagem {
            width: 100%;
            max-width: 1000px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .cabecalho-postagem {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .titulo-postagem {
            font-size: 20px;
            font-weight: bold;
            color: #333;
        }

        .icone-situacao {
            color: #3498DB;
            font-size: 14px;
        }

        .conteudo-cabeçalho {
            display: flex;
            align-items: flex-start;
            gap: 15px;
        }

        .imagem-postagem {
            width: 50%;
            max-width: 400px;
            border-radius: 8px;
        }

        .informacao-postagem {
            flex-grow: 1;
            font-size: 14px;
            color: #444;
        }

        .informacao-postagem .imagem-usuario {
            border-radius: 50%;
            width: 40px;
            height: 40px;
            object-fit: cover;
            margin-bottom: 5px;
        }

        .nome-data {
            font-weight: bold;
        }

        .data {
            color: #888;
            font-size: 12px;
        }

        .mensagem-postagem {
            margin-top: 10px;
        }

        .miniaturas {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }

        .miniaturas img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 5px;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .miniaturas img:hover {
            transform: scale(1.1);
        }

        .reacoes {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-top: 10px;
        }

        .botao-curtir {
            background-color: #3498DB;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 8px 12px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        .botao-curtir:hover {
            background-color: #2C3E50;
        }

        .comentarios {
            border-top: 1px solid #e0e0e0;
            padding-top: 10px;
            margin-top: 10px;
        }
    </style>

    <div class="cabecalho-postagem">
        <div class="titulo-postagem">${incidente.titulo}</div>
        <div class="icone-situacao">🌧️ ${incidente.categoria}</div>
    </div>

    <div class="conteudo-cabeçalho">
        <img id="imagem-principal-${incidente.id}" src="${incidente.fotoIncidente[0].url}" alt="Imagem do incidente"
             class="imagem-postagem">
        <div class="informacao-postagem">
            <img src="${incidente.usuario.fotoPerfil}" alt="Imagem do usuário" class="imagem-usuario">
            <div class="nome-data">${incidente.usuario.nome} ${incidente.usuario.sobrenome}</div>
            <div class="data">${incidente.dataHora.format(java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"))}</div>
            <div class="mensagem-postagem">${incidente.descricao}</div>
            <div class="reacoes">
                <button class="botao-curtir">👍 Curtir</button>
                <span>${incidente.curtidas} curtidas</span>
                <button class="botao-curtir">Comentar</button>
            </div>
        </div>
    </div>

    <!-- Miniaturas de imagens -->
    <div class="miniaturas">
        <c:forEach var="foto" items="${incidente.fotoIncidente}">
            <img src="${foto.url}" alt="Imagem do incidente"
                 onclick="trocarImagemPrincipal('${foto.url}', 'imagem-principal-${incidente.id}')">
        </c:forEach>
    </div>

    <!-- Comentários -->
    <div class="comentarios">
        <c:forEach var="comentario" items="${incidente.comentarios}">
            <div class="comentario">
                <span class="nome-comentario">${comentario.usuario.nome}</span>
                <span class="data-comentario">${comentario.dataHora.format(java.time.format.DateTimeFormatter.ofPattern("dd/MM HH:mm"))}</span>
                <div>${comentario.texto}</div>
                <button class="botao-curtir" onclick="responderComentario('${comentario.id}')">Responder</button>
                <!-- Respostas -->
                <div id="resposta-${comentario.id}" class="respostas" style="display: none;">
                    <form action="responder-comentario" method="post">
                        <textarea name="resposta" placeholder="Escreva sua resposta..." required></textarea>
                        <button type="submit" class="botao-curtir">Enviar resposta</button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>

    <script>
        function trocarImagemPrincipal(imagemUrl, imagemId) {
            document.getElementById(imagemId).src = imagemUrl;
        }

        function responderComentario(comentarioId) {
            respostaContainer.style.display = 'block';
        }

        function fecharResposta(comentarioId) {
            const respostaContainer = document.getElementById("resposta-" + comentarioId);
            respostaContainer.style.display = 'none';
        }
    </script>
</div>