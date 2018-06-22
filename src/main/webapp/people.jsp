<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/templates" %>    
<t:layout>
	<jsp:attribute name="styles">
		<!-- put your styles here -->
	</jsp:attribute>
	<jsp:attribute name="scripts">
		<script type="text/javascript" src="scripts/person/PersonViewModel.js"></script>
		<script type="text/javascript" src="scripts/person/PersonListViewModel.js"></script>
		<script type="text/javascript">
		$(function(){
		
	                var viewModel = new PersonListViewModel();
	                ko.applyBindings(viewModel);
	                $('.js-bday').datepicker();
	            
		});
		</script>
	
	</jsp:attribute>
	<jsp:body>
		<button class="btn" data-bind="click:getData">Pobierz dane</button><br/>
		<table class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>Imię</th>
                            <th>Nazwisko</th>
                            <th>Płeć</th>
                            <th>Email</th>
                            <th>Data urodzin</th>
                            <th>Wiek</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody data-bind="foreach: people">
                        <tr>
                            <td><span data-bind="text: id"></span></td>
                            <td><input type="text" class="form-control" data-bind="value: name"/></td>
                            <td><input type="text"  class="form-control"  data-bind="value: surname"/></td>
                            <td><select class="form-control" type="text" data-bind="value: gender">
									<option value="Male">M</option>
									<option value="Female">K</option>
								</select></td>
                            <td><input type="text"  class="form-control"  data-bind="value: email"/></td>
                            <td><input type="text"  class="form-control js-bday"  data-bind="value: birthday"/></td>
                            <td><input type="text"  class="form-control"  data-bind="value: age"/></td>
                            <td><button class="btn btn-danger btn-xs" data-bind="click:deleteMe">usuń</button>
                            <button class="btn btn-warning btn-xs" data-bind="click:updateMe">uaktualnij</button></td>
                        </tr>
                    </tbody>
                </table>
                    <div class="col-sm-1">
                        <button class="btn btn-success" data-bind="click:prev" > Poprzedni</button>
                    </div>
                    <div class="col-sm-1">
                        <input class="form-control" data-bind="value:page" /> 
                    </div>
                   

                    <div class="col-sm-1">
                        <button class="btn btn-success pull-right" data-bind="click:next">Następny</button>
                    </div>
	</jsp:body>
	
</t:layout>