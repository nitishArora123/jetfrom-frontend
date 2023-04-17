<!-- templates  -->
<script id="jf-text-template" type="text/x-handlebars-template">          
  <div class="form-group">
    <label for="{{name}}">{{label}}</label>
    <input type="{{type}}" class="form-control" name="{{name}}" id="{{name}}" value="{{value}}" {{#if required}}required{{/if}}>
  </div>
</script>

<script id="jf-date-template" type="text/x-handlebars-template">
  <div class="form-group">
    <label for="{{name}}">{{label}}</label>
    <input type="{{type}}" class="form-control" name="{{name}}" id="{{name}}" value="{{value}}">
  </div>
</script>

<script id="jf-button-template" type="text/x-handlebars-template">
  <button id="{{id}}" type="{{type}}" class="btn btn-primary" url="{{url}}" onclick="submitForm(event)">{{label}}</button>
</script>


<script id="jf-email-template" type="text/x-handlebars-template">
  <div class="form-group">
    <label for="{{name}}">{{label}}</label>
    <input type="{{type}}" class="form-control" name="{{name}}" id="{{name}}" value="{{value}}">
  </div>
</script>

<script id="jf-password-template" type="text/x-handlebars-template">
  <div class="form-group">
    <label for="{{name}}">{{label}}</label>
    <input type="{{type}}" class="form-control" name="{{name}}" id="{{name}}" value="{{value}}"  minlength="{{minLength}}">
  </div>
</script>

<script id="jf-number-template" type="text/x-handlebars-template">
  <div class="form-group">
    <label for="{{name}}">{{label}}</label>
    <input type="{{type}}" class="form-control" name="{{name}}" id="{{name}}" value="{{value}}" maxlength="{{maxlength}}">
  </div>
</script>


<script id="jf-radio-template" type="text/x-handlebars-template">
  <div class="form-group">
    <label>{{label}}</label><br>
    <input type="{{type}}" name="{{name}}" value="Yes"> Yes<br>
    <input type="{{type}}" name="{{name}}" value="No"> No<br>
  </div>
</script>

<script id="jf-checkbox-template" type="text/x-handlebars-template">
  <div class="form-group">
    <label for="{{id}}">{{label}}</label>
    <div>
      <input type="checkbox" name="{{name}}" id="{{id}}" data-provider="{{provider.url}}" data-provider-id="{{provider.id}}">
    </div>
  </div>
</script>

<script id="jf-select-template" type="text/x-handlebars-template">
	<div class="form-group">	
		<label for="{{name}}">{{label}}</label>
		<select name="{{name}}" id="{{id}}">
		</select>
	</div>
</script>

<script id="jf-put-template" type="text/x-handlebars-template">
	 <button id="{{id}}" type="{{type}}" class="btn btn-primary" url="{{url}}" onclick="submitForm(event)">{{label}}</button>
</script>

<script id="jf-post-template" type="text/x-handlebars-template">
	   <button id="{{id}}" type="{{type}}" class="btn btn-primary" url="{{url}}" onclick="submitForm(event)">{{label}}</button>
</script>

<script id="jf-get-template" type="text/x-handlebars-template">
	 <button id="{{id}}" type="{{type}}" class="btn btn-primary" url="{{url}}" onclick="submitForm(event)">{{label}}</button>
</script>


<!-- script -->
<script>
$(document).ready(function() {
	setTimeout(() => {
		FormFields.fields.forEach((data, index) => {
			//  console.log(JSON.stringify(data))
		    if (data.type == "select" && (data.provider !== "" || data.provider !== undefined || data.provider !== null)) {
		      var selectId = data.id;
		      var provider = {
		        "url": data.provider.url,
		        "id": data.provider.id,
		        "value": data.provider.value,
		        "options": data.provider.options,
		      };
		      if (provider.url.length !== 0) {
		        $.ajax({
		          type: "GET",
		          url: provider.url,
		          dataType: "json",
		          contentType: "application/json",
		        })
		          .done(function(data) {
		            $.each(data, function(key, value) {
		              name = value.name;
		              text = value.id;
		              $("#" + selectId).append(new Option(name, text));
		              if (provider.value !== null && text == provider.value) {
		                $("select option[value='" + text + "']").attr("selected","selected");
		              }
		            });
		          })
		          .fail(function(data) {
		            console.log(data);
		          });
		      } else {
		        provider.options.forEach((option) => {
		        	if(data.value === option.id){
		        		$('#'+selectId).append("<option value='"+option.id+"' selected>"+option.label+"</option>")
		        	}else{
		        		$('#'+selectId).append("<option value='"+option.id+"'>"+option.label+"</option>")	
		        	}
		        });
		      }
		    }
		  });
	}, 1000);
});
</script>

<script>
$(document).ready(function() {
	FormFields.fields.forEach(data => {
	    if (data.type == "checkbox" && data.provider !== "") {
	      var checkboxId = data.id;
	      var provider = {
	        "url": data.provider.url,
	        "id": data.provider.id,
	      };
	      if (provider.url.length !== 0) {
	        $.ajax({
	          type: "GET",
	          url: provider.url,
	          dataType: "json",
	          contentType: "application/json"
	        })
	        .done(function(data) {
	          $.each(data, function(key, value){
	            $("#" + checkboxId).closest(".form-group").append("<input type='checkbox'"   + key + "'>" + value + "<br>");
	          })
	        })
	        .fail(function(data) {
	          console.log(data); 
	        });
	      }
	    }
	  });
	});
</script>

<!-- submit user form  -->
<script>
function submitForm(event) {
	  event.preventDefault();
	  var form_data = $('#jetform').serializeArray();
	  var url = '';
	  // find the correct URL
	  for (var i = 0; i < FormFields.urls.length; i++) {
	    if (FormFields.urls[i].type === 'POST') {
	      url = FormFields.urls[i].url;
	      break;
	    }
	  }
	  // create form data object
	  var formData = {};
	  for (var i = 0; i < form_data.length; i++) {
	    formData[form_data[i].name] = form_data[i].value;
	  }

}

</script>

 <!-- script  -->
<script>
  const templates = {            //object for mapping object to id
    text: '#jf-text-template',
    date: '#jf-date-template',
    submit: '#jf-button-template',
    email: '#jf-email-template',
    password: '#jf-password-template',
    number: '#jf-number-template',
    select : '#jf-select-template',
    radio: '#jf-radio-template',
    checkbox : '#jf-checkbox-template',
    post : '#jf-post-template',
    get : '#jf-get-template',
   put : '#jf-put-template'
  };

  $(document).ready(() => {
	  // Loop through urls array
	  FormFields.urls.forEach(url => {
	    const template = $(templates[url.type.toLowerCase()]).html();
	    const compiledTemplate = Handlebars.compile(template);
	    const html = compiledTemplate(url);
	    $('#input-fields').append(html);
	  });

	  // Loop through fields array
	  FormFields.fields.forEach(field => {
	    const template = $(templates[field.type]).html();
	    const compiledTemplate = Handlebars.compile(template);
	    const html = compiledTemplate(field);
	    $('#input-fields').append(html);
	  });
	});
</script>