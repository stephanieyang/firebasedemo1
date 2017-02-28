<users>
	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4" id="users">
		<!-- <form action={ uploadFile } enctype="multipart/form-data">
			<input type="text" name="filename"> -->>
			<input type="text" name="usernameSubmit" id="usernameSubmit" placeholder="username"><br />
			<button role="button" type="button" onclick={ submitInfo }>Submit</button><br />
			<!-- <button type="submit">Upload File</button>
		</form> -->
		<div class="row">
			<div class="col-md-12">
    			<recipe each={ recipe in recipes }></recipe>
			</div>
		</div>
	</div>
	<script>
		var dataRef = firebase.database().ref();
		var categoryDataRef = dataRef.child("categoryData");
		this.recipes = [];
		var that = this;



		this.submitInfo = function(event) {
			var username = document.getElementById("usernameSubmit").value;
			userIngredRef = dataRef.child("recipeData/user/" + username);
			// userIngredRef.once('value', function(snap) {
			// 	console.log(snap.val());
			// });

			var recipes = [];



			userIngredRef.once('value', function(snap) {
				console.log(snap);
				console.log(snap.val());
				console.log(snap.key);
				var newRecipe;
				var ingredients = [];

				for(var key in snap.val()) {
					console.log(key);
					recipeRef = userIngredRef.child(key);
					recipeRef.once('value', function(snap) {
						newRecipe = snap.val();
					}).then(function() {
						recipeIngredRef = recipeRef.child("ingredients");
						ingredients = [];
						recipeIngredRef.once('value', function(ingredSnap) {
							var ingredientObjList = ingredSnap.val();
							for(var ingredKey in ingredientObjList) {
								ingredients.push(ingredientObjList[ingredKey]);
							}
						});
						newRecipe.ingredients = ingredients;
						newRecipe.key = key;
						recipes.push(newRecipe);
					});
				}
				console.log("Recipes:");
				console.log(recipes);
				that.recipes = recipes;
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
			});

			// console.log(username);
			// categoryDataRef.push({"name":username}, function(err) {
			// 	console.log(err).then(function() {
			//    		console.log("Push succeeded.");
			//   });
			// });
		};

	</script>
</users>