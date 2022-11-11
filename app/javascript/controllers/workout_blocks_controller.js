import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="workout-blocks"
export default class extends Controller {
    initialize() {

    }
    connect() {

    }
    toggleForm(event) {
        event.preventDefault();
        event.stopPropagation();
        const formID = event.params["form"];
        const workoutBlockBodyID = event.params["body"];
        const form = document.getElementById(formID);
        form.classList.toggle("d-none");
        const workoutBlockBody = document.getElementById(workoutBlockBodyID);
        workoutBlockBody.classList.toggle("d-none");
    }
}
