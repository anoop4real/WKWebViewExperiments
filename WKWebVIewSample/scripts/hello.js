function sayHelloTo(name) {
  alert(name + 'Hello');
}
function alertMe(text) {
    alert(text + '-> in hello.js');
}
function leftTapped() {
    alert('Left');
}
function rightTapped() {
    alert('right');
}
function helloJSCore() {
    return "Hello JS Core";
}
window.onload=function () { window.webkit.messageHandlers.sizeNotification.postMessage({width: document.width, height: document.body.scrollHeight});};
var clickmebutton = document.getElementById('ClickMe');
clickmebutton.addEventListener('click', function() {
                               window.webkit.messageHandlers.clicked.postMessage('clicked');
                               }, false);
