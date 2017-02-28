<gallery>
	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4" id="gallery">
		Blah blah { recipeList }
    	<recipe each={ recipe in recipeList }></recipe>
	</div>
<script>
	var that = this;
	var dataRef = firebase.database().ref();
	this.recipeList = [];
	var categoryRef = dataRef.child("recipeData/category");

	categoryRef.once('value', function(catSnap) {
		var newRecipe;
		var ingredients = [];

		for(var catKey in catSnap.val()) {
			console.log("category key: " + catKey);
			recipeRef = categoryRef.child(catKey);
			recipeRef.once('value', function(snap) {
				newRecipe = snap.val();
				console.log(snap);
				console.log(snap.val());
				console.log("newRecipe =");
				console.log(newRecipe);
				that.recipeList.push(newRecipe);
			});
			// .then(function(x) {
			// 	console.log("x =");
			// 	console.log(x);
			// 	recipeIngredRef = recipeRef.child("ingredients");
			// 	ingredients = [];
			// 	recipeIngredRef.once('value', function(ingredSnap) {
			// 		var ingredientObjList = ingredSnap.val();
			// 		for(var ingredKey in ingredientObjList) {
			// 			ingredients.push(ingredientObjList[ingredKey]);
			// 		}
			// 	});
			// 	newRecipe.ingredients = ingredients;
			// 	newRecipe.key = newRecipe.key;
			// 	that.recipeList.push(newRecipe);
			// });
		}
		console.log("recipeList =");
		console.log(that.recipeList);
		that.update();

		// if(Object.getOwnPropertyNames("name: " + snap.val()).indexOf("name") > -1) {
		// 	console.log("singleton");
		// 	var propList = Object.keys(snap.val());
		// 	console.log(propList);
		// } else {
		// 	console.log("multiple");
		// 	for(var item in propList) {
		// 		console.log(item);
		// 	}
		// }
	}, function(err) {
		console.log(err);
	});
	// this.recipeList = [{
	// 	"name":"Cheese sandwich",
	// 	"user":"hankfreebird",
	// 	"ingredientList":["cheese","bread"],
	// 	"imageLink":"http://placehold.it/200x200",
	// 	"triedByUsers":["mariatorres","hankfreebird","tomoetachibana"],
	// }, {
	// 	"name":"Ham sandwich",
	// 	"user":"mariatorres",
	// 	"ingredientList":["cheese","bread"],
	// 	"imageLink":"http://placehold.it/250x250",
	// 	"triedByUsers":["erhardtmuller","naomikimishima","gabrielcunningham"],

	// }, {
	// 	"name":"Curry",
	// 	"user":"naomikimishima",
	// 	"ingredientList":["rice","spices","chicken","potatoes"],
	// 	"imageLink":"http://placehold.it/200x200",
	// 	"triedByUsers":["hankfreebird","gabrielcunningham","mariatorres"],

	// }];

	//this.imageList = [{"imageSrc":"http://placehold.it/200x200","imageId":"01"}, {"imageSrc":"http://placehold.it/250x250","imageId":"02"}];

	//this.user = firebase.auth().currentUser;

</script>
<style scoped>
	#gallery {
		overflow: scroll;
	}
</style>
</gallery>