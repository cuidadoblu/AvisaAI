<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/componentes/popup.css">
<div id="popupMensagem" class="popup">
    <div class="popup-conteudo">
        <img src="../imagens/icon-success.png" alt="Ícone de sucesso" class="popup-icone"/>
        <span id="popupTexto"></span>
        <button id="fecharPopup" class="fechar-popup">&times;</button>
    </div>
</div>
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