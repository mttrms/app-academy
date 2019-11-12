const titleize = (arr, cb) => {
  names = arr.map(function(name) {
    return `Mx. ${name} Jingleheimer Schmidt`;
  })

  cb(names);
}

const printCallback = (arr) => {
  arr.forEach(function(element) {
    console.log(element);
  })
}

function Elephant(name, height, tricksArr) {
  this.name = name;
  this.height = height;
  this.tricks = tricksArr;
}

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes woooooooo`);
}

Elephant.prototype.grow = function() {
  this.height += 12;
}

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
}

Elephant.prototype.play = function() {
  trickIndex = Math.floor(Math.random() * this.tricks.length)
  console.log(`${this.name} is ${this.tricks[trickIndex]}`)
}