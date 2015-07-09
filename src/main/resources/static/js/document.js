var inputs = document.querySelectorAll('input');
var textarea = document.querySelectorAll('textarea');
var button = document.querySelectorAll('button');


for (var i = 0; i < inputs.length; i++) {
	inputs[i].setAttribute('disabled', 'disabled');
}

for (var i = 0; i < textarea.length; i++) {
	textarea[i].setAttribute('disabled', 'disabled');
}

for (var i = 0; i < button.length; i++) {
	button[i].setAttribute('hidden', 'hidden');
}