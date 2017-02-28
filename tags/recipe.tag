<recipe>
	<div class="recipe">
		<h2>{ recipe.name }</h2>
		<img src='{ recipe.imageLink }' alt='image' />
		<h4>By { recipe.user }</h4>
		<div class="ingredients">
			<h3>Ingredients</h3>
			<ul>
				<li each={ ingredient in recipe.ingredientList }>{ ingredient }</li>
			</ul>
		</div>
		<div class="directions">
			<h3>Directions</h3>
			<p>{ recipe.directions }</p>
		</div>
		<div class="triedBy">
			<h3>Tried By</h3>
			<ul>
				<li each={ username in recipe.triedByUsers }>{ username }</li>
			</ul>
		</div>
		<div>
				<input type="text" name="triedUser" id="triedUser" placeholder="Tried By..."><br />
				<button role="button" type="button" onclick={ submitInfo }>Submit</button><br />
		</div>
	</div>
	<script>

		var dataRef = firebase.database().ref();
		var categoryDataRef = dataRef.child("categoryData");

		this.submitInfo = function(event) {
			var username = document.getElementById("triedUser").value;
			console.log(username);
			console.log(this.recipe.key);
			var userRef = dataRef.child("userData").orderByChild("name").equalTo(username);
			// this only works so long as all recipes by an author have unique names; adding recipe IDs would make this more scalable
			var userTriedListRef = dataRef.child("recipeData/user/" + this.recipe.user + "/" + this.recipe.key + "/" + "recipesTriedList");
			var categoryUserTriedListRef = dataRef.child("recipeData/user/" + this.recipe.user + "/" + this.recipe.key + "/" + "recipesTriedList");
			var recipeUsersTriedRef = dataRef.child("recipeData").orderByChild("name").equalTo(username).ref.child("usersTriedList");

			// userTriedListRef.push(this.recipe.name, function(err) {
			// 	if(err) {
			// 		console.log("Error: " + err);
			// 	}
			// }).then(function(result) {
			// 	recipeUsersTriedRef.push(username, function(err) {
			// 	if(err) {
			// 		console.log("Error: " + err);
			// 	}
			// 	})
			// });


		};

	</script>
</recipe>