(function () {
    var passwordInput = document.getElementById("txtPassword");
    var toggleButton = document.getElementById("togglePassword");
    var usernameInput = document.getElementById("txtUsername");

    if (usernameInput) {
        setTimeout(function () {
            usernameInput.focus();
        }, 300);
    }

    if (passwordInput && toggleButton) {
        toggleButton.addEventListener("click", function () {
            var isPassword = passwordInput.getAttribute("type") === "password";

            passwordInput.setAttribute("type", isPassword ? "text" : "password");
            toggleButton.innerHTML = isPassword ? "إخفاء" : "إظهار";
        });
    }

    document.addEventListener("keydown", function (event) {
        if (event.key === "Enter") {
            var activeElement = document.activeElement;

            if (activeElement && activeElement.tagName && activeElement.tagName.toLowerCase() === "input") {
                var loginButton = document.querySelector(".login-button");

                if (loginButton) {
                    loginButton.click();
                }
            }
        }
    });
})();