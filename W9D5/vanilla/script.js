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



  // adding SF places as list items

  document.querySelector(".list-container > form").addEventListener("submit", (e) => {
    e.preventDefault();
    const input = e.currentTarget.querySelector('.favorite-input');
    const text = input.value;
    input.value = "";

    const ul = document.getElementById("sf-places");
    const li = document.createElement("li");
    li.innerText = text;

    ul.appendChild(li);
  })


  // adding new photos

  document.getElementsByClassName("photo-show-button")[0].addEventListener("click", () => {
    const photoForm = document.getElementsByClassName("photo-form-container")[0];
    let toggle = "hidden";
    let classes = photoForm.classList;
    classes.contains(toggle) ? classes.remove(toggle) : classes.add(toggle);
  })

  document.querySelector(".photo-form-container > form").addEventListener("submit", (e) => {
    e.preventDefault();
    let form = e.currentTarget;
    let input = form.querySelector('.photo-url-input');
    let url = input.value;
    input.value = "";

    const li = document.createElement("li");
    document.querySelector(".dog-photos").appendChild(li);
    const img = document.createElement("img");
    img.setAttribute("src", url);
    li.appendChild(img);
  })


});
