// app/javascript/application.js
import "@hotwired/turbo-rails"
import "controllers"
import "./loading"

// app/javascript/loading.js など
document.addEventListener("DOMContentLoaded", () => {
    const form = document.getElementById("mood-form");
    const loading = document.getElementById("loading");
  
    if (form) {
      form.addEventListener("submit", () => {
        loading.style.display = "block"; // ローディング表示
      });
    }
  });
  
