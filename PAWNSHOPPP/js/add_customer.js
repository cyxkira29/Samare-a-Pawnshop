document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("pawnForm");

    if (form) {
        form.addEventListener("submit", function (event) {
            event.preventDefault(); // Prevent page reload

            let birthdayValue = document.getElementById("birthday").value.trim();
            let customerData = {
                firstname: document.getElementById("firstname").value.trim(),
                middle_initial: document.getElementById("middle_initial").value.trim(),
                lastname: document.getElementById("lastname").value.trim(),
                birthday: birthdayValue === "" ? null : birthdayValue, // Allow null if empty
                address: document.getElementById("address").value.trim(),
                nationality: document.getElementById("nationality").value.trim(),
                gender: document.getElementById("gender").value
            };

            fetch("http://localhost/PAWNSHOPPP/php/add_customer.php", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(customerData)
            })
                .then(response => response.text()) // Get raw response first
                .then(text => {
                    console.log("Raw Response:", text); // Log raw response
                    try {
                        let data = JSON.parse(text); // Try to parse JSON
                        console.log("Parsed JSON:", data);
                        if (data.status === "success") {
                            alert("✅ " + data.message);
                            form.reset();
                        } else {
                            alert("❌ " + data.message);
                        }
                    } catch (e) {
                        console.error("JSON Parse Error:", e);
                        alert("❌ JSON Parse Error. Check console.");
                    }
                })
                .catch(error => {
                    console.error("Fetch Error:", error);
                    alert("❌ Fetch Error. Check console.");
                });
        });
    } else {
        console.error("❌ Form with ID 'pawnForm' not found in the DOM.");
    }
});
