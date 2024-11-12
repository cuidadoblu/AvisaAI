<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../componentes/cabecalho.jsp"/>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AvisaAí - Feed Pessoal</title>
    <style>
        /* Estilos para o feed e mensagem vazia */
        .mensagem-vazia {
            text-align: center;
            margin-top: 40px;
            font-size: 18px;
            color: #666;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .feed-container {
            width: 100%;
            max-width: 1000px;
            margin: 40px auto;
            padding: 20px;
        }
    </style>
</head>
<body>
<main class="feed-container">
    <c:choose>
        <c:when test="${empty listaIncidentes}">
            <div class="mensagem-vazia">
                Você ainda não acompanha nenhuma comunidade.
            </div>
        </c:when>
        <c:otherwise>
            <c:forEach var="incidente" items="${listaIncidentes}">
                <jsp:include page="../componentes/incidente.jsp">
                    <jsp:param name="incidente" value="${incidente}"/>
                </jsp:include>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</main>
</body>
</html>