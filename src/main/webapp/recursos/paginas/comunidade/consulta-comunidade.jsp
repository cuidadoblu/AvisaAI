<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/recursos/paginas/componentes/cabecalho.jsp"/>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8"/>
    <title>Consulta de Comunidades</title>
    <style>
        .container-comunidades {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            padding: 20px;
        }

        .card-comunidade {
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 15px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card-comunidade img {
            width: 100%;
            max-width: 150px;
            height: 150px;
            border-radius: 50%;
            margin-bottom: 10px;
        }

        .titulo-comunidade {
            font-size: 20px;
            font-weight: bold;
            color: #2d3e50;
            margin: 10px 0;
        }

        .descricao-comunidade {
            font-size: 14px;
            color: #666;
            margin-bottom: 10px;
        }

        .botao-acompanhar {
            display: inline-block;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #4f8ef7;
            color: white;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
        }

        .botao-acompanhar.desacompanhar {
            background-color: #ccc;
        }
    </style>
</head>
<body>
<form action="comunidades" method="get">
    <input type="text" name="nome" placeholder="Nome da comunidade"/>
    <button type="submit">Enviar</button>
</form>
<div class="container-comunidades">
    <c:forEach var="comunidade" items="${listaComunidades}">
        <div class="card-comunidade">
            <img src="${comunidade.fotoPerfil}" alt="Foto da comunidade ${comunidade.nome}"/>
            <div class="titulo-comunidade">${comunidade.nome}</div>
            <div class="descricao-comunidade">Sobre:<br/> ${comunidade.descricao}</div>
            <div class="botao-acompanhar">
            </div>
            <form>
                <button type="submit" class="botao-acompanhar">
                    <c:choose>
                        <c:when test="${comunidade.usuarios.contains(usuarioLogado)}">
                            <a href="desacompanhar?id-comunidade=${comunidade.id}" class="botao-acompanhar desacompanhar">Desacompanhar</a>
                        </c:when>
                        <c:otherwise>
                            <a href="acompanhar?id-comunidade=${comunidade.id}" class="botao-acompanhar">Acompanhar</a>
                        </c:otherwise>
                    </c:choose>
                </button>
            </form>
        </div>
    </c:forEach>
</div>
</body>
</html>
