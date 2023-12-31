document.addEventListener("DOMContentLoaded", function () {
  const nombreUsuarioInput = document.getElementById("nombreUsuario");
  const nombreUsuarioValidation = document.getElementById(
    "nombreUsuarioValidation"
  );

  const apellidoUsuarioInput = document.getElementById("apellidoUsuario");
  const apellidoUsuarioValidation = document.getElementById(
    "apellidoUsuarioValidation"
  );

  const emailInput = document.getElementById("email");
  const emailValidation = document.getElementById("emailValidation");

  const passwordInput = document.getElementById("password");
  const passwordValidation = document.getElementById("passwordValidation");

  const imageInput = document.getElementById("profile-image");
  const imageValidation = document.getElementById("imageValidation");
  const imagenActual = document.getElementById("imagenActual");
  const form = document.getElementById("edit-profile");

  function showError(input, validation, message) {
    validation.innerHTML = message;
    validation.style.display = "block";
  }

  function hideError(input, validation) {
    validation.innerHTML = "";
    validation.style.display = "none";
    input.classList.remove("input-error");
  }

  function validateLength(value, minLength) {
    return value.length >= minLength;
  }

  function validateLetters(value) {
    const regex = /^[a-zA-Z]+$/;
    return regex.test(value);
  }

  function validateEmail(value) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(value);
  }

  function validatePassword(value) {
    const isEmpty = value.trim() === "";
    const minLength = 8;
    const uppercaseRegex = /[A-Z]/;
    const lowercaseRegex = /[a-z]/;
    const digitRegex = /\d/;
    const specialCharacterRegex = /[!@#$%^&*(),.?":{}|<>]/;

    const errorMessages = [];

    if (!isEmpty) {
      if (value.length < minLength) {
        errorMessages.push("- La contraseña debe tener al menos 8 caracteres.");
      }

      if (!uppercaseRegex.test(value)) {
        errorMessages.push("- Debe contener al menos una letra mayúscula.");
      }

      if (!lowercaseRegex.test(value)) {
        errorMessages.push("- Debe contener al menos una letra minúscula.");
      }

      if (!digitRegex.test(value)) {
        errorMessages.push("- Debe contener al menos un número.");
      }

      if (!specialCharacterRegex.test(value)) {
        errorMessages.push(
          `- Debe contener al menos un carácter especial: ${specialCharacterRegex}`
        );
      }
    }

    return { isEmpty, errorMessages };
  }

  function validateInput(
    input,
    validation,
    minLength,
    requiredMessage,
    lengthMessage,
    lettersMessage
  ) {
    const value = input.value.trim();

    if (value === "") {
      showError(input, validation, requiredMessage);
    } else {
      if (!validateLength(value, minLength)) {
        showError(input, validation, lengthMessage);
      } else {
        if (input === nombreUsuarioInput || input === apellidoUsuarioInput) {
          if (!validateLetters(value)) {
            showError(input, validation, lettersMessage);
          } else {
            hideError(input, validation);
          }
        }

        if (input === emailInput) {
          if (!validateEmail(value)) {
            showError(input, validation, "Correo electrónico no válido");
          } else {
            hideError(input, validation);
          }
        }

        if (input === passwordInput) {
          const passwordErrors = validatePassword(value);
          if (passwordErrors.length > 0) {
            showError(
              passwordInput,
              passwordValidation,
              passwordErrors.join("<br/>")
            );
            return false;
          } else {
            hideError(passwordInput, passwordValidation);
            return true;
          }
        }
      }
    }
  }

  nombreUsuarioInput.addEventListener("blur", function () {
    validateInput(
      nombreUsuarioInput,
      nombreUsuarioValidation,
      2,
      "Este campo es obligatorio",
      "El nombre debe tener al menos 2 caracteres",
      "Ingrese solo letras"
    );
  });

  apellidoUsuarioInput.addEventListener("blur", function () {
    validateInput(
      apellidoUsuarioInput,
      apellidoUsuarioValidation,
      2,
      "Este campo es obligatorio",
      "El apellido debe tener al menos 2 caracteres",
      "Ingrese solo letras"
    );
  });

  emailInput.addEventListener("blur", function () {
    validateInput(emailInput, emailValidation, 1, "Este campo es obligatorio");
  });
  passwordInput.addEventListener("blur", function () {
    const { isEmpty, errorMessages } = validatePassword(
      passwordInput.value.trim()
    );

    if (isEmpty) {
      hideError(passwordInput, passwordValidation);
    } else if (errorMessages.length > 0) {
      showError(passwordInput, passwordValidation, errorMessages.join("<br/>"));
    } else {
      hideError(passwordInput, passwordValidation);
    }
  });

  function validateImage(file) {
    console.log("Validating image...");

    if (file) {
      const allowedExtensions = ["jpg", "jpeg", "png", "gif"];
      const fileName = file.name.toLowerCase();
      const fileExtension = fileName.split(".").pop();

      console.log("File Extension:", fileExtension);

      if (!allowedExtensions.includes(fileExtension)) {
        console.log("Invalid file format.");
        showError(
          imageInput,
          imageValidation,
          "Formato de archivo no válido. Por favor, selecciona un archivo JPG, JPEG, PNG o GIF."
        );
        return false;
      } else {
        let reader = new FileReader();
        reader.onload = function (e) {
          imagenActual.src = e.target.result;
        };
        reader.onerror = function (e) {};
        reader.readAsDataURL(file);
        return true;
      }
    } else {
      return true;
    }
  }
  imageInput.addEventListener("input", function () {
    file = this.files[0]; // Obtén el primer archivo seleccionado
    validateImage(file);
  });
});
