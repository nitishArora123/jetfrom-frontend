<!DOCTYPE html>
<html>
<head>
<title>Registration Form</title>
<%@include file="/cdns.jsp" %>
<!-- body  -->
<body>
	<div id="form-container" class="format" align="left">
		<form id="jetform">
			<h2>
				<center>File Create Form</center>
			</h2>
          	<a class = "button" href = "view-list.jsp">List of Employees</a>
			<div id="input-fields"></div>
		</form>
	</div>
</body> 

<!-- style  -->
<style>
<%@include file="/WEB-INF/view/style/style.css"%>
</style>

<script>
	var FormFields = {
		"urls": [
			{
				"type": "post",
				"id": "save",
				"name": "save",
				"label": "Save",
				"url": "http://localhost:8082/api/v1/user"
			},
			{
				"type": "get",
				"id": "get",
				"name": "get",
				"label": "Get",
				"url": ""
			},
			{
				"type": "put",
				"id": "put",
				"name": "put",
				"label": "Update",
				"url": ""
			}
			
		],
		"fields": [
			{
			    "name": "groupId",
			    "type": "text",
			    "label" : "Group ID",
			    "name" : "",
			    "id" : "",
			    "required" : true
			  },
			  {
			    "name": "companyId",
			    "type": "text",
			    "label" : "Company ID",
			    "name" : "",
			    "id" : "",
			    "required" : true
			  },
			  {
			    "name": "userId",
			    "type": "text",
			    "label" : "User ID",
			    "name" : "",
			    "id" : "",
			  },
			  {
			    "name": "userName",
			    "type": "text",
			    "label" : "Username",
			    "name" : "",
			    "id" : "",
			    "required" : true
			  },
			  {
				    "name": "createDate",
				    "type": "date",
				    "label": "Create Date",
				    "id": "createDate",
				    "name": "createDate"
				},
				{
				    "name": "modifiedDate",
				    "type": "date",
				    "label": "Modified Date",
				    "id": "modifiedDate",
				    "name": "modifiedDate"
				},
				{
				    "name": "nature",
				    "type": "select",
				    "label": "Nature",
				    "id": "nature",
				    "name": "nature",
				    "provider": {
				        "url": "https://mocki.io/v1/6e76eae7-a3b1-44cb-8e75-4526106568b7",
				        "id": "natures"
				    },
				    "options": [
				        {"value": "1", "label": "Option 1"},
				        {"value": "2", "label": "Option 2"},
				        {"value": "3", "label": "Option 3"}
				    ]
				},
				{
				    "name": "type",
				    "type": "select",
				    "label": "Type",
				    "id": "type",
				    "name": "type",
				    "provider": {
				        "url": "https://mocki.io/v1/6e76eae7-a3b1-44cb-8e75-4526106568b7",
				        "id": "types"
				    },
				    "options": [
				        {"value": "1", "label": "Option 1"},
				        {"value": "2", "label": "Option 2"},
				        {"value": "3", "label": "Option 3"}
				    ]
				},
				{
				    "name": "headId",
				    "type": "select",
				    "label": "Head ID",
				    "id": "headId",
				    "name": "headId",
				    "provider": {
				        "url": "https://mocki.io/v1/6e76eae7-a3b1-44cb-8e75-4526106568b7",
				        "id": "headids"
				    },
				    "options": [
				        {"value": "1", "label": "Option 1"},
				        {"value": "2", "label": "Option 2"},
				        {"value": "3", "label": "Option 3"}
				    ]
				},
				{
				    "name": "fileCodeId",
				    "type": "select",
				    "label": "File Code ID",
				    "id": "fileCodeId",
				    "name": "fileCodeId",
				    "provider": {
				        "url": "https://mocki.io/v1/6e76eae7-a3b1-44cb-8e75-4526106568b7",
				        "id": "filecodeids"
				    },
				    "options": [
				        {"value": "1", "label": "Option 1"},
				        {"value": "2", "label": "Option 2"},
				        {"value": "3", "label": "Option 3"}
				    ]
				},
			  {
			    "name": "subject",
			    "type": "text",
			    "label" : "Subject",
			    "id" : "",
			    "name" : ""
			  },
			  {
			    "name": "fileNo",
			    "type": "text",
			    "label" : "File No ",
			    "id" : "",
			    "name" : ""
			  },
			  {
				    "name": "categoryId",
				    "type": "select",
				    "label": "Category ID",
				    "id": "categoryId",
				    "name": "categoryId",
				    "provider": {
				        "url": "https://mocki.io/v1/6e76eae7-a3b1-44cb-8e75-4526106568b7",
				        "id": "categoryId"
				    },
				    "options": [
				        {"value": "1", "label": "Option 1"},
				        {"value": "2", "label": "Option 2"},
				        {"value": "3", "label": "Option 3"}
				    ]
				},
			  {
			    "name": "remarks",
			    "type": "text",
			    "label" : "Remarks",
			    
			    "id" : ""
			  },
			  {
			    "name": "reference",
			    "type": "text",
			    "label" : "Reference",
			    "id" : ""
			  },
			  {
			    "name": "year",
			    "type": "text",
			    "label" : "Year",
			    "id" : ""
			  },
			  {
				    "name": "userPostId",
				    "type": "select",
				    "label": "User Post ID",
				    "id": "userPostId",
				    "name": "userPostId",
				    "provider": {
				        "url": "https://mocki.io/v1/6e76eae7-a3b1-44cb-8e75-4526106568b7",
				        "id": "userPostId"
				    },
				    "options": [
				        {"value": "1", "label": "Option 1"},
				        {"value": "2", "label": "Option 2"},
				        {"value": "3", "label": "Option 3"}
				    ]
				},
			  {
			    "name": "currentUser",
			    "type": "text",
			    "label" : "Current User",
			    "id" : ""
			  },
			  {
			    "name": "currentState",
			    "type": "text",
			    "label" : "Current State",
			    "id" : ""
			  },
			  {
			    "name": "dealingOrganizationId",
			    "type": "text",
			    "label" : "Dealing Organization Id",
			    "id" : ""
			  }
		],
		"actions": [
			{
				"name": "update",
				"type": "submit",
				"label": "Update",
				"applyto": ""
			},
			{
				"name": "save",
				"type": "submit",
				"label": "Save",
				"applyto": ""
			}
		],
		"headers" : [
			{
				"label": "Type"
			},{
			"label" : "Subject"
			},{
			"label":"FileNo"
			},{
				"label":"Category Id"
			},
			{
				"label" : "Remarks"
			},{
			"label" : "Actions"
			}
			]
	};
</script>
<%@include file="/form-template.jsp" %>
<%@include file="/list-template.jsp" %>
</html>