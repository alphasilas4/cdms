document.addEventListener("DOMContentLoaded", () => {

    // 🔍 Live Search
    const searchInput = document.getElementById("searchInput");

    searchInput.addEventListener("keyup", function () {
        let value = this.value.toLowerCase();
        let rows = document.querySelectorAll("#cadetTable tr");

        rows.forEach(row => {
            let text = row.innerText.toLowerCase();
            row.style.display = text.includes(value) ? "" : "none";
        });
    });

    // 👁️ View Cadet Details
    document.querySelectorAll(".viewBtn").forEach(button => {
        button.addEventListener("click", function () {
            let cadetId = this.dataset.id;

            fetch(`view_cadet.php?id=${cadetId}`)
                .then(res => res.json())
                .then(data => {
                    showCadetModal(data);
                })
                .catch(err => console.error(err));
        });
    });

});

// 📦 Modal Builder
function showCadetModal(data) {
    let modal = document.createElement("div");
    modal.className = "modal fade show";
    modal.style.display = "block";

    modal.innerHTML = `
        <div class="modal-dialog modal-lg">
            <div class="modal-content bg-dark text-white">
                <div class="modal-header">
                    <h5 class="modal-title">${data.surname} ${data.other_names}</h5>
                    <button class="btn-close" onclick="this.closest('.modal').remove()"></button>
                </div>
                <div class="modal-body">
                    <p><strong>NDA No:</strong> ${data.nda_no}</p>
                    <p><strong>Course:</strong> ${data.course}</p>
                    <p><strong>Battalion:</strong> ${data.battalion}</p>
                    <p><strong>Status:</strong> ${data.status}</p>
                </div>
            </div>
        </div>
    `;

    document.body.appendChild(modal);
}