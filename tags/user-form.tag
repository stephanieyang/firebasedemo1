<user-form>
	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4" id="user-form">
		<!-- <form action={ uploadFile } enctype="multipart/form-data">
			<input type="text" name="filename"> -->>
			<input type="text" name="usernameSubmit" id="usernameSubmit" placeholder="username"><br />
			<button role="button" type="button" onclick={ submitInfo }>Submit</button><br />
			<!-- <button type="submit">Upload File</button>
		</form> -->
	</div>
	<script>
		var dataRef = firebase.database().ref();
		var categoryDataRef = dataRef.child("categoryData");

		this.submitInfo = function(event) {
			var username = document.getElementById("usernameSubmit").value;
			console.log(username);

		};

	</script>
</user-form>