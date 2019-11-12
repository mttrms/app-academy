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

Elephant.paradeHelper = function(elephant) {
  console.log(`${elephant.name} is trotting by!`)
}

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

herd.forEach(function(elephant) {
  Elephant.paradeHelper(elephant);
})

const dinerBreakfast = () => {
  let order = ['cheesy scrambled eggs'];
  console.log(`I'd like ${order.join(' and ')} please.`);
  
  return function(food) {
    order.push(food);
    console.log(`I'd like ${order.join(' and ')} please.`);
  }
}

let bfastOrder = dinerBreakfast();
bfastOrder('chocolate chip pancakes');
bfastOrder('grits');