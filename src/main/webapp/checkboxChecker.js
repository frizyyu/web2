document.getElementById('x-2').addEventListener('change', function(event) {
    event.preventDefault();
    handleCheckboxChange(event.target);
});
document.getElementById('x-1.5').addEventListener('change', function(event) {
    event.preventDefault();
    handleCheckboxChange(event.target);
});
document.getElementById('x-1').addEventListener('change', function(event) {
    event.preventDefault();
    handleCheckboxChange(event.target);
});
document.getElementById('x-0.5').addEventListener('change', function(event) {
    event.preventDefault();
    handleCheckboxChange(event.target);
});
document.getElementById('x0').addEventListener('change', function(event) {
    event.preventDefault();
    handleCheckboxChange(event.target);
});
document.getElementById('x0.5').addEventListener('change', function(event) {
    event.preventDefault();
    handleCheckboxChange(event.target);
});
document.getElementById('x1').addEventListener('change', function(event) {
    event.preventDefault();
    handleCheckboxChange(event.target);
});
document.getElementById('x1.5').addEventListener('change', function(event) {
    event.preventDefault();
    handleCheckboxChange(event.target);
});
document.getElementById('x2').addEventListener('change', function(event) {
    event.preventDefault();
    handleCheckboxChange(event.target);
});
function handleCheckboxChange(selectedCheckbox) {
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
    checkboxes.forEach(checkbox => {
        if (checkbox !== selectedCheckbox) {
            checkbox.checked = false;
            checkbox.disabled = selectedCheckbox.checked;
        }
    });
}