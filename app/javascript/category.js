window.addEventListener('load', function(){

  const pullDownButton = document.getElementById("category-list")
  const pullDownParents = document.getElementById("pull-down")

  pullDownButton.addEventListener('mouseover', function(){
    pullDownParents.setAttribute("style", "display:block;")
  })
  pullDownButton.addEventListener('mouseout', function(){
    pullDownParents.setAttribute("style", "display:none;")
  })
})