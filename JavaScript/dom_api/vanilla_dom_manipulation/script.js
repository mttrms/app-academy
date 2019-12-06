document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });

  const submitButton = document.querySelector('.list-container form');

  submitButton.addEventListener('submit', (e) => {
    e.preventDefault();

    const favoritePlace = document.querySelector('.favorite-input');
    const ul = document.getElementById('sf-places')
    const li = document.createElement("li");

    li.textContent = favoritePlace.value;
    ul.appendChild(li);
    favoritePlace.value = '';
  })
});
