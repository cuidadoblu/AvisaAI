<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../componentes/cabecalho.jsp"/>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Lista de Localidades</title>
    <link rel="stylesheet" type="text/css" href="../../css/localidade/localidade.css">
    <link rel="shortcut icon" href="img" type="image/x-icon">
</head>
<body class="consultar-localidades">>
<h2>Consulta de Localidades</h2>
<form method="get" action="localidades">
    <input type="text" name="parametro" id="parametro" placeholder="Digite o endereço">
    <button type="submit">Pesquisar</button>
</form>

<c:choose>
    <c:when test="${empty listaLocalidades}">
        <p>Nenhuma localidade encontrada.</p>
    </c:when>
    <c:otherwise>
        <table>
            <thead>
            <tr>
                <th>Estado</th>
                <th>Cidade</th>
                <th>Bairro</th>
                <th>Logradouro</th>
                <th>Comunidade</th>
                <th>Funções</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="localidade" items="${listaLocalidades}">
                <tr>
                    <td>${localidade.estado}</td>
                    <td>${localidade.cidade}</td>
                    <td>${localidade.bairro}</td>
                    <td>${localidade.logradouro}</td>
                    <td><c:choose>
                        <c:when test="${not empty localidade.comunidade}">
                            <span style="color: green;">● ${localidade.comunidade}</span>
                        </c:when>
                        <c:otherwise>
                            <span style="color: red;">●</span>
                        </c:otherwise>
                    </c:choose></td>
                    <td class="acoes"><a href="editar-localidade?id-localidade=${localidade.id}">Editar<img src="" alt="Editar"></a>
                        <a href="excluir-localidade?id-localidade=${localidade.id}">Excluir<img src="" alt="Excluir"></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>
<script src="<%= request.getContextPath() %>/recursos/js/localidade/localidade.js"></script>
</body>
</html>