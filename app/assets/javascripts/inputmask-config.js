import Inputmask from 'inputmask';

document.addEventListener("turbolinks:load", function() {
  Inputmask({"mask": "999.999.999-99"}).mask(document.getElementById("proponente_cpf"));
  Inputmask({"mask": "99999-999"}).mask(document.getElementById("proponente_cep"));
});
