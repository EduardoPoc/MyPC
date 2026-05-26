const parametro = new URLSearchParams(window.location.search);

const campoID = document.getElementById("id");
const campoNome = document.getElementById("nome");
const campoEmail = document.getElementById("email");

campoID.value = paremetro.get("id");
campoNome.value = paremetro.get("nome");
campoEmail.value = paremetro.get("email");
