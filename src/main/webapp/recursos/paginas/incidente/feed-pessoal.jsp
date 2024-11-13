<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <div class="coluna-esquerda">
        <h2>Esquerda</h2>
    </div>

    <div class="coluna-principal">
        <jsp:include page="../componentes/feed-incidentes.jsp" />
    </div>

    <div class="coluna-direita">
        <h2>Direita</h2>

    </div>
</div>
</body>
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center;
        background-color: #ffffff;
    }

    .layout-container {
        display: grid;
        grid-template-columns: 2fr 8fr 2fr;
        gap: 20px;
        width: 100%;
        max-width: 1200px;
        padding: 20px;
        box-sizing: border-box;
    }

    .coluna-esquerda,
    .coluna-direita {
        background-color: #ffffff;
        padding: 15px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .coluna-principal {
        background-color: #ffffff;
        padding: 15px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
</style>
</html>