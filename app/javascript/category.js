function category(){

  const button = document.getElementById("category-list")
  const parents = document.getElementById("pull-down")

  button.addEventListener('mouseover', function(){
    this.setAttribute("style", "background-color:gainsboro;")
    parents.setAttribute("style", "display:block;")
  })
  button.addEventListener('mouseout', function(){
    this.removeAttribute("style", "background-color:gainsboro;")
    parents.setAttribute("style", "display:none;")
  })
}

window.addEventListener('load', category)