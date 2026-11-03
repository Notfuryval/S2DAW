const toggle = document.querySelector(".menu-toggle");
const nav = document.querySelector(".menu");

toggle.addEventListener("click", () => {
  const abierto = nav.classList.toggle("active");

  toggle.setAttribute("aria-expanded", String(abierto));
  toggle.setAttribute("aria-label", abierto ? "Cerrar menú" : "Abrir menú");
});