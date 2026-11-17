function validarCadastro() {
  const nome = document.getElementById("nome").value.trim();
  const email = document.getElementById("email").value.trim();
  const matricula = document.getElementById("matricula").value.trim();
  const perfil = document.getElementById("perfil").value;
  const curso = document.getElementById("curso").value.trim();
  const turno = document.getElementById("turno").value;
  const senha = document.getElementById("senha").value;
  const confirmarSenha = document.getElementById("confirmarSenha").value;
  const termos = document.getElementById("termos").checked;

  if (!nome || !email || !matricula || !perfil || !curso || !turno || !senha || !confirmarSenha || !termos) {
    Swal.fire({
      icon: "error",
      title: "Campos obrigatórios",
      text: "Preencha todos os campos antes de continuar."
    });
    return;
  }

  if (senha.length < 6) {
    Swal.fire({
      icon: "warning",
      title: "Senha curta",
      text: "A senha deve ter no mínimo 6 caracteres."
    });
    return;
  }

  if (senha !== confirmarSenha) {
    Swal.fire({
      icon: "warning",
      title: "Senhas diferentes",
      text: "A senha e a confirmação devem ser iguais."
    });
    return;
  }

  Swal.fire({
    icon: "success",
    title: "Cadastro realizado!",
    text: "O usuário foi cadastrado com sucesso."
  });

  document.getElementById("formCadastro").reset();
}

document.getElementById("formCadastro").addEventListener("submit", function (event) {
  event.preventDefault();
  validarCadastro();
});