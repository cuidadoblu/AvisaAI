<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="popupMensagem" class="popup">
    <div class="popup-conteudo">
        <img src="../imagens/icon-success.png" alt="Ícone de sucesso" class="popup-icone"/>
        <span id="popupTexto"></span>
        <button id="fecharPopup" class="fechar-popup">&times;</button>
    </div>
</div>

<style>
    .popup {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        padding: 20px;
        background-color: #fff;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        z-index: 1000;
        max-width: 350px;
        text-align: center;
        font-size: 1em;
        align-items: center;
        gap: 15px;
        animation: expandir 0.4s ease-out, diminuir 0.4s ease-in 4s forwards;
    }

    .popup-conteudo {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .popup-icone {
        width: 40px;
        height: 40px;
    }

    .fechar-popup {
        background: none;
        border: none;
        color: #333;
        font-size: 1.2em;
        position: absolute;
        top: 5px;
        right: 10px;
        cursor: pointer;
    }

    @keyframes expandir {
        0% {
            transform: scale(0.8) translate(-50%, -50%);
            opacity: 0;
        }
        100% {
            transform: scale(1) translate(-50%, -50%);
            opacity: 1;
        }
    }

    @keyframes diminuir {
        0% {
            transform: scale(1) translate(-50%, -50%);
            opacity: 1;
        }
        100% {
            transform: scale(0.8) translate(-50%, -50%);
            opacity: 0;
        }
    }
</style>

<script>
    function mostrarPopup(mensagem, cor = '#fff', tempo = 2000) {

        const popup = document.getElementById('popupMensagem');
        const popupTexto = document.getElementById('popupTexto');
        const fecharPopup = document.getElementById('fecharPopup');

        popupTexto.textContent = mensagem;
        popup.style.backgroundColor = cor;
        popup.style.display = 'flex';

        fecharPopup.onclick = function () {
            popup.style.display = 'none';
        };

        setTimeout(() => {
            popup.style.display = 'none';
        }, tempo);
    }

    document.addEventListener("DOMContentLoaded", () => {

        <c:if test="${not empty mensagemPopup}">
        mostrarPopup("${mensagemPopup}");
        </c:if>
    });
</script>