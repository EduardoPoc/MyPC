const formCadastro = document.getElementById("form-cadastro");

formCadastro.addEventListener("submit", (e) => {
  const campoNome = document.getElementById("nome");
  const campoEmail = document.getElementById("email");

  const nome = campoNome.value.trim();
  const email = campoEmail.value.trim();
  /*
  if (nome == "" || email == "") {
    e.preventDefault();
    alert("prencha todos os campos!");
  }*/
});
