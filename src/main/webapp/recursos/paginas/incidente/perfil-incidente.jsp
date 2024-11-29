<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../componentes/cabecalho.jsp"/>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>AvisaAí - Perfil Incidente</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/recursos/css/incidente/incidente.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/geral.css">
    <script>
        function trocarImagemPrincipal(id) {
            document.getElementById("imagem-principal").src = "exibir-foto?id-foto=" + id;
        }
    </script>
</head>
<body>
<div class="principal">
    <div class="coluna" id="esquerda"> Esquerda
        <!-- Conteúdo ou espaços laterais -->
    </div>

    <div class="coluna" id="meio">
        <div class="container-postagem">
            <div class="cabecalho-postagem">
                <div class="titulo-postagem">${incidente.titulo}</div>
                <div class="icone-situacao">${incidente.categoria}</div>
                <div class="galeria">
                    <c:choose>
                        <c:when test="${not empty incidente.fotosIncidente}">
                            <c:forEach var="foto" items="${incidente.fotosIncidente}">
                                <div class="item-foto">
                                    <img src="exibir-foto-incidente?id-incidente=${incidente.id}&foto-id=${foto.id}"
                                         alt="Imagem do incidente" class="imagem-postagem">
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="mensagem-sem-imagem">
                                Este incidente não possui imagens.
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="miniaturas">
                    <c:if test="${not empty fotosIncidente}">
                        <c:forEach var="foto" items="${fotosIncidente}">
                            <img src="exibir-foto?id-foto=${foto.id}" alt="Imagem do incidente"
                                 onclick="trocarImagemPrincipal(${foto.id})" class="miniatura-imagem">
                        </c:forEach>
                    </c:if>
                </div>

                 <div class="informacao-postagem">
                     <img src="exibir-foto?id-foto=${fotoPerfil.id}"
                          alt="Foto de ${usuario.nome} ${usuario.sobrenome}" class="imagem-usuario">

                     <div>
                         <div class="nome">${usuario.nome} ${usuario.sobrenome}</div>
                         <div class="data">${incidente.dataHora}</div>
                     </div>
                     <div class="mensagem-postagem">
                         ${incidente.descricao}
                     </div>
                 </div>

                <!-- Reações -->
                <div class="reacoes">
                    <button class="botao-curtir">
                        Curtir
                    </button>
                    <span id="contador-curtidas">Curtidas</span>
                    <span class="contador-comentarios">Comentários</span>
                </div>

                <!-- Comentários -->
                <jsp:include page="../comentario/cadastro-comentario.jsp"/>
                <jsp:include page="../componentes/listar-comentarios.jsp"/>
            </div>
        </div>

        <div class="coluna" id="direita"> Direita
            <!-- Conteúdo ou espaços laterais -->
        </div>
    </div>
</body>
</html>