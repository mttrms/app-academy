// Simple timeout
window.setTimeout(function() {
  alert('hammer time');
}, 5000)

// Timeout plus closure
const hammerTime = (time) => {
 window.setTimeout(function () {
   alert(`${time} is hammertime!`);
 })
}
