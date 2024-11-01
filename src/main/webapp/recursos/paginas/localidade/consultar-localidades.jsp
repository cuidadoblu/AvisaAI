<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../componentes/cabecalho.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Lista de Localidades</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #2d3e50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .acoes {
            display: flex;
            gap: 10px;
        }

        .acoes img {
            cursor: pointer;
            width: 16px;
            height: 16px;
        }
    </style>
</head>
<body>
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
                    <td>
                        <c:choose>
                            <c:when test="${not empty localidade.comunidade}">
                                <span style="color: green;">● ${localidade.comunidade}</span>
                            </c:when>
                            <c:otherwise>
                                <span style="color: red;">●</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td class="acoes">
                        <a href="editar-localidade?id-localidade=${localidade.id}">
                            <img src="../../recursos/icones/editar.png" alt="Editar">
                        </a>
                        <a href="excluir-localidade?id-localidade=${localidade.id}">
                            <img src="../../recursos/icones/excluir.png" alt="Excluir">
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>
</body>
</html>