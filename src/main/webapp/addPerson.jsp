<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/templates" %>    
<t:layout>
	<jsp:attribute name="styles">
		<!-- put your styles here -->
	</jsp:attribute>
	<jsp:attribute name="scripts">
		<script type="text/javascript" src="scripts/person/PersonViewModel.js"></script>	
		<script type="text/javascript">
			$(function(){
				var model = {
						name:'',
						surname:'',
						gender:'',
						birthday:'',
						email:'',
						age:0
				};
				var viewModel = new PersonViewModel(model);
				var data = ko.toJSON( {
	            	messege:'Dane z sieci'
	            });
				ko.applyBindings(viewModel);
				$('#bday').datepicker();
			})
		</script>
	</jsp:attribute>
	<jsp:body>
		
		<div class="form-group">
		<label>Imię <input class="form-control" type="text" data-bind="value: name"/></label>
		</div>
		<div class="form-group">
		<label>Nazwisko <input class="form-control" type="text" data-bind="value: surname"/></label>
		</div><div class="form-group"></div>
		<div class="form-group">
		<label>Email <input class="form-control" type="text" data-bind="value: email"/></label>
		</div><div class="form-group">
		<label>Płeć <select class="form-control" type="text" data-bind="value: gender">
			<option value="Male">M</option>
			<option value="Female">K</option>
		</select></label>
		</div>
		<div class="form-group">
		<label>Wiek <input class="form-control" type="text" data-bind="value: age"/></label><br/></div>
		<div class="form-group">
		<label>Data urodzin <input class="form-control" type="text" id="bday" data-bind="value: birthday"/></label><br/>
		</div>
		<div class="form-group">
		<button class="btn btn-primary btn-xs" data-bind="click:show">Pokaż json</button><br/>
		</div>
		<div class="form-group"><button class="btn btn-success"  data-bind="click:add">Dodaj</button><br/>
		</div>
		
	</jsp:body>
	
</t:layout>