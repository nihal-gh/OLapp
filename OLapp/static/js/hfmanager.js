class SpecialHeader extends HTMLElement {
  constructor() {
    super();
  }
}

class SpecialFooter extends HTMLElement {
  constructor() {
    super();
  }
}

customElements.define("special-header", SpecialHeader);
customElements.define("special-footer", SpecialFooter);

document.addEventListener("DOMContentLoaded", function () {
  // Load the header
  fetch("header.html")
    .then((response) => response.text())
    .then((data) => {
      document.querySelector("special-header").innerHTML = data;
    });

  // Load the donation cards first
  fetch("donation-cards.html")
    .then((response) => response.text())
    .then((data) => {
      document.getElementById("donation-cards").innerHTML = data;

      // Once donation cards are loaded, load the footer
      fetch("footer.html")
        .then((response) => response.text())
        .then((data) => {
          document.querySelector("special-footer").innerHTML = data;
        });
    });

  // Load the team section
  fetch("team-section.html")
    .then((response) => response.text())
    .then((data) => {
      document.getElementById("team-section").innerHTML = data;
    })
    .catch((error) => {
      console.error("Error loading the team section:", error);
    });
});
