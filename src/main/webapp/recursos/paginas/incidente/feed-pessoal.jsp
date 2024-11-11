<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../componentes/cabecalho.jsp"/>
<!DOCTYPE html>
<html lang="pt-br">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AvisaAi - Feed</title>
    <link rel="shortcut icon" href="img" type="image/x-icon">
</head>
<body>
<c:choose>
    <c:when test="${empty listaIncidentes}">
        <div class="mensagem-vazia">VocÃª ainda nÃ£o acompanha nenhuma
            comunidade.
        </div>
    </c:when>
    <c:otherwise>
        <c:forEach var="incidente" items="${listaIncidentes}">
            <jsp:include page="incidente.jsp">
                <jsp:param name="incidente" value="${incidente}"/>
            </jsp:include>
        </c:forEach>
    </c:otherwise>
</c:choose>
</body>
</html>