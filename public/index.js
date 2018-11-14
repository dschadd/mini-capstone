/* global axios */

axios.get("/api/products").then(function(response) {
  var products = response.data;
  console.log("the products are", products);

  var rocketTemplate = document.querySelector("#rocket-card");
  var rocketContainer = document.querySelector(".row");

  products.forEach(function(product) {
    var copiedContent = rocketTemplate.content.cloneNode(true);
    if (product.images[0]) {
      copiedContent.querySelector(".card-img-top").src =
        product.images[0].image_url;
    }
    copiedContent.querySelector(".card-title").innerText = product.name;
    copiedContent.querySelector(".card-text").innerText = product.description;
    rocketContainer.appendChild(copiedContent);
  });
});
