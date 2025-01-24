window.addEventListener("scroll", function () {
  var navbar = document.getElementById("fixed-nav");
  if (window.scrollY > 50) {
    navbar.style.background =
      "linear-gradient(to bottom, rgba(255, 255, 255, 0.9), rgba(255, 255, 255, 1))"; // Gradient effect when scrolled
    navbar.style.boxShadow = "0 4px 10px rgba(0, 0, 0, 0.1)"; // Add slight shadow for depth
  } else {
    navbar.style.background =
      "linear-gradient(to bottom, rgba(244, 161, 98, 0.9), rgba(244, 161, 98, 1))"; // Original gradient color
    navbar.style.boxShadow = "none"; // Remove shadow when at the top
  }
});
//donations stats
document.addEventListener("DOMContentLoaded", function () {
  fetch("/donation_stats")
    .then((response) => response.json())
    .then((data) => {
      animateNumber("total-people", data.total_people, 2000);
      animateNumber("total-donated", data.total_donated, 2000, "₹");
    })
    .catch((error) => console.error("Error fetching donation stats:", error));
});

function animateNumber(elementId, targetNumber, duration, prefix = "") {
  const element = document.getElementById(elementId);
  let startNumber = 0;
  const step = Math.max(1, Math.floor(targetNumber / (duration / 10))); // Calculate step based on total amount

  const timer = setInterval(() => {
    startNumber += step;
    if (startNumber >= targetNumber) {
      startNumber = targetNumber; // Ensure the final number matches the target exactly
      clearInterval(timer);
    }
    element.innerText = prefix + startNumber.toLocaleString(); // Format with commas
  }, 10); // Update every 10ms
}

document
  .getElementById("contactForm")
  .addEventListener("submit", function (event) {
    event.preventDefault(); // Prevent the form from submitting

    // Show the popup
    document.getElementById("popup").style.display = "block";
    this.reset();
  });

document.getElementById("closePopup").addEventListener("click", function () {
  // Close the popup
  document.getElementById("popup").style.display = "none";
});

document.addEventListener("DOMContentLoaded", function () {
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
