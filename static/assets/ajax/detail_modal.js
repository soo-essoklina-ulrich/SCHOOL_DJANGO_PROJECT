// Code: detail_modal.js
    $(document).ready(function() {$('.detail-button').click(function () {
        var projectId = $(this).data('project-id');
        var projectModal = $('#Modal');
        var projectTitle = $('#exampleModalLabel');
        var projectBody = $('.modal-body');

        // Faites une requête AJAX pour obtenir les détails du projet
        $.ajax({
            url: '/views/' + projectId + '/',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                projectTitle.text(data.title);
                projectBody.html(`
                <p><strong>Titre:</strong> ${data.title}</p>
                <p><strong>Sujet:</strong> ${data.subject}</p>
                <p><strong>Statut:</strong> ${data.status}</p>
                <p><strong>Créé le:</strong> ${data.created_at}</p>
                <p><strong>Termine le:</strong> ${data.end_at}</p>
                <p><strong>Enseignant:</strong> ${data.Enseignant}</p>
                <p><strong>Assigné à l'élève:</strong> ${data.assigned_to_eleve}</p>
                <p><strong>Matière:</strong> ${data.matiere}</p>
                <p><a href="${data.project_file}" target="_blank">Lien vers le fichier du projet</a></p>
              `);
                projectModal.modal('show');
                
            },
            error: function (error) {
                console.log(error);
            }
        });
    })});


