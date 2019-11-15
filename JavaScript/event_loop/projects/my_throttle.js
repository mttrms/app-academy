Function.prototype.myThrottle = function(interval) {
  let tooSoon = false;

  return () => {
    if (tooSoon === false) {
      tooSoon = true;
      setTimeout(() => {
        tooSoon = false
      }, 500)
      this();
    }
  }
}

class Missile {
  fire() {
    console.log("Firing!")
  }
}

const missile = new Missile;
missile.fire = missile.fire.myThrottle(500);

setInterval(() => {
  missile.fire();
}, 10);
