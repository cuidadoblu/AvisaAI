<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../componentes/cabecalho.jsp"/>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AvisaAí - Feed Pessoal</title>
</head>
<body>
<div class="layout-container">
    <div class="colunas" id="esquerda"></div>

    <div class="colunas" id="principal">
        <jsp:include page="../componentes/feed-incidentes.jsp"/>
    </div>

    <div class="colunas" id="direita"></div>
</div>
</body>
<style>
    * {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
    }

    body {
        background-color: #ffffff;
        height: 100vh;
        width: 100vw;
    }

    .layout-container {
        display: grid;
        grid-template-columns: 2fr 8fr 2fr;
        gap: 20px;
        width: 100%;
        height: calc(100vh - 80px);
        box-sizing: border-box;
    }
</style>
</html>