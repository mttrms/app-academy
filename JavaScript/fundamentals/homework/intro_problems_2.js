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
